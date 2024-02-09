import 'package:flutter/material.dart';

import '../../../../../constants/constants.dart';
import '../../../../../core/styles.dart';

class CustomMenuItem extends StatelessWidget {
  const CustomMenuItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, left: 30),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'willy one sandwich',
                  style: Styles.titleMedium.copyWith(fontSize: 20),
                ),
                const SizedBox(height: 8),
                Text(
                  '1 single beef or chicken sandwich + 1 single beef burger or 1 single chicken',
                  style: Styles.hint.copyWith(
                    color: const Color(0xff696969),
                    fontSize: 16
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Text(
                      "EGP 209.00",
                      style: Styles.hint
                          .copyWith(decoration: TextDecoration.lineThrough,
                        fontSize: 16
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: wajbah_primary,
                          borderRadius: BorderRadius.circular(10)),
                      child: Text(
                        "139.00 EGP",
                        style: Styles.hint
                            .copyWith(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            flex: 2,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: Image.asset(
                  "assets/images/meal_test.png",
                  width: 160,
                  height: 160,
                )),
          ),
        ],
      ),
    );
  }
}
