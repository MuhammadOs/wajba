import 'package:flutter/material.dart';
import 'package:wajba/constants/constants.dart';
import 'package:wajba/core/sizeConfig.dart';
import 'package:wajba/core/styles.dart';
import 'package:wajba/features/Home/data/items_data.dart';

class TryThisTodayViewAllItem extends StatelessWidget {
  final ItemData tryThisItem;
  const TryThisTodayViewAllItem({
    super.key,
    required this.tryThisItem,
  });

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double width = SizeConfig.screenW!;
    double height = SizeConfig.screenH!;
    ItemData item;

    return Stack(
      children: [
        InkWell(
          onTap: () {
            Navigator.of(context).pushNamed('Item View',
                arguments: ItemData(
                    itemname: tryThisItem.itemname,
                    kitchenIcon: tryThisItem.kitchenIcon,
                    itemDiscription: tryThisItem.itemDiscription,
                    itemPrice: tryThisItem.itemPrice,
                    itemImage: tryThisItem.itemImage,
                    kitchenName: tryThisItem.kitchenName,
                    itemRating: tryThisItem.itemRating,
                    prepareTime: tryThisItem.prepareTime,
                    Prices: tryThisItem.Prices));
          },
          child: Container(
            width: width * 0.45,
            height: height * 0.24,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(23)),
                color: Colors.white,
                boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 2)]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(23),
                      topLeft: Radius.circular(23)),
                  child: SizedBox(
                    height: height * 0.14,
                    width: width * 0.45,
                    child: Image.asset(
                      tryThisItem.itemImage,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(left: width * 0.02, top: height * 0.01),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        tryThisItem.kitchenName,
                        style: Styles.titleSmall.copyWith(fontSize: 15),
                      ),
                      Text(
                        tryThisItem.itemDiscription,
                        style: Styles.hint.copyWith(fontSize: 8),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: height * 0.09,
          right: width * 0.025,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: SizedBox(
                width: width * 0.1,
                height: height * 0.07,
                child: Image.asset(
                  tryThisItem.kitchenIcon,
                  fit: BoxFit.cover,
                )),
          ),
        ),
        Positioned(
          top: height * 0.118,
          right: width * 0.252,
          child: Container(
              decoration: const BoxDecoration(
                color: wajbah_primary,
                borderRadius: BorderRadius.all(Radius.circular(23)),
              ),
              width: width * 0.142,
              height: height * 0.03,
              child: Center(
                  child: Text(
                '${tryThisItem.itemPrice} EGP',
                style: Styles.titleMedium
                    .copyWith(fontSize: 10, color: wajbah_white),
              ))),
        ),
        Positioned(
          top: height * 0.146,
          right: width * 0.055,
          child: const Icon(
            Icons.verified_sharp,
            color: wajbah_primary,
            size: 15,
          ),
        ),
      ],
    );
  }
}
