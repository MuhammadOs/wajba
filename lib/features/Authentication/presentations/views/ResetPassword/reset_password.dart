import 'package:flutter/material.dart';
import 'package:wajba/core/util/theme.dart';
import 'package:wajba/core/util/sizeConfig.dart';
import 'package:wajba/features/Authentication/presentations/views/login_view/login_view.dart';
import 'package:wajba/features/Authentication/presentations/views/widgets/custom_button.dart';
import 'package:wajba/features/Authentication/presentations/views/widgets/hint_text.dart';

import '../../../../../core/util/styles.dart';
import '../widgets/password_text_field.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key});

  @override
  State<ResetPassword> createState() => _PasswordChangedState();
}

class _PasswordChangedState extends State<ResetPassword> {
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();
  bool isPassword = true;
  bool isConfirmPassword = true;
  String? errorMessage;

  bool passwordsMatch() {
    return passwordController.text == confirmPasswordController.text;
  }

  bool validateFields() {
    if (passwordController.text.isEmpty ||
        confirmPasswordController.text.isEmpty) {
      errorMessage = "Please enter both passwords.";
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double width = SizeConfig.screenW!;
    double height = SizeConfig.screenH!;

    return Scaffold(
      backgroundColor: Colors.white,
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
                  hidePassword: isPassword,
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
                  hidePassword: isConfirmPassword,
                  onPressed: () {
                    setState(() {
                      isConfirmPassword = !isConfirmPassword;
                    });
                  },
                ),
                if (errorMessage != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      errorMessage!,
                      style: TextStyle(color: Colors.red),
                    ),
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
                onPressed: () {
                  setState(() {
                    errorMessage = null;
                  });
                  if (validateFields()) {
                    if (passwordsMatch()) {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (c) {
                          return const LoginView();
                        },
                      ));
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text(
                            "Password Changed Successfully",
                            style: Styles.titleMedium.copyWith(fontSize: 14),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text("OK"),
                            ),
                          ],
                        ),
                      );
                    } else {
                      errorMessage = "Passwords do not match.";
                      setState(() {});
                    }
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
