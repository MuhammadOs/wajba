import 'package:flutter/material.dart';
import 'package:wajba/core/util/theme.dart';
import 'package:wajba/core/util/styles.dart';
import 'package:wajba/features/Profile/presentation/view/widgets/profile_body.dart';

class AccountNameTitle extends StatelessWidget {
  const AccountNameTitle({
    Key? key,
    required this.height,
    required this.width,
    required this.name,
  }) : super(key: key);

  final double height;
  final double width;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: width * 0.03, top: height * 0.05),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, 'Profile View',
              arguments: ProfileData(name: name));
        },
        child: ListTile(
          leading: CircleAvatar(
            radius: 30,
            backgroundColor: wajbah_primary,
            child: Center(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: height * 0.005),
                child: Text(
                  name.substring(0, 1),
                  style: Styles.titleLarge
                      .copyWith(fontSize: 30, color: wajbah_white),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          /*Container(
            width: width * 0.13,
            height: width * 0.13,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: wajbah_primary,
            ),
            child: Center(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: height * 0.005),
                child: Text(
                  name.substring(0, 1),
                  style: Styles.titleLarge
                      .copyWith(fontSize: 30, color: wajbah_white),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          */
          title: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            name,
            style:
            Styles.titleLarge.copyWith(fontSize: 18, color: wajbah_black),
          ),
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          size: 18,
        ),
      ),
    ),);
  }
}
