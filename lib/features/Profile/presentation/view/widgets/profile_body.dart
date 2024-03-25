// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wajba/core/constants/constants.dart';
import 'package:wajba/core/sizeConfig.dart';
import 'package:wajba/core/styles.dart';

import 'package:wajba/features/Account/presentation/view/widgets/account_appbar.dart';
import 'package:wajba/features/Profile/presentation/view/widgets/profile_items_divider.dart';
import 'package:wajba/features/Profile/presentation/view/widgets/profile_list_item.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double width = SizeConfig.screenW!;
    double height = SizeConfig.screenH!;
    var args = ModalRoute.of(context)!.settings.arguments as ProfileData;
    return SafeArea(
      child: Column(
        children: [
          AccountAppBar(
            title: 'Profile',
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50), color: wajbah_primary),
            width: width * 0.18,
            height: height * 0.10,
            child: Center(
              child: Padding(
                padding: EdgeInsets.only(top: height * 0.016),
                child: Text(
                  args.name.substring(0, 1),
                  style: Styles.titleMedium
                      .copyWith(color: wajbah_white, fontSize: 40),
                ),
              ),
            ),
          ),
          SizedBox(
            height: height * 0.03,
          ),
          Text(
            args.name,
            style: Styles.titleMedium.copyWith(fontSize: 20),
          ),
          SizedBox(
            height: height * 0.04,
          ),
          Container(
            width: width * 0.8,
            height: height * 0.565,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.black.withOpacity(0.3))),
            child: Column(
              children: [
                ProfileListItem(
                  width: width,
                  height: height,
                  title: 'Edit Profile Name',
                  icon: Icons.edit_document,
                ),
                ProfileItemsDivider(width: width),
                ProfileListItem(
                  width: width,
                  height: height,
                  title: 'Previous Orders',
                  icon: Icons.playlist_add_check_sharp,
                ),
                ProfileItemsDivider(width: width),
                ProfileListItem(
                  width: width,
                  height: height,
                  title: 'My Promo Codes',
                  icon: Icons.percent,
                ),
                ProfileItemsDivider(width: width),
                ProfileListItem(
                  width: width,
                  height: height,
                  title: 'Change Phone Number',
                  icon: FontAwesomeIcons.phoneVolume,
                ),
                ProfileItemsDivider(width: width),
                ProfileListItem(
                  width: width,
                  height: height,
                  title: 'Change Password',
                  icon: Icons.password,
                ),
                ProfileItemsDivider(width: width),
                ProfileListItem(
                  width: width,
                  height: height,
                  title: 'Change Email',
                  icon: FontAwesomeIcons.solidEnvelope,
                ),
                ProfileItemsDivider(width: width),
                InkWell(
                  onTap: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, 'login', (route) => false);
                  },
                  child: ProfileListItem(
                    width: width,
                    height: height,
                    title: 'Logout',
                    icon: Icons.logout,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileData {
  String name;
  ProfileData({
    required this.name,
  });
}
