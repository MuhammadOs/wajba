import 'package:flutter/material.dart';
import 'package:wajba/core/sizeConfig.dart';

import 'offers_card.dart';

class OfferListView extends StatelessWidget {
  const OfferListView({Key? key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final screenWidth = SizeConfig.screenW!;

    return SizedBox(
      height: 70,
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: 4,
        itemBuilder: (context, index) => SizedBox(
          width: screenWidth * 0.4,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.01),
            child: const OfferCard(),
          ),
        ),
      ),
    );
  }
}
