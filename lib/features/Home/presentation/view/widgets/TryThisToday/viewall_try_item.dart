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
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
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
                    width: width * 0.4,
                    child: Image.network(
                      tryThisItem.photo == "photo" || tryThisItem.photo == null
                          ? "https://cdn-icons-png.flaticon.com/512/5663/5663566.png"
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
          top: height * 0.11,
          right: width * 0.01,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.network(
                  tryThisItem.restaurantPhoto == "photo" || tryThisItem.restaurantPhoto == null
                      ? "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR16U0fq_8AFDqNEc3pUb5a99IvBAGEfA_0Rk3FRPyh_A&s"
                      : tryThisItem.photo!,
                  height: height * 0.050,
                  fit: BoxFit.cover,
                )),
          ),
        ),
        Positioned(
          top: height * 0.118,
          right: width * 0.28,
          child: Container(
              decoration: const BoxDecoration(
                color: wajbah_primary,
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
              padding: EdgeInsets.symmetric(horizontal: width * 0.01),
              height: height * 0.025,
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
