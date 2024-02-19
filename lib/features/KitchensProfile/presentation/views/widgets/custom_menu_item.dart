import 'package:flutter/material.dart';
import 'package:wajba/core/sizeConfig.dart';

import '../../../../../constants/constants.dart';
import '../../../../../core/styles.dart';

class CustomMenuItem extends StatelessWidget {
  const CustomMenuItem({Key? key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final screenWidth = SizeConfig.screenW!;
    final screenHeight = SizeConfig.screenH!;

    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: screenHeight * 0.01, horizontal: screenWidth * 0.05),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: _buildMenuItemDetails(screenWidth, screenHeight),
          ),
          SizedBox(width: screenWidth * 0.02),
          Expanded(
            flex: 2,
            child: _buildMenuItemImage(screenWidth, screenHeight),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItemDetails(double screenWidth, double screenHeight) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'willy one sandwich',
          style: Styles.titleMedium.copyWith(fontSize: screenWidth * 0.04),
        ),
        SizedBox(height: screenHeight * 0.01),
        Text(
          '1 single beef or chicken sandwich + 1 single beef burger or 1 single chicken',
          style: Styles.hint.copyWith(
            color: const Color(0xff696969),
            fontSize: screenWidth * 0.03,
          ),
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
        ),
        SizedBox(height: screenHeight * 0.01),
        _buildPriceInfo(screenWidth),
      ],
    );
  }

  Widget _buildPriceInfo(double screenWidth) {
    return Row(
      children: [
        Text(
          "EGP 209.00",
          style: Styles.hint.copyWith(
            decoration: TextDecoration.lineThrough,
            fontSize: screenWidth * 0.03,
          ),
        ),
        SizedBox(width: screenWidth * 0.02),
        Container(
          padding: EdgeInsets.all(screenWidth * 0.01),
          decoration: BoxDecoration(
            color: wajbah_primary,
            borderRadius: BorderRadius.circular(screenWidth * 0.02),
          ),
          child: Text(
            "139.00 EGP",
            style: Styles.hint.copyWith(
              color: Colors.white,
              fontSize: screenWidth * 0.03,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMenuItemImage(double screenWidth, double screenHeight) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(screenWidth * 0.07),
      child: Image.asset(
        "assets/images/meal_test.png",
        width: screenWidth * 0.4,
        height: screenWidth * 0.25,
        fit: BoxFit.cover,
      ),
    );
  }
}
