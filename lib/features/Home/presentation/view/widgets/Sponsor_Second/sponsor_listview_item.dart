import 'package:flutter/material.dart';
import 'package:wajba/core/sizeConfig.dart';
import 'package:wajba/features/Home/data/shortcuts_data.dart';

class SecondSponsorListItem extends StatelessWidget {
  const SecondSponsorListItem({super.key, required this.shortcut});
  final shortcuts shortcut;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double width = SizeConfig.screenW!;

    return SizedBox(
      width: width * 1,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(23)),
          color: Colors.grey,
          image: DecorationImage(
              image: AssetImage(shortcut.image), fit: BoxFit.fill),
        ),
      ),
    );
  }
}
