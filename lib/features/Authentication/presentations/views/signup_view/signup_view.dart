import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wajba/core/util/theme.dart';
import 'package:wajba/features/Authentication/data/models/register_model.dart';
import 'package:wajba/features/Authentication/presentations/view_model/auth_cubit.dart';
import 'package:wajba/features/Authentication/presentations/view_model/auth_states.dart';
import 'package:wajba/features/Authentication/presentations/views/widgets/custom_button.dart';
import 'package:wajba/features/Authentication/presentations/views/widgets/email_text_field.dart';
import 'package:wajba/features/Authentication/presentations/views/widgets/custom_text_field.dart';
import 'package:wajba/features/Authentication/presentations/views/widgets/password_text_field.dart';
import '../../../../../core/util/sizeConfig.dart';
import '../../../../../core/util/styles.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final _formKey = GlobalKey<FormState>();

  final _firstnameController = TextEditingController();
  final _lastnameController = TextEditingController();
  final _emailController = TextEditingController();
  final _referralController = TextEditingController();
  final _passwordController = TextEditingController();
  final _repasswordController = TextEditingController();
  final _birthdateController = TextEditingController();
  final _phoneController = TextEditingController();
  bool _isPasswordVisible = false;
  DateTime? _selectedDate;

  Map<String, dynamic> userData = {
    "phoneNumber": 0,
    "email": "",
    "password": "",
    "firstName": "",
    "lastName": "",
    "birthDate": "",
  };

  @override
  void dispose() {
    _firstnameController.dispose();
    _lastnameController.dispose();
    _emailController.dispose();
    _referralController.dispose();
    _passwordController.dispose();
    _repasswordController.dispose();
    _birthdateController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

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
        _birthdateController.text = picked.toIso8601String(); // ISO 8601 format
      });
    }
  }

  void _register() {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    _formKey.currentState!.save();

    String birthDate =
        _selectedDate != null ? _selectedDate!.toIso8601String() : "";

    getAuthCubit(context).register(RegisterModel(
      phoneNumber: userData["phoneNumber"],
      email: userData["email"],
      password: userData["password"],
      firstName: userData["firstName"],
      lastName: userData["lastName"],
      birthdate: birthDate,
      role: " ",
      favourites: " ",
      usedCoupones: " ",
    ));
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
          child: BlocConsumer<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state is RegisterSuccessfullyState) {
                Navigator.pushReplacementNamed(context, 'login');
              } else if (state is AuthErrorState) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.errorModel.message!)),
                );
              }
            },
            builder: (context, state) {
              return Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Register',
                        style: Styles.titleLarge.copyWith(color: wajbah_black),
                      ),
                      const SizedBox(height: 40.0),
                      Row(
                        children: [
                          Expanded(
                            child: CustomTextField(
                              usernameController: _firstnameController,
                              hintText: "First name",
                              onSaved: (value) {
                                userData["firstName"] = value;
                              },
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: CustomTextField(
                              usernameController: _lastnameController,
                              hintText: "Last name",
                              onSaved: (value) {
                                userData["lastName"] = value;
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      CustomTextField(
                        usernameController: _phoneController,
                        hintText: "Phone number",
                        onSaved: (value) {
                          userData["phoneNumber"] = int.parse(value!);
                        },
                      ),
                      const SizedBox(height: 15.0),
                      GestureDetector(
                        onTap: () => _selectDate(context),
                        child: AbsorbPointer(
                          child: CustomTextField(
                            usernameController: _birthdateController,
                            hintText: "Birthdate",
                            suffixIcon: IconButton(
                              icon: const Icon(Icons.calendar_month,
                                  color: wajbah_primary),
                              onPressed: () => _selectDate(context),
                            ),
                            onSaved: (value) {
                              userData["birthDate"] = value;
                            },
                          ),
                        ),
                      ),
                      const SizedBox(height: 15.0),
                      CustomTextField(
                        usernameController: _emailController,
                        hintText: "Email",
                        onSaved: (value) {
                          userData["email"] = value;
                        },
                      ),
                      const SizedBox(height: 15.0),
                      PasswordTextField(
                        passwordController: _passwordController,
                        hidePassword: !_isPasswordVisible,
                        onPressed: () {
                          setState(() {
                            _isPasswordVisible = !_isPasswordVisible;
                          });
                        },
                        hintText: "Password",
                        onSaved: (value) {
                          userData["password"] = value;
                        },
                      ),
                      const SizedBox(height: 15.0),
                      const SizedBox(height: 15.0),
                      CustomTextField(
                        usernameController: _referralController,
                        hintText: "Referral code (optional)",
                        optional: true,
                      ),
                      const SizedBox(height: 15.0),
                      Row(
                        children: [
                          Checkbox(value: true, onChanged: (value) {}),
                          Expanded(
                            child: Text(
                              'I agree to the Terms & Conditions and Privacy Policy',
                              style: Styles.hint.copyWith(fontSize: 12),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15.0),
                      BlocConsumer<AuthCubit, AuthState>(
                        listener: (context, state) {
                          if (state is AuthErrorState) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                  content: Text(state.errorModel.message!)),
                            );
                          } else if (state is LoginSuccessfullyState) {
                            Navigator.pushNamed(context, "login");
                          }
                        },
                        builder: (context, state) {
                          return (state is LoginAuthState)
                              ? const Center(child: CircularProgressIndicator())
                              : Center(
                                  child: SizedBox(
                                    width: width * 0.8,
                                    height: 60,
                                    child: CustomButton(
                                      color: wajbah_primary,
                                      text: "Create Account",
                                      onPressed: _register,
                                    ),
                                  ),
                                );
                        },
                      ),
                      const SizedBox(height: 20),
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Already have an account?',
                              style: Styles.titleSmall
                                  .copyWith(color: wajbah_gray, fontSize: 14),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pushReplacementNamed(
                                    context, 'login');
                              },
                              child: Text(
                                'Login',
                                style: Styles.titleSmall.copyWith(
                                    color: wajbah_primary, fontSize: 14),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
