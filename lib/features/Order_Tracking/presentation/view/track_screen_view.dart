import 'package:flutter/material.dart';
import 'package:wajba/features/Order_Tracking/presentation/view/track_screen_body.dart';

class TrackScreenView extends StatelessWidget {
  const TrackScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: TrackScreenBody(),
    );
  }
}
