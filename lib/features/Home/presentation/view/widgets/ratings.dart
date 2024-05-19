import 'package:flutter/material.dart';
import 'package:wajba/core/util/styles.dart';

class Ratings extends StatelessWidget {
  const Ratings({
    super.key,
    required this.rating, required this.size,
  });
  final int rating;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.star,
          size: size,
          color: rating >= 10 ? const Color(0xffF6CF00) : Colors.grey,
        ),
        Icon(
          Icons.star,
          size: size,
          color: rating >= 50 ? const Color(0xffF6CF00) : Colors.grey,
        ),
        Icon(
          Icons.star,
          size: size,
          color: rating >= 90 ? const Color(0xffF6CF00) : Colors.grey,
        ),
        Icon(
          Icons.star,
          size: size,
          color: rating >= 150 ? const Color(0xffF6CF00) : Colors.grey,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 3, left: 6),
          child: Text(
            '(98)',
            style: Styles.titleLarge.copyWith(fontSize: 12, color: Colors.grey),
          ),
        )
      ],
    );
  }
}
