import 'package:flutter/material.dart';
import 'package:wajba/features/Home/data/kitchens_nearby_data.dart';

import 'package:wajba/features/Home/presentation/view/widgets/Kitchens_nearby/kitchens_nearby_item.dart';

class KitchensNearbyListview extends StatelessWidget {
  const KitchensNearbyListview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.16,
      child: ListView.builder(
        itemCount: kitchensnearbydata.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: KitchensNearbyItem(kitchen: kitchensnearbydata[index]),
          );
        },
      ),
    );
  }
}
