import 'package:flutter/material.dart';
import 'package:wajba/core/util/sizeConfig.dart';
import 'package:wajba/core/util/styles.dart';
import 'package:wajba/features/Home/data/kitchens_nearby_data.dart';

class KitchensNearbyItem extends StatelessWidget {
  final KitchensNearby kitchen;

  const KitchensNearbyItem({Key? key, required this.kitchen}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double width = SizeConfig.screenW!;
    double height = SizeConfig.screenH!;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 7),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              height: height * 0.09,
              width: width * 0.19,
              kitchen.image,
            ),
          ),
        ),
        Text(
          kitchen.name,
          textAlign: TextAlign.center,
          style: Styles.titleSmall.copyWith(fontSize: 13),
        )
      ],
    );
  }
}
