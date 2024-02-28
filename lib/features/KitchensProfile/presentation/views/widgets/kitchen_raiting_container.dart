import 'package:flutter/material.dart';
import '../../../../../core/sizeConfig.dart';

class KitchenProfileCustomContainer extends StatelessWidget {
  final IconData? icon;
  final String? label;
  final Color? iconColor;
  final Color? labelColor;
  final Color? containerColor;

  const KitchenProfileCustomContainer({
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
    return Padding(
      padding: EdgeInsets.all(width * 0.008),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15), color: containerColor),
        padding: EdgeInsets.all(width * 0.008),
        child: Row(
          children: [
            Icon(
              icon,
              color: iconColor,
              size: iconSize,
            ),
            const SizedBox(width: 4),
            Text(
              label!,
              style: TextStyle(
                fontSize: fontSize,
                color: labelColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
