import 'package:flutter/material.dart';
import 'package:wajba/constants/constants.dart';
import 'package:wajba/core/styles.dart';
import 'package:wajba/features/Home/data/categories_data.dart';

class CategoryItem extends StatelessWidget {
  final categories categoryItem;

  const CategoryItem({Key? key, required this.categoryItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 7),
          child: Container(
            width: 75,
            height: 70,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(13)),
              color: wajbah_buttons,
            ),
            child: Image.asset(
              categoryItem.image,
            ),
          ),
        ),
        Text(
          categoryItem.name,
          style: Styles.titleSmall.copyWith(fontSize: 13),
        )
      ],
    );
  }
}
