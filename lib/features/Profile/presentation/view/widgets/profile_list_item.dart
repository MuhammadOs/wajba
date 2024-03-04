import 'package:flutter/material.dart';
import 'package:wajba/constants/constants.dart';
import 'package:wajba/core/styles.dart';

class ProfileListItem extends StatelessWidget {
  const ProfileListItem({
    super.key,
    required this.width,
    required this.height,
    required this.title,
    required this.icon,
  });

  final double width;
  final double height;
  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.only(left: width * 0.05),
      leading: Icon(
        icon,
        color: title == 'Logout' ? Colors.red : wajbah_black,
        size: 25,
      ),
      title: Text(
        title,
        style: Styles.titleSmall.copyWith(
            fontSize: 15, color: title == 'Logout' ? Colors.red : wajbah_black),
      ),
      trailing: Visibility(
        visible: title == 'Logout' ? false : true,
        child: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.arrow_forward_ios,
              color: wajbah_gray,
              size: height * 0.024,
            )),
      ),
    );
  }
}