import 'package:flutter/material.dart';
import 'package:wajba/core/util/sizeConfig.dart';
import 'package:wajba/core/util/styles.dart';
import 'package:wajba/core/util/theme.dart';
import 'package:wajba/features/Home/data/models/shining_kitchens_models/kitchen_model.dart';
import 'package:wajba/features/Home/presentation/view/widgets/ratings.dart';

class ShinningKitchenItem extends StatefulWidget {
  const ShinningKitchenItem({
    super.key,
    required this.kitchen,
  });

  final Kitchen kitchen;

  @override
  State<ShinningKitchenItem> createState() => _ShinningKitchenItemState();
}

class _ShinningKitchenItemState extends State<ShinningKitchenItem> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double width = SizeConfig.screenW!;
    double height = SizeConfig.screenH!;
    double iconSize = SizeConfig.iconSize!;
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed('Item View',
            arguments: Kitchen(
                chefId: widget.kitchen.chefId,
                phoneNumber: widget.kitchen.phoneNumber,
                email: widget.kitchen.email,
                chefFirstName: widget.kitchen.chefFirstName,
                chefLastName: widget.kitchen.chefLastName,
                restaurantName: widget.kitchen.restaurantName,
                birthDate: widget.kitchen.birthDate,
                description: widget.kitchen.description,
                rating: widget.kitchen.rating,
                wallet: widget.kitchen.wallet,
                profilePicture: widget.kitchen.profilePicture,
                address: widget.kitchen.address,
                active: widget.kitchen.active,
                menuItems: widget.kitchen.menuItems,
                promoCodes: widget.kitchen.promoCodes));
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.72,
        height: MediaQuery.of(context).size.height * 0.34,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            color: Colors.white,
            boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 2)]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: height * 0.2,
              width: width * 0.8,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(25),
                    topLeft: Radius.circular(25)),
                child: Image.network(
                  widget.kitchen.profilePicture == "photo" ||
                          widget.kitchen.profilePicture == null
                      ? "https://cdn-icons-png.flaticon.com/512/5663/5663566.png"
                      : widget.kitchen.profilePicture!,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Row(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .1,
                    width: MediaQuery.of(context).size.width * .15,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        widget.kitchen.profilePicture == "photo" ||
                                widget.kitchen.profilePicture == null
                            ? "https://cdn-icons-png.flaticon.com/512/5663/5663566.png"
                            : widget.kitchen.profilePicture!,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              widget.kitchen.restaurantName ??
                                  "Kitchen name",
                              style:
                                  Styles.titleLarge.copyWith(fontSize: 16),
                            ),
                            const SizedBox(
                              width: 7,
                            ),
                            const Icon(
                              Icons.verified,
                              color: wajbah_primary,
                              size: 20,
                            )
                          ],
                        ),
                        SizedBox(
                          height:
                              MediaQuery.of(context).size.height * 0.006,
                        ),
                        Text(
                          widget.kitchen.description ??
                              "Kitchen description",
                          style: Styles.hint.copyWith(fontSize: 12),
                        ),
                        SizedBox(
                          height:
                              MediaQuery.of(context).size.height * 0.006,
                        ),
                        Ratings(
                          rating: widget.kitchen.rating!,
                          size: iconSize,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
