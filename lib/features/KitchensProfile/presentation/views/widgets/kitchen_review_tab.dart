import 'package:flutter/material.dart';
import 'package:wajba/constants/constants.dart';

import '../../../../../core/styles.dart';

class KitchenReviewsTab extends StatelessWidget {
  const KitchenReviewsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: CircleAvatar(
                    child: Image.asset("assets/images/google_logo.png"),
                  ),
                ),
                const Expanded(
                  flex: 6,
                  child: Text(
                    "Muhammad Osama",
                    style: Styles.titleSmall,
                  ),
                ),
                const Expanded(
                  flex: 2,
                  child: Text(
                    "7/2/2024",
                    style: TextStyle(color: wajbah_gray),
                  ),
                )
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(left: 80.0, right: 16),
              child: Text(
                "Juicy burger and crispy fries, 8 out of 10. I like it",
                style: TextStyle(color: wajbah_gray),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 80.0, right: 16),
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
                      Icon(Icons.star),
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
        const Divider(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: CircleAvatar(
                    child: Image.asset("assets/images/google_logo.png"),
                  ),
                ),
                const Expanded(
                  flex: 6,
                  child: Text(
                    "Kareem Alaa",
                    style: Styles.titleSmall,
                  ),
                ),
                const Expanded(
                  flex: 2,
                  child: Text(
                    "11/12/2024",
                    style: TextStyle(color: wajbah_gray),
                  ),
                )
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(left: 80.0, right: 16),
              child: Text(
                "There is some debate over where the kitchen witchoriginated, some claiming  Germany and others England but consensus",
                style: TextStyle(color: wajbah_gray),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 80.0, right: 16),
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
                      ),
                      Icon(
                        Icons.star,
                      ),
                      Icon(Icons.star),
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
