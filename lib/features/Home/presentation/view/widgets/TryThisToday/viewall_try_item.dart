import 'package:flutter/material.dart';
import 'package:wajba/constants/constants.dart';
import 'package:wajba/core/sizeConfig.dart';
import 'package:wajba/core/styles.dart';

class TryThisTodayViewAllItem extends StatelessWidget {
  const TryThisTodayViewAllItem({
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
          width: width * 0.45,
          height: height * 0.269,
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
                padding: const EdgeInsets.only(left: 7, top: 15),
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
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: height * 0.123,
          right: width * 0.025,
          child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(23)),
              ),
              width: width * 0.1,
              height: height * 0.1,
              child: Image.asset('assets/images/HomeScreen/WillysIcon.png')),
        ),
        Positioned(
          top: height * 0.159,
          right: width * 0.252,
          child: Container(
              decoration: const BoxDecoration(
                color: wajbah_primary,
                borderRadius: BorderRadius.all(Radius.circular(23)),
              ),
              width: width * 0.16,
              height: height * 0.03,
              child: Center(
                  child: Text(
                '120 EGP',
                style: Styles.titleMedium
                    .copyWith(fontSize: 12, color: wajbah_white),
              ))),
        ),
        Positioned(
          top: height * 0.188,
          right: width * 0.054,
          child: const Icon(
            Icons.verified_sharp,
            color: wajbah_primary,
            size: 15,
          ),
        ),
      ],
    );
  }
}
