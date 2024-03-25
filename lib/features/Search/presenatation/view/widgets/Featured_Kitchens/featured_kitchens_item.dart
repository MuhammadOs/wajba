import 'package:flutter/material.dart';
import 'package:wajba/core/constants/constants.dart';
import 'package:wajba/core/sizeConfig.dart';
import 'package:wajba/core/styles.dart';
import 'package:wajba/features/Home/presentation/view/widgets/ratings.dart';
import 'package:wajba/core/widgets/customer_container.dart';

class FeaturedKitchenItem extends StatelessWidget {
  const FeaturedKitchenItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double width = SizeConfig.screenW!;
    double height = SizeConfig.screenH!;
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.6,
          height: MediaQuery.of(context).size.height * 0.25,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(25)),
              color: Colors.white,
              boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 2)]),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: height * 0.15,
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
                padding: const EdgeInsets.symmetric(horizontal: 10),
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
                                style: Styles.titleLarge.copyWith(fontSize: 18),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              const Icon(
                                Icons.verified,
                                color: wajbah_primary,
                                size: 20,
                              )
                            ],
                          ),
                          Text(
                            'beef, chicken and more',
                            style: Styles.hint.copyWith(fontSize: 12),
                          ),
                          const Ratings(
                            rating: 150,
                          ),
                          const CustomContainer(
                            label: "open now",
                            icon: Icons.watch_later_sharp,
                            iconColor: wajbah_green,
                            labelColor: wajbah_green,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
