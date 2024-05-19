import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:wajba/core/util/sizeConfig.dart';
import 'package:wajba/features/Home/presentation/view/widgets/Shortcuts/Hot%20Deals/hot_kitchens_listview_item.dart';

class HotKitchensListView extends StatelessWidget {
  const HotKitchensListView({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double width = SizeConfig.screenW!;
    double height = SizeConfig.screenH!;
    return SizedBox(
      height: height * .4,
      child: CarouselSlider.builder(
        itemCount: 3,
        itemBuilder: (context, index, realindex) {
          return const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: HotKitchensListViewItem());
        },
        options: CarouselOptions(
          autoPlay: false,
          enlargeCenterPage: true,
        ),
      ),
    );
    ;
  }
}
