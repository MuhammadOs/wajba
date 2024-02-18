import 'package:flutter/material.dart';
import 'package:wajba/constants/constants.dart';
import 'package:wajba/features/KitchensProfile/presentation/views/widgets/custom_review.dart';

import '../../../../../core/styles.dart';

class KitchenReviewsTab extends StatelessWidget {
  const KitchenReviewsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomReview(
            name: "Muhammad Osama",
            profilePicture: "assets/images/willy.png",
            review: "Juicy burger and crispy fries, 8 out of 10. I like it very much.",
            date: "7/2/2024",
            like: true),
        Divider(
          indent: MediaQuery.of(context).size.width * 0.08,
          endIndent: MediaQuery.of(context).size.width * 0.08,
        ),
        const CustomReview(
            name: "Kareem Alaa",
            profilePicture: "assets/images/willy.png",
            review: "Juicy burger and crispy fries, 8 out of 10. I like it very much.",
            date: "11/12/2024",
            like: false),
        Divider(
          indent: MediaQuery.of(context).size.width * 0.08,
          endIndent: MediaQuery.of(context).size.width * 0.08,
        ),
      ],
    );
  }
}
