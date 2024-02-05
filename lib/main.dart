import 'package:flutter/material.dart';
import 'package:wajba/features/Authentication/presentations/views/login_view/login_view.dart';
import 'package:wajba/features/Authentication/presentations/views/permissions_view/views/allow_location.dart';
import 'package:wajba/features/Authentication/presentations/views/permissions_view/views/allow_notification.dart';
import 'package:wajba/features/Authentication/presentations/views/permissions_view/views/app_share.dart';
import 'package:wajba/features/Authentication/presentations/views/permissions_view/views/email_verification_view.dart';
import 'package:wajba/features/Authentication/presentations/views/permissions_view/views/password_changed.dart';
import 'package:wajba/features/Authentication/presentations/views/signup_view/signup_view.dart';
import 'package:wajba/features/OnBoarding/presentations/view/onboarding.dart';

import 'features/Authentication/presentations/views/ResetPassword/reset_password.dart';

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
      routes: {
        "Onboarding": (context) => const OnBoardingScreen(),
        "login": (context) => const LoginView(),
        "register": (context) => const RegisterView(),
        "Allow notification": (context) => const AllowNotification(),
        "Allow location": (context) => const AllowLocation(),
        "Password changed": (context) => const PasswordChanged(),
        "App share": (context) => const ShareApp(),
        "reset password": (context) => const ResetPassword(),
      },
    );
  }
}