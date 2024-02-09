import 'package:flutter/material.dart';
import 'package:wajba/constants/constants.dart';
import 'package:wajba/core/styles.dart';

class OfferCard extends StatelessWidget {
  const OfferCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            color: wajbah_buttons, borderRadius: BorderRadius.circular(15)),
        child: ListTile(
          onTap: () {},
          leading: Image.asset(
            "assets/images/offer_icon.png",
            height: 30,
            width: 30,
          ),
          title: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "EGP 85 off on selected",
                overflow: TextOverflow.ellipsis,
                style: Styles.hint.copyWith(color: wajbah_primary),
              ),
              Text(
                "Max 2 Orders",
                style: Styles.hint.copyWith(color: wajbah_primary),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
