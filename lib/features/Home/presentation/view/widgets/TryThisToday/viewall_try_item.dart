import 'package:flutter/material.dart';
import 'package:wajba/core/util/theme.dart';
import 'package:wajba/core/util/sizeConfig.dart';
import 'package:wajba/core/util/styles.dart';
import 'package:wajba/features/Home/data/models/item_model/meal.dart';

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
                    restaurantPhoto: tryThisItem.restaurantPhoto,
                    restaurantName: tryThisItem.restaurantName));
          },
          child: Container(
            width: width * 0.45,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(25)),
                color: Colors.white,
                boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 2)]),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(25),
                      topLeft: Radius.circular(25)),
                  child: SizedBox(
                    height: height * 0.15,
                    width: width * 0.45,
                    child: Image.network(
                      tryThisItem.photo == "photo" || tryThisItem.photo == null
                          ? "https://cdn-icons-png.flaticon.com/512/5663/5663566.png"
                          : tryThisItem.photo!,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: width * 0.02,
                        top: height * 0.01,
                        right: width * 0.02),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          tryThisItem.name ?? "Meal name",
                          style: Styles.titleSmall.copyWith(fontSize: 16),
                        ),
                        Text(
                          tryThisItem.description ?? "Meal description",
                          style: Styles.titleSmall
                              .copyWith(fontSize: 10, color: wajbah_gray),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
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
              child: Image.network(
                tryThisItem.restaurantPhoto == "photo" ||
                        tryThisItem.restaurantPhoto == null
                    ? "https://th.bing.com/th/id/OIP.Zq2mJhYoCVbABpiI7C9txwHaHa?rs=1&pid=ImgDetMain"
                    : tryThisItem.restaurantPhoto!,
                height: height * 0.055,
                fit: BoxFit.cover,
              )),
        ),
        Positioned(
          top: height * 0.135,
          right: width * 0.25,
          child: Container(
              decoration: const BoxDecoration(
                color: wajbah_primary,
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
              padding: EdgeInsets.symmetric(
                  horizontal: width * 0.01, vertical: height * 0.003),
              child: Center(
                  child: Text(
                '${tryThisItem.sizesPrices?.priceSmall} EGP',
                style: Styles.titleMedium
                    .copyWith(fontSize: 10, color: wajbah_white),
              ))),
        ),
      ],
    );
  }
}
