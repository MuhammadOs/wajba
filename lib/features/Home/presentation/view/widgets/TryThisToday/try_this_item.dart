import 'package:flutter/cupertino.dart';
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
                    height: height * 0.13,
                    width: width * 0.45,
                    child: Image.network(
                      widget.meal.photo == "photo" || widget.meal.photo == null
                          ? "https://cdn-icons-png.flaticon.com/512/5663/5663566.png"
                          : widget.meal.photo!,
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
                          widget.meal.name ?? "Meal name",
                          style: Styles.titleSmall
                              .copyWith(fontSize: 16)
                              .copyWith(
                                  fontFamily: "Biryani",
                                  fontWeight: FontWeight.bold),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                        SizedBox(height: height * 0.005),
                        Text(
                          widget.meal.description ?? "Meal description",
                          style: Styles.titleSmall.copyWith(
                              fontSize: 10,
                              color: wajbah_gray,
                              fontFamily: "Biryani"),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 15, left: 5),
                          child: Text(
                            '${widget.meal.sizesPrices?.priceSmall} EGP',
                            style: Styles.titleMedium.copyWith(
                                fontSize: 12,
                                color: wajbah_primary,
                                fontFamily: ""),
                          ),
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
          top: height * 0.10,
          right: width * 0.02,
          child: ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: CircleAvatar(
                radius: 25,
                child: Image.network(
                  widget.meal.restaurantPhoto == "photo" ||
                          widget.meal.restaurantPhoto == null
                      ? "https://th.bing.com/th/id/OIP.Zq2mJhYoCVbABpiI7C9txwHaHa?rs=1&pid=ImgDetMain"
                      : widget.meal.restaurantPhoto!,
                  height: height * 0.06,
                  fit: BoxFit.cover,
                ),
              )),
        ),
      ],
    );
  }
}
