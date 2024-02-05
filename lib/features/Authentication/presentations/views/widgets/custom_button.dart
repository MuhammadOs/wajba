import 'package:flutter/material.dart';

import '../../../../../constants/constants.dart';
import '../../../../../core/styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, this.onPressed, required this.text});
  final void Function()? onPressed;
  final String text;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          shadowColor: wajbah_primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          splashFactory: NoSplash.splashFactory,
          primary: wajbah_primary,
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: Styles.titleSmall
              .copyWith(color: Colors.white),
        ));
  }
}
