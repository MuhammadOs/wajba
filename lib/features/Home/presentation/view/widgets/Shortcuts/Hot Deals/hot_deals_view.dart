import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:wajba/core/constants/constants.dart';
import 'package:wajba/core/sizeConfig.dart';
import 'package:wajba/core/styles.dart';
import 'package:wajba/features/Home/presentation/view/widgets/Shortcuts/Hot%20Deals/featured_slider.dart';
import 'package:wajba/features/Home/presentation/view/widgets/Shortcuts/Hot%20Deals/hot_deals_kitchen_listview_item.dart';
import 'package:wajba/features/Home/presentation/view/widgets/Shortcuts/Hot%20Deals/hot_deals_kitchen_title.dart';

class HotDealsView extends StatelessWidget {
  const HotDealsView({Key? key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              children: [
                Text(
                  'Featured',
                  style: Styles.titleMedium.copyWith(fontSize: 20),
                )
              ],
            ),
          ),
          FeaturedSlider(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              children: [
                Text(
                  'Koshary',
                  style: Styles.titleMedium.copyWith(fontSize: 20),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
