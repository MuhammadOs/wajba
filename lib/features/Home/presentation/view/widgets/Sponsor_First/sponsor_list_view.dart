import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:wajba/core/util/sizeConfig.dart';
import 'package:wajba/features/Home/data/sponsers_data.dart';
import 'package:wajba/features/Home/presentation/view/widgets/Sponsor_First/sponsor_listview_item.dart';

class SponsorListView extends StatelessWidget {
  const SponsorListView({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    double height = SizeConfig.screenH!;
    return SizedBox(
      height: height * .2,
      child: CarouselSlider.builder(
        itemCount: sponsordata.length,
        itemBuilder: (context, index, realindex) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: SponsorListItem(
              sponsores: sponsordata[index],
            ),
          );
        },
        options: CarouselOptions(
            height: MediaQuery.of(context).size.height * .2,
            autoPlay: true,
            enlargeCenterPage: true),
      ),
    );
  }
}
