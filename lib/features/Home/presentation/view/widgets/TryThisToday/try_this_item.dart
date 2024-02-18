import 'package:flutter/material.dart';
import 'package:wajba/constants/constants.dart';
import 'package:wajba/core/sizeConfig.dart';
import 'package:wajba/core/styles.dart';

class TryThisListItem extends StatelessWidget {
  const TryThisListItem({
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
          width: width * 0.4,
          height: height * 0.235,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(23)),
              color: Colors.white,
              boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 2)]),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                alignment: Alignment.topCenter,
                'assets/images/HomeScreen/TryThisBurger.png',
              ),
              Padding(
                padding: const EdgeInsets.only(left: 7, top: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Willys Burger',
                      style: Styles.titleSmall.copyWith(fontSize: 15),
                    ),
                    Text(
                      '200 gr burger + cheese lettuce + sauce + onion rings',
                      style: Styles.hint.copyWith(fontSize: 8),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Text(
                      '120 EGP',
                      style: Styles.titleLarge
                          .copyWith(fontSize: 12, color: wajbah_primary),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: height * 0.09,
          right: 2,
          child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(23)),
              ),
              width: width * 0.1,
              height: height * 0.1,
              child: Image.asset('assets/images/HomeScreen/WillysIcon.png')),
        ),
      ],
    );
  }
}
