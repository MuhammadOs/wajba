import 'package:flutter/material.dart';
import 'package:wajba/constants/constants.dart';
import 'package:wajba/core/styles.dart';

// ignore: must_be_immutable
class PersmissionsBody extends StatelessWidget {
  String mainText;
  String subText;
  String image;
  PersmissionsBody(
      {super.key,
      required this.width,
      required this.height,
      required this.mainText,
      required this.subText,
      required this.image});

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          image,
          width: width,
          height: height / 3,
        ),
        const SizedBox(
          height: 25,
        ),
        Text(
          mainText,
          style: Styles.titleMedium.copyWith(fontSize: 24),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          subText,
          style: Styles.titleSmall.copyWith(color: wajbah_gray),
        ),
        const SizedBox(
          height: 30,
        ),
      ],
    );
  }
}
