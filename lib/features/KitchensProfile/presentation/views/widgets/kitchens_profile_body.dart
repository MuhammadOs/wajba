import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wajba/constants/constants.dart';
import 'package:wajba/features/KitchensProfile/presentation/views/widgets/kitchen_tab_layout.dart';

import '../../../../../core/styles.dart';
import 'offers_card.dart';

class KitchensProfileBody extends StatefulWidget {
  const KitchensProfileBody({Key? key}) : super(key: key);

  @override
  _KitchensProfileBodyState createState() => _KitchensProfileBodyState();
}

class _KitchensProfileBodyState extends State<KitchensProfileBody>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Row(
            children: [
              const Expanded(
                flex: 1,
                child: CircleAvatar(
                  radius: 70, // adjust as needed
                  backgroundImage:
                      AssetImage("assets/images/willy.png"),
                ),
              ),
              const SizedBox(width: 8),
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
                      'Burger, chicken, Fried chicken, wrap',
                      style:
                          Styles.hint.copyWith(color: const Color(0xff696969)),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'We hope to deliver you the best homemade food ever just like your mama’s food',
                      style: Styles.hint.copyWith(fontSize: 10),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                          decoration: BoxDecoration(
                              color: wajbah_green_light,
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.watch_later,
                                color: wajbah_green,
                                size: 16,
                              ),
                              Text(
                                "open now",
                                style: Styles.hint.copyWith(
                                    color: wajbah_green, fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 5),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                          decoration: BoxDecoration(
                              color: wajbah_buttons,
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.motorcycle,
                                color: wajbah_primary,
                                size: 16,
                              ),
                              Text(
                                "30-35 min",
                                style: Styles.hint.copyWith(
                                    fontSize: 12, color: wajbah_primary),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 5),
                        Container(
                          decoration: BoxDecoration(
                              color: wajbah_gray_light,
                              borderRadius: BorderRadius.circular(10)),
                          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.star,
                                color: Colors.yellow,
                                size: 16,
                              ),
                              Text(
                                "4.7(80)",
                                style: Styles.hint.copyWith(fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          SizedBox(
            height: 70,
            child: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: 4,
              itemBuilder: (context, index) =>
                  const SizedBox(width: 250, child: OfferCard()),
            ),
          ),
          const SizedBox(height: 10),
          const Divider(
            color: wajbah_gray,
            thickness: 3,
          ),
          const KitchenTabLayout()
        ],
      ),
    );
  }
}
