import 'package:flutter/material.dart';
import 'package:wajba/core/sizeConfig.dart';
import 'package:wajba/features/Home/presentation/view/widgets/TryThisToday/try_this_item.dart';

class TryThisListView extends StatelessWidget {
  const TryThisListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    double height = SizeConfig.screenH!;
    return SizedBox(
      height: height * 0.238,
      child: ListView.builder(
        itemCount: 5,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: TryThisListItem(),
          );
        },
      ),
    );
  }
}
