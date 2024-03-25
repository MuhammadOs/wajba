import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wajba/core/constants/constants.dart';
import 'package:wajba/core/styles.dart';

class CustomRatingStars extends StatelessWidget {
  const CustomRatingStars({
    super.key,
    required this.width,
    required this.rating,
  });

  final double width;
  final int rating;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        FaIcon(
          FontAwesomeIcons.solidStar,
          size: 12,
          color: rating >= 10 ? wajbah_yellow : wajbah_gray,
        ),
        SizedBox(
          width: width * 0.002,
        ),
        FaIcon(
          FontAwesomeIcons.solidStar,
          size: 12,
          color: rating >= 50 ? wajbah_yellow : wajbah_gray,
        ),
        SizedBox(
          width: width * 0.002,
        ),
        FaIcon(
          FontAwesomeIcons.solidStar,
          size: 12,
          color: rating >= 100 ? wajbah_yellow : wajbah_gray,
        ),
        SizedBox(
          width: width * 0.002,
        ),
        FaIcon(
          FontAwesomeIcons.solidStar,
          size: 12,
          color: rating >= 140 ? wajbah_yellow : wajbah_gray,
        ),
        SizedBox(
          width: width * 0.009,
        ),
        Text(
          '($rating)',
          style: Styles.titleSmall.copyWith(fontSize: 8, color: Colors.grey),
        ),
      ],
    );
  }
}
