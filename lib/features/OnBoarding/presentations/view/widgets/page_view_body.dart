import 'package:flutter/material.dart';

import '../../../data/onboarding_data.dart';
import 'onboarding_discription.dart';
import 'onboarding_titles.dart';

class PageViewBody extends StatefulWidget {
  const PageViewBody({
    super.key,
    required this.index,
  });

  final int index;

  @override
  State<PageViewBody> createState() => _PageViewBodyState();
}

class _PageViewBodyState extends State<PageViewBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          content[widget.index].image,
          width: 300,
          height: 300,
        ),
        const SizedBox(height: 20), // Adjust the spacing here
        OnboardingTitles(
          index: widget.index,
        ),
        OnboardingDiscription(
          index: widget.index,
        ),
      ],
    );
  }
}
