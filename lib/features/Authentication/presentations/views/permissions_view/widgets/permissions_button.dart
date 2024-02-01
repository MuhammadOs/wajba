import 'package:flutter/material.dart';
import 'package:wajba/constants/constants.dart';
import 'package:wajba/core/styles.dart';

// ignore: must_be_immutable
class PermissionsButton extends StatelessWidget {
  String text;
  PermissionsButton({super.key, required this.width, required this.text});

  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width * 0.43,
      height: 52,
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
          onPressed: () {},
          child: Text(
            text,
            style: Styles.button.copyWith(
              color: Colors.white,
            ),
          )),
    );
  }
}
