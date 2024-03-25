import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wajba/core/constants/constants.dart';
import 'package:wajba/core/sizeConfig.dart';
import 'package:wajba/core/styles.dart';

class NoNotificationsBody extends StatelessWidget {
  const NoNotificationsBody({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = SizeConfig.screenW!;
    double height = SizeConfig.screenH!;
    return Padding(
      padding: EdgeInsets.only(top: height * 0.15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FaIcon(
            FontAwesomeIcons.solidPaperPlane,
            size: height * 0.2,
            color: wajbah_primary,
          ),
          SizedBox(
            height: height * 0.04,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text(
              'No Notification Yet',
              style: Styles.hint.copyWith(fontSize: 20),
            ),
          ),
          Text(
            'Notifications Recived will be Placed Here',
            style: Styles.hint.copyWith(fontSize: 12),
          )
        ],
      ),
    );
  }
}
