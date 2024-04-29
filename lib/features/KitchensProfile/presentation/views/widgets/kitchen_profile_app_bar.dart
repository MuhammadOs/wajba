import 'package:flutter/material.dart';
import 'package:wajba/core/sizeConfig.dart';
import 'custom_back_button.dart';

class KitchensProfileAppBar extends StatelessWidget {
  const KitchensProfileAppBar({Key? key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double screenWidth = SizeConfig.screenW!;
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.05, vertical: screenWidth * 0.04),
      child: const Row(
        children: [
          CustomBackButton(),
        ],
      ),
    );
  }
}
