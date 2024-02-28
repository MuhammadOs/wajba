import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:wajba/constants/constants.dart';
import 'package:wajba/core/sizeConfig.dart';
import 'package:wajba/features/Home/presentation/view/widgets/Shortcuts/Hot%20Deals/hot_deals_kitchen_listview_item.dart';
import 'package:wajba/features/Home/presentation/view/widgets/Shortcuts/Hot%20Deals/hot_deals_kitchen_title.dart';

class FeaturedSlider extends StatelessWidget {
  const FeaturedSlider({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double width = SizeConfig.screenW!;
    double height = SizeConfig.screenH!;
    return CarouselSlider.builder(
      itemCount: 10,
      itemBuilder: (context, index, realindex) {
        return Container(
          height: height * 0.4,
          width: width * 0.64,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(23),
            color: wajbah_buttons,
          ),
          child: Column(
            children: [
              HotDealsKitchenTitle(
                  Icon: 'assets/images/Wajbah_Finale.png',
                  KitchenName: 'Willy\'s Kitchen'),
              SizedBox(
                height: height * 0.3,
                width: width * 0.61,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (index, context) {
                      return const SizedBox(
                        child: HotKitchenItems(
                          ItemImage: 'assets/images/Wajbah_Finale.png',
                          ItemIngredients:
                              '200 gr burger + cheese lettuce + sauce + onion rings',
                          ItemName: 'Willy\'s Burger',
                          NewPrice: '120.00',
                          OldPrice: '210.00',
                        ),
                      );
                    }),
              ),
            ],
          ),
        );
      },
      options: CarouselOptions(
          padEnds: false,
          height: MediaQuery.of(context).size.height * .4,
          autoPlay: false,
          enlargeCenterPage: false),
    );
  }
}
