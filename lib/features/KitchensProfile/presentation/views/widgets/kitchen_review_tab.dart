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
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomReview(
                  name: "Muhammad Osama",
                  profilePicture: "assets/images/willy.png",
                  review: "review",
                  date: "date",
                  like: true),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: CircleAvatar(
                      maxRadius: 25,
                      child: Image.asset(
                        "assets/images/willy.png",
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 7,
                    child: Text(
                      "Muhammad Osama",
                      style: Styles.hint
                          .copyWith(color: wajbah_black, fontSize: 20),
                    ),
                  ),
                  const Expanded(
                    flex: 2,
                    child: Text(
                      "7/2/2024",
                      style: Styles.hint,
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 80.0, right: 16),
                child: Text(
                  "Juicy burger and crispy fries, 8 out of 10. I like it very much.",
                  style: Styles.hint.copyWith(fontSize: 14),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 80.0, right: 32, top: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.yellow,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.yellow,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.yellow,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.yellow,
                        ),
                        Icon(
                          Icons.star,
                          color: wajbah_gray,
                        ),
                      ],
                    ),
                    Image.asset(
                      "assets/images/like.png",
                      width: 30,
                      height: 30,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        Divider(
          indent: MediaQuery.of(context).size.width * 0.05,
          endIndent: MediaQuery.of(context).size.width * 0.05,
        ),
        const SizedBox(
          height: 15,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: CircleAvatar(
                    maxRadius: 25,
                    child: Image.asset(
                      "assets/images/willy.png",
                    ),
                  ),
                ),
                Expanded(
                  flex: 7,
                  child: Text(
                    "Kareem Alaa",
                    style:
                        Styles.hint.copyWith(color: wajbah_black, fontSize: 20),
                  ),
                ),
                const Expanded(
                  flex: 2,
                  child: Text(
                    "11/12/2024",
                    style: Styles.hint,
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 80.0, right: 16),
              child: Text(
                "There is some debate over where the kitchen witchoriginated, some claiming  Germany and others England but consensus",
                style: Styles.hint.copyWith(fontSize: 14),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 80.0, right: 16, top: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                      ),
                      Icon(
                        Icons.star,
                        color: wajbah_gray,
                      ),
                      Icon(
                        Icons.star,
                        color: wajbah_gray,
                      ),
                      Icon(
                        Icons.star,
                        color: wajbah_gray,
                      ),
                    ],
                  ),
                  Image.asset(
                    "assets/images/dislike.png",
                    width: 30,
                    height: 30,
                  )
                ],
              ),
            )
          ],
        ),
      ],
    );
  }
}
