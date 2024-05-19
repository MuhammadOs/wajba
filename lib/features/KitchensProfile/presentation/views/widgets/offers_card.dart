import 'package:flutter/material.dart';
import 'package:wajba/core/util/theme.dart';
import 'package:wajba/core/util/sizeConfig.dart';

class OfferCard extends StatelessWidget {
  const OfferCard({Key? key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final double screenWidth = SizeConfig.screenW!;
    final double cardWidth = screenWidth * 0.5;
    final double paddingValue = cardWidth * 0.03;

    return Container(
      width: cardWidth,
      decoration: BoxDecoration(
        color: wajbah_buttons,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(paddingValue),
            child: Image.asset(
              "assets/images/offer_icon.png",
              height: screenWidth * 0.07,
              width: screenWidth * 0.07,
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "EGP 85 off on selected",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: wajbah_primary,
                      fontSize: screenWidth * 0.025,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "Max 2 Orders",
                  style: TextStyle(
                    color: wajbah_primary,
                    fontSize: screenWidth * 0.025, // Responsive font size
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
