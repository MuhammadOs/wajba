import 'package:flutter/material.dart';
import 'package:wajba/core/constants/constants.dart';
import 'package:wajba/core/sizeConfig.dart';
import 'package:wajba/core/styles.dart';
import 'package:wajba/features/Authentication/presentations/views/permissions_view/widgets/permissions_body.dart';

import '../widgets/permissions_button.dart';

class AllowLocation extends StatefulWidget {
  const AllowLocation({super.key});

  @override
  State<AllowLocation> createState() => _AllowLocation();
}

class _AllowLocation extends State<AllowLocation> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double width = SizeConfig.screenW!;
    double height = SizeConfig.screenH!;
    debugPrint("$width");
    debugPrint("$height");
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          PermissionsBody(
              width: width,
              height: height,
              mainText: 'Allow your location',
              subText:
                  'we\'ll use your location to\ngive you better experience',
              image: 'assets/images/Allow_Location.png'),
          PermissionsButton(
            width: width * 1.32,
            text: "Sure, i'd like that",
          ),
          const SizedBox(
            height: 30,
          ),
          TextButton(
              onPressed: () {},
              child: Text(
                'Not now',
                style: Styles.titleSmall
                    .copyWith(fontSize: 14, color: wajbah_black),
              ))
        ],
      ),
    );
  }
}
