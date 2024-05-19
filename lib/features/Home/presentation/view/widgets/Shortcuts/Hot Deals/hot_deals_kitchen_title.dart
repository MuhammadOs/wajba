import 'package:flutter/material.dart';
import 'package:wajba/core/util/styles.dart';

class HotDealsKitchenTitle extends StatelessWidget {
  HotDealsKitchenTitle(
      {super.key, required this.KitchenName, required this.Icon});

  @override
  String Icon;
  String KitchenName;
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 10),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Image.asset(
              Icon,
              width: 50,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            KitchenName,
            style: Styles.titleLarge.copyWith(fontSize: 14),
          )
        ],
      ),
    );
  }
}
