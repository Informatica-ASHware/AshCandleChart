import 'package:flutter/material.dart' hide Viewport;
import 'package:flutter/gestures.dart';
import 'package:kchart_core/kchart_core.dart';
import 'controller.dart';
import 'gestures/gesture_arbiter.dart';
import 'painting/crosshair_painter.dart';
import 'panels/panel_stack.dart';
import 'widgets/kchart_scope.dart';
import 'interaction/replay/replay_slider.dart';
import 'package:flutter/physics.dart';
import 'theme.dart';
import 'i18n/number_formatters.dart';

/// The main KChart widget.
///
/// Displays financial charts using a [KChartController].
/// Supports multiple panels (Main, Volume, RSI) with draggable dividers.
class KChart extends StatefulWidget {
  /// The controller for this chart.
  final KChartController controller;

  /// The theme to use for the chart. If null, uses [ChartTheme.light()].
  final ChartTheme? theme;

  /// The locale to use for formatting numbers. If null, uses 'en_US'.
  final String? locale;

  /// Creates a [KChart] with the given [controller].
  const KChart({super.key, required this.controller, this.theme, this.locale});

  @override
  State<KChart> createState() => _KChartState();
}

class _KChartState extends State<KChart> with SingleTickerProviderStateMixin {
  late final GestureArbiter _arbiter;
  final GlobalKey _chartKey = GlobalKey();

  late final AnimationController _animationController;
  Simulation? _flingSimulation;
  double _lastAnimationValue = 0.0;
  Size? _lastSize;

  String? _activeAnnotationId;
  int? _activePointIndex; // 0 for start, 1 for end

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this);

    _arbiter = GestureArbiter(
      onPanUpdate: (delta) {
        if (_activeAnnotationId != null) return;
        _stopAnimation();
        widget.controller.pan(delta.dx, _lastSize?.width ?? 0.0);
      },
      onFling: (velocity) {
        if (_activeAnnotationId != null) return;
        _handleFling(velocity);
      },
      onZoomUpdate: (scale, focalPoint) {
        if (_activeAnnotationId != null) return;
        _stopAnimation();
        widget.controller.zoom(scale, focalPoint.dx, _lastSize?.width ?? 0.0);
      },
      onLongPressStart: (position) {
        _updateCrosshair(position);
      },
      onLongPressEnd: () {
        widget.controller.crosshair.clear();
      },
      onPointerUp: () {
        if (_activeAnnotationId == null && !_animationController.isAnimating) {
          _snapToCandle();
        }
      },
      onTap: (position) {
        _handleTap(position);
      },
    );
  }

  void _handleTap(Offset position) {
    final size = _lastSize ?? Size.zero;
    if (size.isEmpty) return;

    // Basic hit testing for line ends
    final annotations = widget.controller.frame.annotations.annotations;

    // To hit test, we need to convert points to pixels
    // This is a bit redundant with painter logic, maybe move to controller or utility
    final series = widget.controller.frame.series;
    final viewport = widget.controller.frame.viewport;
    final int startIdx = viewport.startIdx.clamp(0, series.length - 1);
    final int endIdx = viewport.endIdx.clamp(0, series.length - 1);
    final int visibleCount = endIdx - startIdx + 1;
    final double candleWidth = size.width / visibleCount;

    double minPrice = double.infinity;
    double maxPrice = double.negativeInfinity;
    for (int i = startIdx; i <= endIdx; i++) {
      if (series.low[i] < minPrice) minPrice = series.low[i];
      if (series.high[i] > maxPrice) maxPrice = series.high[i];
    }
    if (minPrice == maxPrice) {
      minPrice -= 1.0;
      maxPrice += 1.0;
    }
    final double priceRange = maxPrice - minPrice;

    double priceToY(double price) =>
        size.height - ((price - minPrice) / priceRange * size.height);
    double timestampToX(int timestamp) {
      int low = 0;
      int high = series.timestamps.length - 1;
      int idx = series.timestamps.length;
      while (low <= high) {
        final int mid = low + ((high - low) >> 1);
        if (series.timestamps[mid] == timestamp) {
          idx = mid;
          break;
        }
        if (series.timestamps[mid] < timestamp) {
          low = mid + 1;
        } else {
          high = mid - 1;
        }
      }
      if (idx == series.timestamps.length) idx = low;
      return (idx - startIdx) * candleWidth + candleWidth / 2;
    }

    const double hitBoxSize = 20.0; // Expanded hitboxes for touch

    for (final annotation in annotations) {
      if (annotation is TrendLine) {
        final p1 = Offset(
          timestampToX(annotation.start.timestamp),
          priceToY(annotation.start.price),
        );
        final p2 = Offset(
          timestampToX(annotation.end.timestamp),
          priceToY(annotation.end.price),
        );

        if ((position - p1).distance <= hitBoxSize) {
          setState(() {
            _activeAnnotationId = annotation.id;
            _activePointIndex = 0;
          });
          return;
        }
        if ((position - p2).distance <= hitBoxSize) {
          setState(() {
            _activeAnnotationId = annotation.id;
            _activePointIndex = 1;
          });
          return;
        }
      }
    }

    // If tapped elsewhere and editing, stop editing
    if (_activeAnnotationId != null) {
      setState(() {
        _activeAnnotationId = null;
        _activePointIndex = null;
      });
    } else {
      // Start new drawing if not hitting anything
      final id = 'trendline_${DateTime.now().millisecondsSinceEpoch}';
      final point = widget.controller.pixelToPoint(position, size);
      widget.controller.setAnnotation(
        Annotation.trendLine(id: id, start: point, end: point),
      );
      setState(() {
        _activeAnnotationId = id;
        _activePointIndex = 1;
      });
    }
  }

  void _updateCrosshair(Offset localPosition) {
    final size = _lastSize ?? Size.zero;
    if (size.isEmpty) return;

    final series = widget.controller.frame.series;
    final viewport = widget.controller.frame.viewport;
    final int startIdx = viewport.startIdx.clamp(0, series.length - 1);
    final int endIdx = viewport.endIdx.clamp(0, series.length - 1);
    final int visibleCount = endIdx - startIdx + 1;
    final double candleWidth = size.width / visibleCount;

    final double relativeIdx = localPosition.dx / candleWidth;
    final int index = (startIdx + relativeIdx.floor()).clamp(
      0,
      series.length - 1,
    );
    final int timestamp = series.timestamps[index];

    // Snapped dx to candle center
    final double snappedDx = (index - startIdx) * candleWidth + candleWidth / 2;

    // Price calculation (only if it's over the main panel)
    // For now, we use a simple heuristic: if it's in the top 3/4 of the chart
    // But since we have pixelToPoint in controller, we should use it.
    // Note: pixelToPoint assumes size of the main panel.
    final point = widget.controller.pixelToPoint(localPosition, size);

    widget.controller.crosshair.update(
      CrosshairState(
        dx: snappedDx,
        dy: localPosition.dy, // Relative to KChart widget
        timestamp: timestamp,
        price: point.price,
      ),
    );
  }

  void _handlePointerMove(PointerMoveEvent event) {
    final size = _lastSize ?? Size.zero;
    if (_activeAnnotationId != null && _activePointIndex != null) {
      final annotations = widget.controller.frame.annotations.annotations;
      final annotation = annotations.firstWhere(
        (a) => a.id == _activeAnnotationId,
      );
      final newPoint = widget.controller.pixelToPoint(
        event.localPosition,
        size,
      );

      if (annotation is TrendLine) {
        if (_activePointIndex == 0) {
          widget.controller.setAnnotation(annotation.copyWith(start: newPoint));
        } else {
          widget.controller.setAnnotation(annotation.copyWith(end: newPoint));
        }
      }
    }

    if (event.kind == PointerDeviceKind.mouse) {
      _updateCrosshair(event.localPosition);
    }
  }

  void _stopAnimation() {
    _animationController.stop();
    _flingSimulation = null;
  }

  void _handleFling(Velocity velocity) {
    _stopAnimation();

    final size = _lastSize;
    if (size == null) return;

    final double vx = velocity.pixelsPerSecond.dx;
    if (vx.abs() < 100) {
      _snapToCandle();
      return;
    }

    _lastAnimationValue = 0.0;
    _flingSimulation = FrictionSimulation(0.135, 0.0, vx);

    _animationController.addListener(_flingTick);
    _animationController.animateWith(_flingSimulation!).then((_) {
      if (mounted) {
        _animationController.removeListener(_flingTick);
        _flingSimulation = null;
        _snapToCandle();
      }
    });
  }

  void _flingTick() {
    if (_flingSimulation == null) return;
    final elapsedDuration = _animationController.lastElapsedDuration;
    if (elapsedDuration == null) return;

    final elapsed =
        elapsedDuration.inMicroseconds / Duration.microsecondsPerSecond;
    final double currentValue = _flingSimulation!.x(elapsed);
    final double delta = currentValue - _lastAnimationValue;
    _lastAnimationValue = currentValue;

    widget.controller.pan(delta, _lastSize?.width ?? 0.0);
  }

  void _snapToCandle() {
    final viewport = widget.controller.frame.viewport;
    if (viewport.scrollX == 0) return;

    final size = _lastSize;
    if (size == null) return;

    final int visibleCount = viewport.endIdx - viewport.startIdx + 1;
    final double candleWidth = size.width / visibleCount;

    double targetDelta;
    if (viewport.scrollX > candleWidth / 2) {
      targetDelta = candleWidth - viewport.scrollX;
    } else if (viewport.scrollX < -candleWidth / 2) {
      targetDelta = -candleWidth - viewport.scrollX;
    } else {
      targetDelta = -viewport.scrollX;
    }

    if (targetDelta == 0) return;

    _lastAnimationValue = 0.0;
    final Animation<double> animation =
        Tween<double>(begin: 0.0, end: targetDelta).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeOutCubic,
      ),
    );

    void snapTick() {
      final double currentValue = animation.value;
      final double delta = currentValue - _lastAnimationValue;
      _lastAnimationValue = currentValue;
      widget.controller.pan(delta, size.width);
    }

    _animationController.duration = const Duration(milliseconds: 200);
    _animationController.addListener(snapTick);
    _animationController.forward(from: 0.0).then((_) {
      if (mounted) {
        _animationController.removeListener(snapTick);
      }
    });
  }

  @override
  void dispose() {
    _arbiter.dispose();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        _lastSize = Size(constraints.maxWidth, constraints.maxHeight);
        return ListenableBuilder(
          listenable: widget.controller,
          builder: (context, child) {
            final theme = widget.theme ??
                (Theme.of(context).brightness == Brightness.dark
                    ? ChartTheme.dark()
                    : ChartTheme.light());
            return Listener(
              onPointerDown: _arbiter.handleEvent,
              onPointerMove: (event) {
                _handlePointerMove(event);
                _arbiter.handleEvent(event);
              },
              onPointerUp: _arbiter.handleEvent,
              onPointerCancel: _arbiter.handleEvent,
              onPointerSignal: (event) {
                if (event is PointerScrollEvent) {
                  _arbiter.handleEvent(event);
                }
              },
              onPointerPanZoomStart: _arbiter.handleEvent,
              onPointerPanZoomUpdate: _arbiter.handleEvent,
              onPointerPanZoomEnd: _arbiter.handleEvent,
              child: KChartScope(
                chartKey: _chartKey,
                theme: theme,
                formatters: ChartNumberFormatters(
                  widget.locale ??
                      Localizations.maybeLocaleOf(context)?.toString() ??
                      'en_US',
                ),
                child: Container(
                  color: theme.backgroundColor,
                  child: MouseRegion(
                    key: _chartKey,
                    cursor: SystemMouseCursors.precise,
                    onExit: (_) => widget.controller.crosshair.clear(),
                    child: Stack(
                      children: [
                        Column(
                          children: [
                            Expanded(
                              child: PanelStack(
                                panels: widget.controller.panels,
                                onResize: (index, delta) {
                                  widget.controller.resizePanels(
                                    index,
                                    delta,
                                    constraints.maxHeight,
                                  );
                                },
                              ),
                            ),
                            if (widget.controller.replayCoordinator != null)
                              ReplaySlider(
                                coordinator:
                                    widget.controller.replayCoordinator!,
                              ),
                          ],
                        ),
                        ValueListenableBuilder<CrosshairState?>(
                          valueListenable: widget.controller.crosshair.state,
                          builder: (context, state, child) {
                            if (state == null || state.dx == null) {
                              return const SizedBox.shrink();
                            }
                            final scope = KChartScope.of(context);
                            return IgnorePointer(
                              child: CustomPaint(
                                size: Size.infinite,
                                painter: CrosshairPainter(
                                  state: CrosshairState(dx: state.dx),
                                  color: scope?.theme.crosshairColor ??
                                      Colors.grey,
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
