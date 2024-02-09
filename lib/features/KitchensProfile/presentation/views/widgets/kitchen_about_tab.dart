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
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Column(
        children: [
          ListTile(
            leading: const Icon(
              Icons.watch_later_rounded,
              color: wajbah_primary,
              size: 35,
            ),
            title: Text(
              "Working hours",
              style: Styles.hint.copyWith(fontSize: 20, color: wajbah_black),
            ),
            trailing: Container(
                width: width * 0.2,
                padding: const EdgeInsets.all(5),
                decoration: const BoxDecoration(color: wajbah_green_light),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Icon(
                      Icons.watch_later_sharp,
                      color: wajbah_green,
                      size: 20,
                    ),
                    Text(
                      "open now",
                      style: Styles.hint
                          .copyWith(fontSize: 12, color: wajbah_green),
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
                style: Styles.hint.copyWith(color: const Color(0xff727272)),
              )
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          ListTile(
            leading: const Icon(
              Icons.notes,
              color: wajbah_primary,
              size: 35,
            ),
            title: Text(
              "Story behind kitchen",
              style: Styles.hint.copyWith(fontSize: 20, color: wajbah_black),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 64.0, right: 16),
            child: Text(
              "There is some debate over where the kitchen witchoriginated, some claiming  Germany and others England but consensus points to older Northern European customs, as it seems to have been more widespread earlier.The Legendary Secret of Goof-Proof Cooking",
              style: TextStyle(color: wajbah_gray),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          ListTile(
            leading: const Icon(
              Icons.video_camera_back,
              color: wajbah_primary,
              size: 35,
            ),
            title: Text(
              "Kitchen video",
              style: Styles.hint.copyWith(fontSize: 20, color: wajbah_black),
            ),
          ),
          ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                "assets/images/Allow_Location.png",
                height: height * 0.25,
                width: width * 0.8,
              ))
        ],
      ),
    );
  }
}
