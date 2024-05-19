import 'package:flutter/material.dart';
import 'package:wajba/core/util/sizeConfig.dart';
import 'package:wajba/core/util/styles.dart';
import 'package:wajba/features/Home/presentation/view/widgets/ratings.dart';
import 'package:wajba/features/KitchensProfile/presentation/views/widgets/kitchen_raiting_container.dart';

import '../../../../../../core/util/theme.dart';

class ShinningAllItems extends StatelessWidget {
  const ShinningAllItems({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double width = SizeConfig.screenW!;
    double height = SizeConfig.screenH!;
    double iconSize = SizeConfig.iconSize!;
    return Stack(
      children: [
        Container(
          width: width * 0.928,
          height: height * 0.4,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(25)),
              color: Colors.white,
              boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 2)]),
          child: Column(
            children: [
              SizedBox(
                height: height * 0.25,
                width: width * 0.928,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(25),
                      topLeft: Radius.circular(25)),
                  child: Image.asset(
                    fit: BoxFit.cover,
                    alignment: Alignment.topCenter,
                    'assets/images/HomeScreen/WillysKitchen.png',
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                child: Row(
                  children: [
                    SizedBox(
                      height: height * .1,
                      width: width * .15,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                            'assets/images/HomeScreen/WillysIcon.png'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                'Willys Kitchen',
                                style: Styles.titleLarge.copyWith(fontSize: 16),
                              ),
                              SizedBox(
                                width: width * .01,
                              ),
                              const Icon(
                                Icons.verified,
                                color: wajbah_primary,
                                size: 20,
                              ),
                              SizedBox(
                                width: width * .09,
                              ),
                              const KitchenProfileCustomContainer(
                                icon: Icons.watch_later,
                                label: 'Open Now',
                                iconColor: wajbah_green,
                                labelColor: wajbah_green,
                                containerColor: wajbah_green_light,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: height * 0.006,
                          ),
                          Text(
                            'beef, chicken and more',
                            style: Styles.hint.copyWith(fontSize: 12),
                          ),
                          SizedBox(
                            height: height * 0.006,
                          ),
                          Ratings(
                            rating: 150,
                            size: iconSize,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: height * 0.02,
          left: width * 0.02,
          child: Container(
            width: 166,
            height: 22,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(23)),
              color: wajbah_buttons,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Icon(
                  Icons.airplane_ticket_sharp,
                  size: 20,
                  color: wajbah_primary,
                ),
                Text(
                  'EGP 85 off on selected items',
                  style: Styles.titleSmall
                      .copyWith(color: wajbah_primary, fontSize: 9),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
