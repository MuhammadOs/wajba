import 'package:flutter/material.dart';

import '../../../../../core/util/theme.dart';
import '../../../../../core/util/styles.dart';
import 'hint_text.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField(
      {super.key,
      required this.usernameController,
      this.hintText,
      this.onSaved,
      this.suffixIcon,
      this.optional = false});

  final TextEditingController usernameController;
  final String? hintText;
  final void Function(String? value)? onSaved;
  Widget? suffixIcon;
  bool optional;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HintText(hintText: hintText ?? ""),
        const SizedBox(
          height: 5,
        ),
        TextFormField(
          controller: usernameController,
          style: Styles.titleSmall,
          decoration: InputDecoration(
            labelStyle: Styles.titleSmall.copyWith(
              color: wajbah_black,
            ),
            suffixIcon: suffixIcon,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
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
              borderRadius: BorderRadius.all(Radius.circular(15)),
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
          ),
          keyboardType: TextInputType.name,
          onFieldSubmitted: (String value) {
            debugPrint(value);
          },
          validator: (value) {
            if (optional) {
              return null;
            } else {
              if (value == null || value.isEmpty) {
                return '$hintText must not be empty !';
              }
            }
            return null;
          },
          onSaved: onSaved,
        ),
      ],
    );
  }
}
