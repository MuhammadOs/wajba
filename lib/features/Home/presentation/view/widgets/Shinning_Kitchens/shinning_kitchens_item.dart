import 'package:flutter/material.dart';
import 'package:wajba/core/util/sizeConfig.dart';
import 'package:wajba/core/util/styles.dart';
import 'package:wajba/features/Home/presentation/view/widgets/ratings.dart';

import '../../../../../../core/util/theme.dart';

class ShinningKitchenItem extends StatelessWidget {
  const ShinningKitchenItem({
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
          width: MediaQuery.of(context).size.width * 0.72,
          height: MediaQuery.of(context).size.height * 0.34,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(25)),
              color: Colors.white,
              boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 2)]),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: height * 0.2,
                width: width * 0.8,
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
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Row(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .1,
                      width: MediaQuery.of(context).size.width * .15,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                            'assets/images/HomeScreen/WillysIcon.png'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                'Willys Kitchen',
                                style: Styles.titleLarge.copyWith(fontSize: 16),
                              ),
                              const SizedBox(
                                width: 7,
                              ),
                              const Icon(
                                Icons.verified,
                                color: wajbah_primary,
                                size: 20,
                              )
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.006,
                          ),
                          Text(
                            'beef, chicken and more',
                            style: Styles.hint.copyWith(fontSize: 12),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.006,
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
          top: MediaQuery.of(context).size.height * 0.02,
          left: MediaQuery.of(context).size.width * 0.02,
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
