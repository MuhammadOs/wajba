import 'package:flutter/material.dart';

import '../../../../../constants/constants.dart';
import '../../../../../core/styles.dart';

class CustomReview extends StatelessWidget {
  final String name;
  final String profilePicture;
  final String review;
  final String date;
  final bool like;

  const CustomReview(
      {super.key,
      required this.name,
      required this.profilePicture,
      required this.review,
      required this.date,
      required this.like});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
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
                    profilePicture,
                  ),
                ),
              ),
              Expanded(
                flex: 7,
                child: Text(
                  name,
                  style:
                      Styles.hint.copyWith(color: wajbah_black, fontSize: 20),
                ),
              ),
              Expanded(
                flex: 2,
                child: Text(
                  date,
                  style: Styles.hint,
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 80.0, right: 16),
            child: Text(
              review,
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
                like == true
                    ? Image.asset(
                        "assets/images/like.png",
                        width: 30,
                        height: 30,
                      )
                    : Image.asset(
                        "assets/images/dislike.png",
                        width: 30,
                        height: 30,
                      )
              ],
            ),
          )
        ],
      ),
    );
  }
}
