import 'package:flutter/material.dart';
import 'package:wajba/constants/constants.dart';
import 'package:wajba/features/Authentication/presentations/views/ResetPassword/reset_password.dart';
import 'package:wajba/features/Authentication/presentations/views/permissions_view/views/allow_notification.dart';
import 'package:wajba/features/Authentication/presentations/views/widgets/custom_button.dart';
import 'package:wajba/features/Authentication/presentations/views/widgets/hint_text.dart';
import '../../../../../core/sizeConfig.dart';
import '../../../../../core/styles.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/password_text_field.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  var usernameController = TextEditingController();
  var passwordController = TextEditingController();
  var formkey = GlobalKey<FormState>();

  bool isPassword = true;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double width = SizeConfig.screenW!;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Login',
                      style: Styles.titleLarge.copyWith(
                          color: wajbah_black)), // welcome there statement
                  const SizedBox(
                    height: 40.0,
                  ),
                  CustomTextField(
                      usernameController: usernameController,
                      hintText: "Email"),
                  const SizedBox(
                    height: 25.0,
                  ),
                  PasswordTextField(
                    passwordController: passwordController,
                    hintText: "Password",
                    isPassword: isPassword,
                    onPressed: () {
                      setState(() {
                        isPassword = !isPassword;
                      });
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10, right: 5),
                        child: TextButton(
                          child: const Text(
                            'Forget password?',
                            style: Styles.hint,
                          ),
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (c) {
                                return const ResetPassword();
                              },
                            ));
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Or',
                          textAlign: TextAlign.center,
                          style: Styles.titleSmall),
                    ],
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 100,
                        height: 60,
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 20),
                        decoration: BoxDecoration(
                            color: wajbah_buttons,
                            borderRadius: BorderRadius.circular(16)),
                        child: Image.asset(
                          'assets/images/google_logo.png',
                          width: 35,
                          height: 35,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                          width: width * 0.8,
                          height: 60,
                          child: CustomButton(
                            text: "Login",
                            onPressed: () {
                              setState(() {
                                if (formkey.currentState!.validate()) {
                                  debugPrint(passwordController.text);
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (c) {
                                      return const AllowNotification();
                                    },
                                  ));
                                }
                              });
                            },
                          )),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don\'t have an account ? ',
                        style: Styles.titleSmall
                            .copyWith(color: wajbah_gray, fontSize: 14),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, 'register');
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.transparent,
                        ),
                        child: Text('Register',
                            style: Styles.titleSmall
                                .copyWith(color: wajbah_primary, fontSize: 14)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
