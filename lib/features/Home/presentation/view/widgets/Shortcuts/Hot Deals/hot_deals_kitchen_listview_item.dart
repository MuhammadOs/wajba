import 'package:flutter/material.dart';
import 'package:wajba/core/constants/constants.dart';
import 'package:wajba/core/sizeConfig.dart';
import 'package:wajba/core/styles.dart';

class HotKitchenItems extends StatelessWidget {
  const HotKitchenItems(
      {super.key,
      required this.ItemImage,
      required this.ItemName,
      required this.ItemIngredients,
      required this.NewPrice,
      required this.OldPrice});

  final String ItemImage;
  final String ItemName;
  final String ItemIngredients;
  final String NewPrice;
  final String OldPrice;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double width = SizeConfig.screenW!;
    double height = SizeConfig.screenH!;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: height * 0.009),
      child: Container(
        width: width * 0.3,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(23)),
          color: Colors.white,
          boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 2)],
        ),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(23),
                    topRight: Radius.circular(23)),
                child: Image.asset(
                  alignment: Alignment.topCenter,
                  ItemImage,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 7, top: 6),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      ItemName,
                      style: Styles.titleSmall.copyWith(fontSize: 15),
                    ),
                    Text(
                      ItemIngredients,
                      style: Styles.hint.copyWith(fontSize: 8),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Row(
                      children: [
                        Text(
                          NewPrice,
                          style: Styles.titleLarge
                              .copyWith(fontSize: 12, color: wajbah_primary),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          OldPrice,
                          style: Styles.hint.copyWith(
                            decoration: TextDecoration.lineThrough,
                            fontSize: 8,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
