import 'package:flutter/material.dart';
import 'package:wajba/core/util/theme.dart';
import 'package:wajba/core/util/sizeConfig.dart';
import 'package:wajba/features/KitchensProfile/presentation/views/widgets/kitchen_raiting_container.dart';
import '../../../../../core/util/styles.dart';

class KitchenAboutTab extends StatelessWidget {
  const KitchenAboutTab({Key? key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final screenWidth = SizeConfig.screenW!;
    final screenHeight = SizeConfig.screenH!;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02),
      child: Column(
        children: [
          ListTile(
            leading: Icon(
              Icons.watch_later_rounded,
              color: wajbah_primary,
              size: screenWidth * 0.05,
            ),
            title: Text(
              "Working hours",
              style: Styles.hint
                  .copyWith(fontSize: screenWidth * 0.04, color: wajbah_black),
            ),
            trailing: SizedBox(
              width: screenWidth * 0.25,
              child: const KitchenProfileCustomContainer(
                icon: Icons.watch_later,
                label: 'Open Now',
                iconColor: wajbah_green,
                labelColor: wajbah_green,
                containerColor: wajbah_green_light,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Everyday",
                style: Styles.hint
                    .copyWith(color: wajbah_gray, fontSize: screenWidth * 0.03),
              ),
              Text(
                "10:00 AM - 3:00 AM",
                style: Styles.hint
                    .copyWith(color: wajbah_gray, fontSize: screenWidth * 0.03),
              ),
            ],
          ),
          SizedBox(height: screenHeight * 0.015),
          ListTile(
            leading: Icon(
              Icons.notes,
              color: wajbah_primary,
              size: screenWidth * 0.05,
            ),
            title: Text(
              "Story behind kitchen",
              style: Styles.hint
                  .copyWith(fontSize: screenWidth * 0.04, color: wajbah_black),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: screenWidth * 0.1, right: screenWidth * 0.02),
            child: Text(
              "There is some debate over where the kitchen witch originated, some claiming Germany and others England but consensus points to older Northern European customs, as it seems to have been more widespread earlier. The Legendary Secret of Goof-Proof Cooking.",
              style: Styles.hint.copyWith(fontSize: screenWidth * 0.03),
            ),
          ),
          SizedBox(height: screenHeight * 0.015),
          ListTile(
            leading: Icon(
              Icons.video_camera_back,
              color: wajbah_primary,
              size: screenWidth * 0.05,
            ),
            title: Text(
              "Kitchen video",
              style: Styles.hint
                  .copyWith(fontSize: screenWidth * 0.04, color: wajbah_black),
            ),
          ),
          SizedBox(height: screenHeight * 0.015),
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(screenWidth * 0.05),
              child: Image.asset(
                "assets/images/meal_test.png",
                width: screenWidth * 0.8,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
