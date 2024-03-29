import 'package:flutter/material.dart';
import 'package:wajba/core/constants/constants.dart';
import 'package:wajba/core/sizeConfig.dart';
import 'package:wajba/core/styles.dart';
import 'package:wajba/features/Home/data/items_data.dart';

class TryThisListItem extends StatelessWidget {
  final ItemData tryThisItem;
  const TryThisListItem({super.key, required this.tryThisItem});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double width = SizeConfig.screenW!;
    double height = SizeConfig.screenH!;
    ItemData item;
    return Stack(
      children: [
        InkWell(
          borderRadius: BorderRadius.circular(23),
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
            width: width * 0.4,
            height: height * 0.27,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(23)),
                color: Colors.white,
                boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 2)]),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(23),
                      topLeft: Radius.circular(23)),
                  child: SizedBox(
                    height: height * 0.14,
                    width: width * 0.4,
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
                      SizedBox(
                        width: width * 0.28,
                        child: Text(
                          overflow: TextOverflow.ellipsis,
                          tryThisItem.itemname,
                          style: Styles.titleSmall.copyWith(fontSize: 15),
                        ),
                      ),
                      Text(
                        tryThisItem.itemDiscription,
                        style: Styles.hint.copyWith(fontSize: 8),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(
                        height: height * 0.005,
                      ),
                      Text(
                        '${tryThisItem.itemPrice} EGP',
                        style: Styles.titleLarge
                            .copyWith(fontSize: 12, color: wajbah_primary),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: height * 0.11,
          right: width * 0.01,
          child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.asset(
                tryThisItem.kitchenIcon,
                height: height * 0.065,
                fit: BoxFit.cover,
              )),
        ),
      ],
    );
  }
}
