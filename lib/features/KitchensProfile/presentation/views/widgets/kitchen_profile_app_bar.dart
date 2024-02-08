import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wajba/constants/constants.dart';

class KitchensProfileAppBar extends StatelessWidget {
  const KitchensProfileAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Row(
        children: [
          GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Container(
              height: 35,
              width: 35,
              decoration: BoxDecoration(
                color: wajbah_buttons,
                borderRadius: BorderRadius.circular(10)
              ),
              child: const Icon(Icons.keyboard_arrow_left, size: 28,)
            ),
          )
        ],
      ),
    );
  }
}
