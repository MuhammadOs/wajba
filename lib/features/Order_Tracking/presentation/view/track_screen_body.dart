import 'package:flutter/material.dart';
import 'package:wajba/core/util/theme.dart';
import 'package:wajba/core/util/styles.dart';
import 'package:wajba/features/Order_Tracking/data/timeline_data.dart';
import '../../../../core/util/sizeConfig.dart';
import '../../../../core/widgets/custom_appbar.dart';
import 'process_timeline.dart';

class TrackScreenBody extends StatelessWidget {
  const TrackScreenBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = SizeConfig.screenW!;
    double height = SizeConfig.screenH!;
    double fontSize = SizeConfig.fontSize!;
    double iconSize = SizeConfig.iconSize!;
    return SafeArea(
      child: Column(
        children: [
          CustomAppBar(
            title: 'Track Your Order',
          ),
          Text(
            'Estimated time of this is 60 min',
            style: Styles.titleMedium.copyWith(fontSize: 18),
          ),
          SizedBox(
              width: width,
              height: height * 0.1,
              child: ProcessTimelinePage(
                processes: processes,
              )),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 32),
            child: Align(
              alignment: Alignment.topLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Wajbah From',
                    style: Styles.hint,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Willys Kitchen',
                    style: Styles.titleMedium.copyWith(fontSize: 16),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Divider(
            thickness: 10,
            color: wajbah_gray_light,
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Payment details", style: Styles.titleMedium.copyWith(
                  fontSize: 18,
                ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Subtotal:',
                      style: Styles.titleSmall,
                    ),
                    Text(
                      '\$ 47.96',
                      style: Styles.titleSmall,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Tax (4.80%):',
                      style: Styles.titleSmall,
                    ),
                    Text(
                      '\$ 4.80}',
                      style: Styles.titleSmall,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Delivery Fee:',
                      style: Styles.titleSmall,
                    ),
                    Text(
                      '\$ 5.00}',
                      style: Styles.titleSmall,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Discount:',
                      style: Styles.titleSmall,
                    ),
                    Text(
                      '\$ 2.00',
                      style: Styles.titleSmall,
                    ),
                  ],
                ),
                Divider(
                  color: wajbah_gray_light,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total:',
                      style: Styles.titleSmall,
                    ),
                    Text(
                      '\$ 55.76',
                      style: Styles.titleSmall,
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
