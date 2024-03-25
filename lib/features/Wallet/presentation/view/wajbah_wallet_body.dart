// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

import 'package:wajba/core/constants/constants.dart';
import 'package:wajba/core/sizeConfig.dart';
import 'package:wajba/core/styles.dart';

class WajbahWalletBody extends StatelessWidget {
  const WajbahWalletBody({Key? key});

  @override
  Widget build(BuildContext context) {
    final Map<String, String> args =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final String balance = args['balance'] ?? '0.00';
    double width = SizeConfig.screenW!;
    double height = SizeConfig.screenH!;
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: wajbah_primary,
            borderRadius: BorderRadius.circular(23),
          ),
          width: width * 0.85,
          height: height * 0.3,
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 13),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Available Balance',
                      style: Styles.titleMedium
                          .copyWith(color: wajbah_white, fontSize: 15),
                    ),
                    Row(
                      children: [
                        Text(
                          'EGP\t',
                          style: Styles.titleMedium
                              .copyWith(color: wajbah_white, fontSize: 32),
                        ),
                        SizedBox(
                          width: width * 0.008,
                        ),
                        Text(
                          balance,
                          style: Styles.titleMedium
                              .copyWith(color: wajbah_white, fontSize: 48),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(
                  top: height * 0.02,
                  right: width * 0.03,
                  child: Image.asset(
                    'assets/images/wajbah.png',
                    scale: width * 0.007,
                  )),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(right: width * 0.25, top: height * 0.03),
          child: Text(
            'Transactions History',
            style: Styles.titleMedium.copyWith(fontSize: 20),
          ),
        )
      ],
    );
  }
}
