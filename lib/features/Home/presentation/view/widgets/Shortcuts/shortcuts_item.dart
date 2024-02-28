import 'package:flutter/material.dart';
import 'package:wajba/constants/constants.dart';
import 'package:wajba/core/sizeConfig.dart';
import 'package:wajba/core/styles.dart';
import 'package:wajba/features/Home/data/shortcuts_data.dart';

class ShortCutItem extends StatelessWidget {
  final shortcuts shortcut;

  const ShortCutItem({Key? key, required this.shortcut}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double width = SizeConfig.screenW!;
    double height = SizeConfig.screenH!;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 7),
          child: GestureDetector(
            onTap: () {
              Navigator.of(context)
                  .pushNamed('Shortcuts View', arguments: shortcut);
            },
            child: Container(
              padding: const EdgeInsets.all(10),
              child: Image.asset(
                shortcut.image,
              ),
              width: width * 0.17,
              height: height * 0.08,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(13)),
                color: wajbah_buttons,
              ),
            ),
          ),
        ),
        Text(
          textAlign: TextAlign.center,
          shortcut.name,
          style: Styles.titleSmall.copyWith(fontSize: 13),
        )
      ],
    );
  }
}
