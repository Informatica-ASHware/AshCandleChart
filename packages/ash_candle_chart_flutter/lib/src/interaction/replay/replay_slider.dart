import 'package:flutter/material.dart';
import 'replay_coordinator.dart';

/// A UI controller for the replay mode.
///
/// Includes play/pause, speed selector, and a slider to scrub through history.
class ReplaySlider extends StatelessWidget {
  /// The coordinator managing the replay state.
  final ReplayCoordinator coordinator;

  /// Creates a [ReplaySlider].
  const ReplaySlider({super.key, required this.coordinator});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: coordinator,
      builder: (context, child) {
        final fullFrame = coordinator.fullFrame;
        if (fullFrame == null) return const SizedBox.shrink();

        final timestamps = fullFrame.series.timestamps;
        if (timestamps.isEmpty) return const SizedBox.shrink();

        final currentTimestamp =
            coordinator.currentTimestamp ?? timestamps.last;
        final firstTimestamp = timestamps.first;
        final lastTimestamp = timestamps.last;

        return Container(
          height: 60,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          // ignore: deprecated_member_use
          color: Colors.black.withOpacity(0.8),
          child: Row(
            children: [
              IconButton(
                icon: Icon(
                  coordinator.state == ReplayState.playing
                      ? Icons.pause
                      : Icons.play_arrow,
                  color: Colors.white,
                ),
                onPressed: () {
                  if (coordinator.state == ReplayState.playing) {
                    coordinator.pause();
                  } else {
                    coordinator.play();
                  }
                },
              ),
              const SizedBox(width: 8),
              DropdownButton<double>(
                value: coordinator.speed,
                dropdownColor: Colors.black,
                style: const TextStyle(color: Colors.white),
                items: [1.0, 2.0, 5.0, 10.0].map((speed) {
                  return DropdownMenuItem<double>(
                    value: speed,
                    child: Text('${speed}x'),
                  );
                }).toList(),
                onChanged: (value) {
                  if (value != null) coordinator.setSpeed(value);
                },
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Slider(
                  value: currentTimestamp.toDouble().clamp(
                        firstTimestamp.toDouble(),
                        lastTimestamp.toDouble(),
                      ),
                  min: firstTimestamp.toDouble(),
                  max: lastTimestamp.toDouble(),
                  onChanged: (value) {
                    coordinator.scrub(value.round());
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
