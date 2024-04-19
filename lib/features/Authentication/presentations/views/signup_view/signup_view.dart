import 'package:flutter/material.dart';
import 'package:wajba/core/constants/constants.dart';
import 'package:wajba/features/Authentication/presentations/views/permissions_view/views/allow_notification.dart';
import 'package:wajba/features/Authentication/presentations/views/widgets/custom_button.dart';
import 'package:wajba/features/Authentication/presentations/views/widgets/email_text_field.dart';
import '../../../../../core/sizeConfig.dart';
import '../../../../../core/styles.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/password_text_field.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  State<RegisterView> createState() => _LoginViewState();
}

class _LoginViewState extends State<RegisterView> {
  var firstnameController = TextEditingController();
  var lastnameController = TextEditingController();
  var emailController = TextEditingController();
  var referralController = TextEditingController();
  var passwordController = TextEditingController();
  var repasswordController = TextEditingController();
  var formkey = GlobalKey<FormState>();

  bool isPassword = true;
  TextEditingController _birthdateController = TextEditingController();
  DateTime? _selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        _birthdateController.text =
            "${picked.day}/${picked.month}/${picked.year}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double width = SizeConfig.screenW!;
    double height = SizeConfig.screenH!;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Center(
          child: Form(
            key: formkey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Register',
                      style: Styles.titleLarge.copyWith(
                          color: wajbah_black)), // welcome there statement
                  const SizedBox(
                    height: 40.0,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: CustomTextField(
                          usernameController: firstnameController,
                          hintText: "First name",
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: CustomTextField(
                          usernameController: lastnameController,
                          hintText: "Last name",
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  GestureDetector(
                    onTap: () {
                      _selectDate(context);
                    },
                    child: AbsorbPointer(
                      child: CustomTextField(
                        usernameController: _birthdateController,
                        hintText: "Birthdate",
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  EmailTextField(
                    emailController: emailController,
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  PasswordTextField(
                    passwordController: passwordController,
                    isPassword: isPassword,
                    onPressed: () {
                      setState(() {
                        isPassword = !isPassword;
                      });
                    },
                    hintText: "Password",
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  PasswordTextField(
                    passwordController: repasswordController,
                    isPassword: isPassword,
                    onPressed: () {
                      setState(() {
                        isPassword = !isPassword;
                      });
                    },
                    hintText: "Re-enter password",
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  CustomTextField(
                    usernameController: referralController,
                    hintText: "Referral code (optional)",
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                          flex: 1,
                          child: Checkbox(value: true, onChanged: (value) {})),
                      Expanded(
                        flex: 10,
                        child: Text(
                            'I agree to the Terms & Conditions and Privacy Policy',
                            textAlign: TextAlign.center,
                            style: Styles.hint.copyWith(fontSize: 12)),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                          width: width * 0.8,
                          height: 60,
                          child: CustomButton(
                            color: wajbah_primary,
                            text: "Create Account",
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
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an account ?',
                        style: Styles.titleSmall
                            .copyWith(color: wajbah_gray, fontSize: 14),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, 'login');
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.transparent,
                        ),
                        child: Text('Login',
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
