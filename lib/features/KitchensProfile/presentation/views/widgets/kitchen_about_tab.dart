import 'package:flutter/material.dart';
import 'package:wajba/constants/constants.dart';
import 'package:wajba/core/sizeConfig.dart';

import '../../../../../core/styles.dart';

class KitchenAboutTab extends StatelessWidget {
  const KitchenAboutTab({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double width = SizeConfig.screenW!;
    double height = SizeConfig.screenH!;
    return Column(
      children: [
        ListTile(
          leading: const Icon(
            Icons.watch_later_rounded,
            color: wajbah_primary,
          ),
          title: const Text(
            "Working hours",
            style: Styles.titleSmall,
          ),
          trailing: Container(
              width: 95,
              padding: const EdgeInsets.all(3),
              decoration: const BoxDecoration(color: wajbah_green_light),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(
                    Icons.watch_later_sharp,
                    color: wajbah_green,
                  ),
                  Text(
                    "open now",
                    style: TextStyle(color: wajbah_green),
                  )
                ],
              )),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "Everyday",
              style: Styles.hint.copyWith(color: wajbah_gray),
            ),
            Text(
              "10:00 AM - 3:00 AM",
              style: Styles.hint.copyWith(color: wajbah_black),
            )
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        const ListTile(
          leading: Icon(
            Icons.notes,
            color: wajbah_primary,
          ),
          title: Text(
            "Story behind kitchen",
            style: Styles.titleSmall,
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 50.0),
          child: Text(
            "There is some debate over where the kitchen witchoriginated, some claiming  Germany and others England but consensus points to older Northern European customs, as it seems to have been more widespread earlier.The Legendary Secret of Goof-Proof Cooking",
            textAlign: TextAlign.left,
            style: TextStyle(color: wajbah_gray),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        const ListTile(
          leading: Icon(
            Icons.video_camera_back,
            color: wajbah_primary,
          ),
          title: Text(
            "Kitchen video",
            style: Styles.titleSmall,
          ),
        ),
        ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(
              "assets/images/Allow_Location.png",
              height: height * 0.2,
              width: width,
            ))
      ],
    );
  }
}
