import 'dart:async';

import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/healthicons.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';
import 'package:iconify_flutter/icons/mdi.dart';
import 'package:wajba/core/constants/constants.dart';
import 'package:wajba/features/Order_Tracking/data/timeline_data.dart';
import 'package:timelines/timelines.dart';
import 'dart:math';

const completeColor = wajbah_gray;
const inProgressColor = wajbah_primary;
const todoColor = Color(0xffd1d2d7);

List<Iconify> trackIcons = [
  Iconify(Mdi.chef_hat),
  Iconify(MaterialSymbols.cookie),
  Iconify(Mdi.motorbike),
  Iconify(Healthicons.yes)
];

class ProcessTimelinePage extends StatefulWidget {
  final List<Process> processes;

  const ProcessTimelinePage({super.key, required this.processes});
  @override
  _ProcessTimelinePageState createState() => _ProcessTimelinePageState();
}

class _ProcessTimelinePageState extends State<ProcessTimelinePage> {
  late List<Process> _processes;
  int _processIndex = 0;
  int _timerindex = 0;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _processes = widget.processes;
    startTimer();
  }

  void startTimer() {
    _timer = Timer.periodic(_time[_processIndex], (timer) {
      setState(() {
        _processIndex = (_processIndex + 1) % _processes.length;
        _timerindex = (_timerindex + 1) % _time.length;
        if (_processIndex == 0) {
          // Reset the timer if it reaches the end of the process list
          _timer.cancel();
          startTimer();
        } else {
          // Update the timer's duration with the new time for the next process
          _timer.cancel();
          startTimer();
        }
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel(); // Cancel the timer to avoid memory leaks
    super.dispose();
  }

  Color getColor(int index) {
    if (index == _processIndex) {
      return inProgressColor;
    } else if (index < _processIndex) {
      return completeColor;
    } else {
      return todoColor;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Timeline.tileBuilder(
      theme: TimelineThemeData(
        direction: Axis.horizontal,
        connectorTheme: ConnectorThemeData(
          space: 30.0,
          thickness: 5.0,
        ),
      ),
      builder: TimelineTileBuilder.connected(
        connectionDirection: ConnectionDirection.before,
        itemExtentBuilder: (_, __) =>
            MediaQuery.of(context).size.width / _processes.length,
        oppositeContentsBuilder: (context, index) {
          // insert above the icons
        },
        contentsBuilder: (context, index) {},
        indicatorBuilder: (_, index) {
          var color = getColor(index);

          return Iconify(
            trackIcon[index],
            color: index == _processIndex ? wajbah_primary : wajbah_gray,
            size: 50,
          );
        },
        connectorBuilder: (_, index, type) {
          if (index > 0) {
            if (index == _processIndex) {
              final prevColor = getColor(index - 1);
              final color = getColor(index);
              List<Color> gradientColors;
              if (type == ConnectorType.start) {
                gradientColors = [Color.lerp(prevColor, color, 0.5)!, color];
              } else {
                gradientColors = [
                  prevColor,
                  Color.lerp(prevColor, color, 0.5)!
                ];
              }
              return DotIndicator(
                size: 10,
                color: wajbah_gray,

                //decoration: BoxDecoration(
                //gradient: LinearGradient(
                //colors: gradientColors,
                //),
                //),
              );
            } else {
              return DotIndicator(
                color: getColor(index - 1),
                size: 10,
              );
            }
          } else {
            return null;
          }
        },
        itemCount: _processes.length,
      ),
    );
  }
}

final _processes = [
  'Prospect',
  'Tour',
  'Offer',
  'Contract',
];
final _time = [
  Duration(seconds: 1),
  Duration(seconds: 5),
  Duration(seconds: 6),
  Duration(seconds: 1),
];
