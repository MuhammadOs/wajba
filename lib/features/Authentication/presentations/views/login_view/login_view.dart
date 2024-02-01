import 'package:flutter/material.dart';
import 'package:wajba/constants/constants.dart';
import 'package:wajba/features/Authentication/presentations/views/signup_view/signup_view.dart';

import '../../../../../core/sizeConfig.dart';
import '../../../../../core/styles.dart';

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
    double height = SizeConfig.screenH!;
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
                  isPassword == false
                      ? const Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.error,
                                size: 15,
                                color: Colors.red,
                              ),
                              Text(
                                ' Invalid username or password !',
                                style: Styles.titleSmall,
                              ),
                            ],
                          ),
                        )
                      : Container(),
                  const SizedBox(
                    height: 40.0,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 10, bottom: 10),
                    child: Text(
                      'Email',
                      style: Styles.hint,
                    ),
                  ),
                  TextFormField(
                    controller: usernameController,
                    style: Styles.titleSmall,
                    decoration: InputDecoration(
                      labelStyle: Styles.titleSmall.copyWith(
                        color: wajbah_black,
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 10),
                      filled: true,
                      fillColor: wajbah_buttons,
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        borderSide: BorderSide(
                          color: wajbah_gray,
                          width: 1.0,
                        ),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                        borderSide: BorderSide(
                          color: wajbah_gray,
                          width: 1.0,
                        ),
                      ),
                      disabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        borderSide: BorderSide(
                          color: wajbah_gray,
                          width: 1.0,
                        ),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        borderSide: BorderSide(
                          color: wajbah_buttons,
                          width: 1.0,
                        ),
                      ),
                      /*prefixIcon: Icon(
                          Icons.account_circle_outlined,
                          color: wajbah_black,
                        )*/
                    ),
                    keyboardType: TextInputType.name,
                    onFieldSubmitted: (String value) {
                      debugPrint(value);
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'username must not be empty !';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 25.0,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 10, bottom: 10),
                    child: Text(
                      'Password',
                      style: Styles.hint,
                    ),
                  ),
                  TextFormField(
                    controller: passwordController,
                    decoration: InputDecoration(
                      labelStyle:
                          Styles.titleSmall.copyWith(color: wajbah_black),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 5.0,
                        ),
                      ),
                      filled: true,
                      fillColor: wajbah_buttons,
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 10),
                      focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                        borderSide: BorderSide(
                          color: wajbah_gray,
                          width: 1.0,
                        ),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(14)),
                        borderSide: BorderSide(
                          color: wajbah_buttons,
                          width: 1.0,
                        ),
                      ),
                      /*prefixIcon: const Icon(
                        Icons.lock_open_outlined,
                        color: wajbah_primary,
                      ),*/
                      suffixIcon: ElevatedButton(
                        style: ButtonStyle(
                          splashFactory: NoSplash.splashFactory,
                          backgroundColor:
                              MaterialStateProperty.all(Colors.transparent),
                          elevation: MaterialStateProperty.all(0),
                        ),
                        child: isPassword
                            ? const Icon(
                                Icons.visibility,
                                color: wajbah_primary,
                              )
                            : const Icon(
                                Icons.visibility_off,
                                color: wajbah_primary,
                              ),
                        onPressed: () {
                          setState(() {
                            isPassword = !isPassword;
                          });
                        },
                      ),
                    ),
                    keyboardType: TextInputType.number,
                    obscureText: isPassword,
                    onFieldSubmitted: (String value) {
                      debugPrint(value);
                    },
                    onChanged: (String value) {
                      debugPrint(value);
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'password must not be empty !';
                      }
                      return null;
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 10, right: 5),
                        child: TextButton(
                          child: const Text(
                            'Forget password?',
                            style: Styles.hint,
                          ),
                          onPressed: () {},
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
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              elevation: 0,
                              shadowColor: wajbah_primary,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              splashFactory: NoSplash.splashFactory,
                              primary: wajbah_primary,
                            ),
                            onPressed: () {
                              setState(() {
                                if (formkey.currentState!.validate()) {
                                  debugPrint(passwordController.text);
                                  /*
                                  for (int i = 0; i < myUsers.length; i++) {
                                    if (usernameController.text ==
                                            myUsers[i]['email'] &&
                                        passwordController.text ==
                                            myUsers[i]['password']) {
                                      isPassword = true;
                                      Navigator.of(context)
                                          .push(MaterialPageRoute(
                                        builder: (c) {
                                          return const MoviesPages();
                                        },
                                      ));
                                      break;
                                    } else {
                                      isPassword = false;
                                    }
                                  }*/
                                }
                              });
                            },
                            child: Text(
                              "Login",
                              style: Styles.titleSmall
                                  .copyWith(color: Colors.white),
                            )),
                      ),
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
                          Navigator.pushReplacementNamed(context, 'signup');
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
