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
                  'willy’s kitchen',
                  style: Styles.titleMedium.copyWith(fontSize: 28),
                ),
                const SizedBox(height: 4),
                Text(
                  '1 single beef or chicken sandwich + 1 single beef burger or 1 single chicke...',
                  style: Styles.hint.copyWith(color: const Color(0xff696969)),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Text(
                      "EGP 209.00",
                      style: Styles.hint
                          .copyWith(decoration: TextDecoration.lineThrough),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: wajbah_primary,
                          borderRadius: BorderRadius.circular(10)),
                      child: Text(
                        "139.00 EGP",
                        style: Styles.hint
                            .copyWith(color: Colors.white, fontSize: 12),
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
                  "assets/images/Allow_Location.png",
                  width: 180,
                  height: 180,
                )),
          ),
        ],
      ),
    );
    /*Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("willy one sandwich"),
            Text(
                "1 single beef or chicken sandwich + 1 single beef burger or 1 single chicken"),
            Row(
              children: [
                Text("EGP 209.00"),
                Container(
                  padding: EdgeInsets.all(4),
                  child: Text("139.00 EGP "),
                )
              ],
            )
          ],
        ),
        /*ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(
            "assets/images/Allow_Location.png",
            height: 2,
            width: 2,
          ),
        )*/
      ],
    );*/
  }
}
