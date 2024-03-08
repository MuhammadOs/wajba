import 'package:flutter/material.dart';
import 'package:wajba/constants/constants.dart';
import 'package:wajba/core/styles.dart';

class ReferAndEarnObjective extends StatefulWidget {
  const ReferAndEarnObjective({
    super.key,
    required this.width,
    required this.height,
    required this.icon,
    required this.task,
    required this.remaining,
    required this.controller,
    required this.total,
  });

  final double width;
  final double height;
  final IconData icon;
  final String task;
  final String remaining;
  final AnimationController controller;
  final int total;

  @override
  State<ReferAndEarnObjective> createState() => _ReferAndEarnObjectiveState();
}

class _ReferAndEarnObjectiveState extends State<ReferAndEarnObjective> {
  @override
  void initState() {
    super.initState();
    // Initialize the progress value when the widget is created
    calculateProgressValue();
  }

  @override
  void didUpdateWidget(covariant ReferAndEarnObjective oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Update the progress value when the remaining value changes
    if (widget.remaining != oldWidget.remaining) {
      calculateProgressValue();
    }
  }

  void calculateProgressValue() {
    int remaining = int.tryParse(widget.remaining) ?? 0;
    int total = widget.total;

    // Calculate the progress value
    double newProgressValue =
        remaining == 0 ? 1.0 : (total - remaining) / total;

    // Set the new progress value and update the state
    setState(() {
      widget.controller.value = newProgressValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width * 0.4,
      height: widget.height * 0.23,
      decoration: BoxDecoration(
        color: wajbah_white.withOpacity(0.1),
        border: Border.all(color: wajbah_gray.withOpacity(0.6)),
        borderRadius: BorderRadius.circular(23),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: widget.width * 0.12,
            height: widget.height * 0.07,
            decoration: BoxDecoration(
                color: wajbah_buttons, borderRadius: BorderRadius.circular(30)),
            child: Icon(
              widget.icon,
              color: wajbah_primary,
            ),
          ),
          SizedBox(
            height: widget.height * 0.013,
          ),
          Text(
            widget.task,
            textAlign: TextAlign.center,
            style: Styles.titleSmall.copyWith(fontSize: 12),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: LinearProgressIndicator(
              color: wajbah_primary,
              value: widget.controller.value,
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          Text(
            '${widget.remaining}\tRemaining',
            style: Styles.titleSmall.copyWith(fontSize: 12, color: wajbah_gray),
          ),
        ],
      ),
    );
  }
}
