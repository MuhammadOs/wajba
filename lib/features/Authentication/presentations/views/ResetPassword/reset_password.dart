import 'package:flutter/material.dart';
import 'package:wajba/core/constants/constants.dart';
import 'package:wajba/core/sizeConfig.dart';
import 'package:wajba/features/Authentication/presentations/views/widgets/custom_button.dart';
import 'package:wajba/features/Authentication/presentations/views/widgets/hint_text.dart';

import '../../../../../core/styles.dart';
import '../widgets/password_text_field.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _PasswordChangedState();
}

class _PasswordChangedState extends State<ResetPassword> {
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();
  bool isPassword = true;
  bool isConfirmPassword = true;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double width = SizeConfig.screenW!;
    double height = SizeConfig.screenH!;
    debugPrint("$width");
    debugPrint("$height");
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Reset Password",
              style: Styles.titleMedium.copyWith(fontSize: 24),
            ),
            Image.asset(
              "assets/images/authentication/Password_changed.png",
              width: width,
              height: height / 3,
              fit: BoxFit.fitWidth,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const HintText(hintText: "Password"),
                PasswordTextField(
                  passwordController: passwordController,
                  isPassword: isPassword,
                  onPressed: () {
                    setState(() {
                      isPassword = !isPassword;
                    });
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                const HintText(hintText: "Re-enter password"),
                PasswordTextField(
                  passwordController: confirmPasswordController,
                  isPassword: isConfirmPassword,
                  onPressed: () {
                    setState(() {
                      isConfirmPassword = !isConfirmPassword;
                    });
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
            SizedBox(
              width: width * 0.8,
              height: 60,
              child: CustomButton(
                color: wajbah_primary,
                text: "Change Password",
                onPressed: () {},
              ),
            )
          ],
        ),
      ),
    );
  }
}
