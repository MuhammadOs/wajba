import 'package:flutter/material.dart';
import '../../../../../core/util/theme.dart';
import '../../../../../core/util/styles.dart';

class CustomReview extends StatelessWidget {
  final String name;
  final String profilePicture;
  final String review;
  final String date;
  final bool like;

  const CustomReview({
    Key? key,
    required this.name,
    required this.profilePicture,
    required this.review,
    required this.date,
    required this.like,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.all(screenWidth * 0.04),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: CircleAvatar(
                  maxRadius: screenWidth * 0.04,
                  child: Image.asset(
                    profilePicture,
                  ),
                ),
              ),
              Expanded(
                flex: 7,
                child: Text(
                  name,
                  style: Styles.hint.copyWith(
                    color: wajbah_black,
                    fontSize: screenWidth * 0.04,
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Text(
                  date,
                  style: Styles.hint.copyWith(fontSize: screenWidth * 0.03),
                ),
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.only(
                left: screenWidth * 0.15, right: screenWidth * 0.015),
            child: Text(
              review,
              style: Styles.hint.copyWith(fontSize: screenWidth * 0.025),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: screenWidth * 0.15,
                right: screenWidth * 0.02,
                top: screenWidth * 0.015),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: List.generate(
                    5,
                    (index) => Icon(
                      Icons.star,
                      color: index < 4 ? Colors.yellow : wajbah_gray,
                      size: screenWidth * 0.04,
                    ),
                  ),
                ),
                like
                    ? Image.asset(
                        "assets/images/like.png",
                        width: screenWidth * 0.05,
                        height: screenWidth * 0.05,
                      )
                    : Image.asset(
                        "assets/images/dislike.png",
                        width: screenWidth * 0.05,
                        height: screenWidth * 0.05,
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
