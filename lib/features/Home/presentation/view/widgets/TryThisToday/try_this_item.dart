import 'package:flutter/material.dart';
import 'package:wajba/core/util/theme.dart';
import 'package:wajba/core/util/sizeConfig.dart';
import 'package:wajba/core/util/styles.dart';
import 'package:wajba/features/Home/data/models/item_model/meal.dart';

class TryThisListItem extends StatefulWidget {
  final Meal meal;

  const TryThisListItem({super.key, required this.meal});

  @override
  State<TryThisListItem> createState() => _TryThisListItemState();
}

class _TryThisListItemState extends State<TryThisListItem> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double width = SizeConfig.screenW!;
    double height = SizeConfig.screenH!;
    return Stack(
      children: [
        InkWell(
          borderRadius: BorderRadius.circular(23),
          onTap: () {
            Navigator.of(context).pushNamed('Item View',
                arguments: Meal(
                    menuItemId: widget.meal.menuItemId,
                    name: widget.meal.name,
                    estimatedTime: widget.meal.estimatedTime,
                    orderingTime: widget.meal.orderingTime,
                    category: widget.meal.category,
                    occassions: widget.meal.occassions,
                    sizesPrices: widget.meal.sizesPrices,
                    healthyMode: widget.meal.healthyMode,
                    description: widget.meal.description,
                    photo: widget.meal.photo,
                    restaurantPhoto: widget.meal.restaurantPhoto,
                    restaurantName: widget.meal.restaurantName));
          },
          child: Container(
            width: width * 0.45,
            height: height * 0.25,
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
                    child: Image.network(
                      widget.meal.photo == "photo" || widget.meal.photo == null
                          ? "https://cdn-icons-png.flaticon.com/512/5663/5663566.png"
                          : widget.meal.photo!,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(left: width * 0.02, top: height * 0.015),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        child: Text(
                          overflow: TextOverflow.ellipsis,
                          widget.meal.name ?? "Meal name",
                          style: Styles.titleSmall.copyWith(fontSize: 15),
                        ),
                      ),
                      Text(
                        widget.meal.description ?? "Meal description",
                        style: Styles.hint.copyWith(fontSize: 10),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(
                        height: height * 0.008,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        child: Text(
                          '${widget.meal.sizesPrices?.priceSmall} EGP',
                          style: Styles.titleLarge
                              .copyWith(fontSize: 12, color: wajbah_primary),
                        ),
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
              child: Image.network(
                widget.meal.restaurantPhoto == "photo" || widget.meal.restaurantPhoto == null
                    ? "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR16U0fq_8AFDqNEc3pUb5a99IvBAGEfA_0Rk3FRPyh_A&s"
                    : widget.meal.photo!,
                height: height * 0.050,
                fit: BoxFit.cover,
              )),
        ),
      ],
    );
  }
}
