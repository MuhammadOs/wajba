import 'package:flutter/material.dart';

import '../../../../../constants/constants.dart';
import '../../../../../core/styles.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: 'what are you craving for?',
          hintStyle: Styles.hint.copyWith(
            color: wajbah_gray,
            fontSize: 16
          ),
          contentPadding:
          const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          filled: true,
          fillColor: wajbah_gray_light,
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
              color: wajbah_gray_light,
              width: 1.0,
            ),
          ),
          disabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            borderSide: BorderSide(
              color: wajbah_gray_light,
              width: 1.0,
            ),
          ),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            borderSide: BorderSide(
              color: wajbah_gray_light,
              width: 1.0,
            ),
          ),
          prefixIcon: const Icon(
            Icons.search_rounded,
            color: wajbah_gray,
          ),
        ),
      ),
    );
  }
}
