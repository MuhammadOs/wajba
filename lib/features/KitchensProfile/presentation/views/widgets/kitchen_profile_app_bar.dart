import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'custom_back_button.dart';

class KitchensProfileAppBar extends StatelessWidget {
  const KitchensProfileAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(32.0),
      child: Row(
        children: [
          CustomBackButton()
        ],
      ),
    );
  }
}
