import 'package:flutter/material.dart';
import 'package:wajba/core/sizeConfig.dart';
import 'package:wajba/features/KitchensProfile/presentation/views/kitchen_profile_view.dart';

import 'featured_kitchens_item.dart';

class FeaturedKitchensListView extends StatelessWidget {
  const FeaturedKitchensListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double height = SizeConfig.screenH!;
    return SizedBox(
      height: height * 0.4,
      child: ListView.builder(
        itemCount: 5,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (c) {
                    return const KitchenProfileView();
                  },
                ));
              },
              child: const Padding(
                padding: EdgeInsets.only(left: 24.0, top: 10),
                child: FeaturedKitchenItem(),
              ));
        },
      ),
    );
  }
}
