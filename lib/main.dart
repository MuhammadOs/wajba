import 'package:flutter/material.dart';
import 'package:wajba/features/OnBoarding/presentations/view/onboarding.dart';

void main() {
  runApp(const WajbahUser());
}

class WajbahUser extends StatelessWidget {
  const WajbahUser({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: "Biryani"),
      debugShowCheckedModeBanner: false,
      home: const OnBoardingScreen(),
    );
  }
}
