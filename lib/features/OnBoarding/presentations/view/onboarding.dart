import 'package:flutter/material.dart';
import 'package:wajba/features/OnBoarding/presentations/view/widgets/onboarding_body.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: OnBoardingBody(),
    );
  }
}
