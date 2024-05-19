import 'package:flutter/material.dart';
import 'package:wajba/core/util/theme.dart';
import 'package:wajba/core/util/sizeConfig.dart';
import 'package:wajba/core/util/styles.dart';
import 'package:wajba/features/Account/presentation/view/widgets/objective_item.dart';

import '../../../../../core/widgets/custom_appbar.dart';

class ReferAndEarnView extends StatefulWidget {
  const ReferAndEarnView({Key? key});

  @override
  State<ReferAndEarnView> createState() => _ReferAndEarnViewState();
}

class _ReferAndEarnViewState extends State<ReferAndEarnView>
    with TickerProviderStateMixin {
  late AnimationController controller1;
  late AnimationController controller2;

  @override
  void initState() {
    controller1 =
        AnimationController(vsync: this, duration: Duration(seconds: 10))
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              controller1.reverse();
            } else if (status == AnimationStatus.dismissed) {
              controller1.forward();
            }
          });

    controller2 =
        AnimationController(vsync: this, duration: Duration(seconds: 10))
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              controller2.reverse();
            } else if (status == AnimationStatus.dismissed) {
              controller2.forward();
            }
          });

    super.initState();
  }

  @override
  void dispose() {
    controller1.dispose();
    controller2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double width = SizeConfig.screenW!;
    double height = SizeConfig.screenH!;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            CustomAppBar(title: 'Refer And Earn'),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: height * 0.17),
                child: Column(
                  children: [
                    Text(
                      'Unlock your Referral Program',
                      style: Styles.titleMedium
                          .copyWith(fontSize: 20, color: wajbah_black),
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    Text(
                      'Refer a friend and receive credit in your wajbah wallet!\nThey will enjoy a discount on their first 2 orders, capped at EGP 50',
                      style: Styles.hint.copyWith(fontSize: 12),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: height * 0.05,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ReferAndEarnObjective(
                          controller: controller1,
                          width: width,
                          height: height,
                          icon: Icons.shopping_cart,
                          task: 'Complete 5 Orders',
                          remaining: '5',
                          total: 5,
                        ),
                        SizedBox(
                          width: width * 0.05,
                        ),
                        ReferAndEarnObjective(
                          controller: controller2,
                          width: width,
                          height: height,
                          icon: Icons.shopping_cart,
                          task: 'Spend EGP 1000+ on wajbah',
                          remaining: '100',
                          total: 1000,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
