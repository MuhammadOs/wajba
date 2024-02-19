import 'package:flutter/material.dart';
import 'package:wajba/core/sizeConfig.dart';

import 'package:wajba/features/Home/data/shortcuts_data.dart';
import 'package:wajba/features/Home/presentation/view/widgets/Shortcuts/shortcuts_item.dart';

class ShortcutsListView extends StatelessWidget {
  const ShortcutsListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    double height = SizeConfig.screenH!;
    return SizedBox(
      height: height * 0.145,
      child: ListView.builder(
        itemCount: shortcutsdata.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: ShortCutItem(shortcut: shortcutsdata[index]),
          );
        },
      ),
    );
  }
}
