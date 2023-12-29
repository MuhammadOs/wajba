import 'package:flutter/material.dart';

import '../../../../../constants/constants.dart';
import '../../../../../core/styles.dart';
import '../../../data/onboarding_data.dart';
class OnboardingTitles extends StatefulWidget {
  const OnboardingTitles({
    super.key, required this.index,
  });
  final int index;

  @override
  State<OnboardingTitles> createState() => _OnboardingTitlesState();
}

class _OnboardingTitlesState extends State<OnboardingTitles> {
  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
              text: content[widget.index].firstText,
              style: Styles.titleLarge.copyWith(
                  color: wajbah_primary
              )
          ),
          TextSpan(
              text: '\n${content[widget.index].secondText}',
              style: Styles.titleLarge.copyWith(
                  color: wajbah_black
              )
          ),
        ],
      ),
    );
  }
}