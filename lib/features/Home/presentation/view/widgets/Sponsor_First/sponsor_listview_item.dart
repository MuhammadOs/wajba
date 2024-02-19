import 'package:flutter/material.dart';
import 'package:wajba/core/sizeConfig.dart';
import 'package:wajba/features/Home/data/sponsers_data.dart';

class SponsorListItem extends StatelessWidget {
  const SponsorListItem({super.key, required this.sponsores});
  final sponsor sponsores;

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
              image: AssetImage(sponsores.image), fit: BoxFit.fill),
        ),
      ),
    );
  }
}
