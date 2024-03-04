import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wajba/constants/constants.dart';
import 'package:wajba/core/sizeConfig.dart';
import 'package:wajba/core/styles.dart';
import 'package:wajba/features/Account/presentation/view/widgets/account_main_title.dart';
import 'package:wajba/features/Account/presentation/view/widgets/account_subitem.dart';

class AccountViewBody extends StatelessWidget {
  const AccountViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double width = SizeConfig.screenW!;
    double height = SizeConfig.screenH!;
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            AccountNameTitle(
              height: height,
              width: width,
              name: 'Kareem Alaa',
            ),
            SizedBox(
              height: height * 0.03,
            ),
            AccountItem(
              width: width,
              icon: Icons.notifications,
              name: 'Notification',
            ),
            AccountItem(
                width: width,
                balance: 'EGP\t\t' + '0.00',
                icon: FontAwesomeIcons.creditCard,
                name: 'Payment Methods'),
            AccountItem(
                width: width,
                icon: Icons.wallet_outlined,
                name: 'Wajbah Wallet'),
            Divider(
              color: wajbah_gray,
              endIndent: width * 0.09,
              indent: width * 0.09,
            ),
            AccountItem(width: width, icon: Icons.settings, name: 'Settings'),
            AccountItem(width: width, icon: Icons.star, name: 'Rate App'),
            AccountItem(
                width: width,
                icon: FontAwesomeIcons.solidComments,
                name: 'Need Help ?'),
            AccountItem(
                width: width,
                icon: FontAwesomeIcons.gift,
                name: 'Refer and Earn'),
            AccountItem(
                width: width,
                icon: FontAwesomeIcons.exclamationCircle,
                name: 'About Us'),
          ],
        ),
      ),
    );
  }
}
