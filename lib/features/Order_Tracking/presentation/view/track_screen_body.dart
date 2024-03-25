import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/iconoir.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';
import 'package:wajba/core/constants/constants.dart';
import 'package:wajba/core/styles.dart';
import 'package:wajba/features/Account/presentation/view/widgets/account_appbar.dart';
import 'package:wajba/features/Order_Tracking/data/timeline_data.dart';

import 'process_timeline.dart';

class TrackScreenBody extends StatelessWidget {
  const TrackScreenBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          AccountAppBar(
            title: 'Track Your Order',
          ),
          Text(
            'Estimated time of this is 60 min',
            style: Styles.titleMedium.copyWith(fontSize: 18),
          ),
          SizedBox(
              width: 400,
              height: 100,
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
                  Text(
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
        ],
      ),
    );
  }
}
