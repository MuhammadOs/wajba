import 'package:flutter/material.dart';
import 'package:wajba/core/constants/constants.dart';
import 'package:wajba/core/sizeConfig.dart';
import 'package:wajba/core/styles.dart';
import 'package:wajba/features/Home/data/models/meal.dart';

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
                  chefId: widget.meal.chefId,
                ));
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
                    child: Image.network(
                      widget.meal.photo == "photo" || widget.meal.photo == null
                          ? "https://www.shutterstock.com/image-vector/cutlery-icon-spoon-forks-knife-600nw-1931212061.jpg"
                          : widget.meal.photo!,
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
                          widget.meal.name ?? "Meal name",
                          style: Styles.titleSmall.copyWith(fontSize: 15),
                        ),
                      ),
                      Text(
                        widget.meal.description ?? "Meal description",
                        style: Styles.hint.copyWith(fontSize: 8),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(
                        height: height * 0.005,
                      ),
                      Text(
                        '${widget.meal.sizesPrices?.priceSmall} EGP',
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
              child: Image.network(
                widget.meal.photo == "photo" || widget.meal.photo == null
                    ? "https://www.shutterstock.com/image-vector/cutlery-icon-spoon-forks-knife-600nw-1931212061.jpg"
                    : widget.meal.photo!,
                height: height * 0.065,
                fit: BoxFit.cover,
              )),
        ),
      ],
    );
  }
}
