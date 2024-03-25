import 'package:flutter/material.dart';
import 'package:wajba/core/constants/constants.dart';
import 'package:wajba/core/styles.dart';

class AccountItem extends StatelessWidget {
  const AccountItem({
    super.key,
    required this.width,
    this.icon,
    required this.name,
    this.balance,
    this.path,
  });

  final double width;
  final IconData? icon;
  final String name;
  final String? balance;
  final String? path;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (path != null) {
          Navigator.pushNamed(
            context,
            path!,
            arguments: name == 'Wajbah Wallet'
                ? {'balance': balance!}
                : null, // Pass balance as an argument
          );
        }
      },
      child: Padding(
        padding: const EdgeInsets.only(
          left: 24,
        ),
        child: ListTile(
          trailing: balance != null
              ? Text(
                  'EGP\t${balance!}',
                  style: Styles.hint,
                )
              : IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.arrow_forward_ios,
                    size: 18,
                    color: wajbah_gray,
                  )),
          leading: Icon(
            icon,
            size: 25,
            color: wajbah_black,
          ),
          title: Text(
            name,
            style: Styles.titleSmall.copyWith(color: wajbah_black),
          ),
        ),
      ),
    );
  }
}
