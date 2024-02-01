import 'package:flutter/material.dart';
import 'package:wajba/constants/constants.dart';
import 'package:wajba/core/sizeConfig.dart';
import 'package:wajba/core/styles.dart';
import 'package:wajba/features/Authentication/presentations/views/permissions_view/widgets/permissions_body.dart';

import '../widgets/permissions_button.dart';

class AllowNotification extends StatefulWidget {
  const AllowNotification({super.key});

  @override
  State<AllowNotification> createState() => _AllowNotification();
}

class _AllowNotification extends State<AllowNotification> {
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
          PersmissionsBody(
              width: width,
              height: height,
              mainText: 'Allow your notification',
              subText:
                  '\t\twe\'ll be able to send you\noffers and recomendations',
              image: 'assets/images/Allow_notification.png'),
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
