import 'package:flutter/material.dart';
import 'package:wajba/core/constants/constants.dart';
import 'package:wajba/core/sizeConfig.dart';
import 'package:wajba/core/styles.dart';
import 'package:wajba/features/Home/data/items_data.dart';
import 'package:wajba/features/Home/data/models/meal.dart';

class TryThisTodayViewAllItem extends StatelessWidget {
  final Meal tryThisItem;

  const TryThisTodayViewAllItem({
    super.key,
    required this.tryThisItem,
  });

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double width = SizeConfig.screenW!;
    double height = SizeConfig.screenH!;
    return Stack(
      children: [
        InkWell(
          onTap: () {
            Navigator.of(context).pushNamed('Item View',
                arguments: Meal(
                  menuItemId: tryThisItem.menuItemId,
                  name: tryThisItem.name,
                  estimatedTime: tryThisItem.estimatedTime,
                  orderingTime: tryThisItem.orderingTime,
                  category: tryThisItem.category,
                  occassions: tryThisItem.occassions,
                  sizesPrices: tryThisItem.sizesPrices,
                  healthyMode: tryThisItem.healthyMode,
                  description: tryThisItem.description,
                  photo: tryThisItem.photo,
                  chefId: tryThisItem.chefId,
                ));
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
                    child: Image.network(
                      tryThisItem.photo == "photo" || tryThisItem.photo == null
                          ? "https://www.shutterstock.com/image-vector/cutlery-icon-spoon-forks-knife-600nw-1931212061.jpg"
                          : tryThisItem.photo!,
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
                        tryThisItem.name ?? "Kitchen name",
                        style: Styles.titleSmall.copyWith(fontSize: 15),
                      ),
                      Text(
                        tryThisItem.description ?? "Description",
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
                child: Image.network(
                  tryThisItem.photo == "photo" || tryThisItem.photo == null
                      ? "https://www.shutterstock.com/image-vector/cutlery-icon-spoon-forks-knife-600nw-1931212061.jpg"
                      : tryThisItem.photo!,
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
                    '${tryThisItem.sizesPrices?.priceSmall} EGP',
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
