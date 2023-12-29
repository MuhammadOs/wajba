import 'package:flutter/material.dart';
import 'package:wajba/features/Authentication/presentations/views/login_view.dart';
import 'package:wajba/features/Authentication/presentations/views/signup_view.dart';
import 'package:wajba/features/OnBoarding/presentations/view/onboarding.dart';

void main() {
  runApp(const WajbahUser());
}

class WajbahUser extends StatelessWidget {
  const WajbahUser({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: "Biryani", backgroundColor: Colors.white),
      debugShowCheckedModeBanner: false,
      home: const OnBoardingScreen(),
      routes: {
        "Onboarding": (context) => const OnBoardingScreen(),
        "login": (context) => const LoginView(),
        "signup": (context) => const SignUpView()
      },
    );
  }
}
