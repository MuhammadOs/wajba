import 'package:flutter/material.dart';
import 'package:wajba/core/styles.dart';

class Ratings extends StatelessWidget {
  const Ratings({
    super.key,
    required this.rating,
  });
  final int rating;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 22,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(7)),
        color: Color(0xffF6F6F6),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Row(
          children: [
            Icon(
              Icons.star,
              size: 18,
              color: rating >= 10 ? Color(0xffF6CF00) : Colors.grey,
            ),
            Icon(
              Icons.star,
              size: 18,
              color: rating >= 50 ? Color(0xffF6CF00) : Colors.grey,
            ),
            Icon(
              Icons.star,
              size: 18,
              color: rating >= 90 ? Color(0xffF6CF00) : Colors.grey,
            ),
            Icon(
              Icons.star,
              size: 18,
              color: rating >= 150 ? Color(0xffF6CF00) : Colors.grey,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 3, left: 6),
              child: Text(
                '(89)',
                style: Styles.titleLarge
                    .copyWith(fontSize: 12, color: Colors.grey),
              ),
            )
          ],
        ),
      ),
    );
  }
}
