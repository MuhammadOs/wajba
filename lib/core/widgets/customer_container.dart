import 'package:flutter/material.dart';
import '../util/sizeConfig.dart';
import '../util/styles.dart';

class CustomContainer extends StatelessWidget {
  final IconData? icon;
  final String? label;
  final Color? iconColor;
  final Color? labelColor;
  final Color? containerColor;

  const CustomContainer({
    Key? key,
    this.icon,
    this.label,
    this.iconColor,
    this.labelColor,
    this.containerColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double width = SizeConfig.screenW!;
    double iconSize = width * 0.04;
    double fontSize = width * 0.025;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: iconColor,
          size: iconSize,
        ),
        const SizedBox(width: 5),
        Text(label!,
            style: Styles.hint.copyWith(
              fontSize: fontSize,
              color: labelColor,
            )),
      ],
    );
  }
}
