import 'package:flutter/material.dart';
import 'package:wajba/core/styles.dart';

// ignore: must_be_immutable
class HomeScreenMainTitles extends StatelessWidget {
  String text;

  HomeScreenMainTitles({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12, left: 15, right: 20, top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: Styles.titleSmall.copyWith(fontSize: 15),
          ),
          TextButton(
              style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                  minimumSize: const Size(15, 15),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap),
              onPressed: () {},
              child: const Text(
                'View all',
                style: Styles.hint,
              )),
        ],
      ),
    );
  }
}
