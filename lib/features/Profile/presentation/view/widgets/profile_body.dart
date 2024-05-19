import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wajba/core/util/theme.dart';
import 'package:wajba/core/util/sizeConfig.dart';
import 'package:wajba/core/util/styles.dart';
import 'package:wajba/features/Profile/presentation/view/widgets/profile_items_divider.dart';
import 'package:wajba/features/Profile/presentation/view/widgets/profile_list_item.dart';
import '../../../../../core/widgets/custom_appbar.dart';

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
          CustomAppBar(
            title: 'Profile',
          ),
          CircleAvatar(
            radius: 40,
            backgroundColor: wajbah_primary,
            child: Padding(
              padding: EdgeInsets.only(top: height * 0.016),
              child: Text(
                args.name.substring(0, 1),
                style: Styles.titleMedium
                    .copyWith(color: wajbah_white, fontSize: 40),
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
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.black.withOpacity(0.3))),
            child: Column(
              children: [
                // Wrap ProfileListItem with InkWell
                InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        String newProfileName =
                            args.name; // Initialize with current profile name
                        return AlertDialog(
                          title: Text(
                            'Edit Profile Name',
                            style: Styles.titleMedium.copyWith(fontSize: 18),
                          ),
                          content: TextField(
                            onChanged: (value) {
                              newProfileName =
                                  value; // Update new profile name as user types
                            },
                            decoration: const InputDecoration(
                              hintText: 'Enter your new name',
                            ),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context)
                                    .pop(); // Close dialog without saving changes
                              },
                              child: const Text('Cancel'),
                            ),
                            TextButton(
                              onPressed: () {
                                // Save changes and replace the profile name
                                args.name = newProfileName;
                                Navigator.of(context).pop();
                              },
                              child: Text('Save'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: ProfileListItem(
                    width: width,
                    height: height,
                    title: 'Edit Profile Name',
                    icon: Icons.edit_document,
                  ),
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
