import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wajba/core/util/constants.dart';
import 'package:wajba/core/util/theme.dart';
import 'package:wajba/core/util/sizeConfig.dart';
import 'package:wajba/core/util/styles.dart';
import 'package:wajba/features/Cart/data/cart_item_class.dart';
import 'package:wajba/features/Home/data/models/item_model/meal.dart';
import 'package:wajba/features/Home/data/models/item_model/size_prices.dart';
import 'package:wajba/features/Home/presentation/view/widgets/custom_rating_stars.dart';

import 'custom_appbar.dart';

class ItemViewScreen extends StatefulWidget {
  ItemViewScreen({Key? key}) : super(key: key);

  @override
  State<ItemViewScreen> createState() => _ItemViewScreenState();
}

class _ItemViewScreenState extends State<ItemViewScreen> {
  List<String> Sizes = ['Small', 'Medium', 'Large'];
  SizesPrices prices = SizesPrices();
  String currentsize = '';
  double totalprice = 0;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    var args = ModalRoute.of(context)!.settings.arguments as Meal;
    totalprice = args.sizesPrices!.priceSmall ?? 0;
    currentsize = Sizes[0];
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double width = SizeConfig.screenW!;
    double height = SizeConfig.screenH!;
    var args = ModalRoute.of(context)!.settings.arguments as Meal;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomAppBar(title: args.restaurantName ?? "Kitchen name"),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.048),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(23)),
                      width: width * 0.9,
                      height: height * 0.35,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(23),
                        child: Image.asset(
                          args.photo == "photo" || args.photo == null
                              ? "assets/images/Wajbah_Finale.png"
                              : args.photo!,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    Text(
                      args.name ?? "Item name",
                      style: Styles.titleMedium.copyWith(fontSize: 24),
                    ),
                    SizedBox(height: height * 0.005),
                    Row(
                      children: [
                        const FaIcon(
                          FontAwesomeIcons.solidCheckCircle,
                          size: 15,
                          color: wajbah_primary,
                        ),
                        SizedBox(
                          width: width * 0.009,
                        ),
                        Text(
                          args.restaurantName ?? "Kitchen name",
                          style: Styles.titleMedium
                              .copyWith(color: wajbah_primary, fontSize: 10),
                        ),
                        SizedBox(
                          width: width * 0.03,
                        ),
                        const FaIcon(
                          FontAwesomeIcons.solidClock,
                          size: 15,
                          color: wajbah_green,
                        ),
                        SizedBox(
                          width: width * 0.009,
                        ),
                        Text(
                          '${args.orderingTime} min',
                          style: Styles.titleMedium
                              .copyWith(color: wajbah_green, fontSize: 10),
                        ),
                        SizedBox(
                          width: width * 0.03,
                        ),
                        CustomRatingStars(
                          width: width,
                          rating: 4,
                        ),
                      ],
                    ),
                    SizedBox(height: height * 0.013),
                    Text(
                      'Description',
                      style: Styles.titleMedium.copyWith(fontSize: 15),
                    ),
                    Text(
                      args.description ?? "Item description",
                      style: Styles.titleSmall
                          .copyWith(fontSize: 15, color: wajbah_gray),
                    ),
                    SizedBox(height: height * 0.013),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Select Size',
                          style: Styles.titleLarge.copyWith(fontSize: 20),
                        ),
                        Container(
                          width: width * 0.17,
                          height: height * 0.03,
                          decoration: BoxDecoration(
                              color: wajbah_primary,
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                            child: Text(
                              'Required',
                              style: Styles.titleLarge
                                  .copyWith(fontSize: 12, color: wajbah_white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: height * 0.006),
                child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: Sizes.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: width * 0.052, vertical: height * 0.004),
                      child: Column(
                        children: [
                          SizedBox(
                            height: height * 0.032,
                            child: Center(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Radio(
                                    activeColor: wajbah_primary,
                                    value: Sizes[index],
                                    groupValue: currentsize,
                                    onChanged: (value) {
                                      prices = args.sizesPrices!;
                                      setState(() {
                                        currentsize = value.toString();
                                        if (index == 0) {
                                          totalprice =
                                              args.sizesPrices!.priceSmall ?? 0;
                                        } else if (index == 1) {
                                          totalprice =
                                              args.sizesPrices!.priceMedium ??
                                                  0;
                                        } else {
                                          totalprice =
                                              args.sizesPrices!.priceLarge ?? 0;
                                        }
                                      });
                                    },
                                  ),
                                  Expanded(
                                    child: Center(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            Sizes[index],
                                            style: Styles.titleLarge.copyWith(
                                                fontSize: 15,
                                                color: wajbah_gray),
                                          ),
                                          Text(
                                            '${Sizes[index] == "Small" ? args.sizesPrices!.priceSmall : Sizes[index] == "Medium" ? args.sizesPrices!.priceMedium : args.sizesPrices!.priceLarge} EGP',
                                            style: Styles.titleLarge.copyWith(
                                                fontSize: 15,
                                                color: wajbah_gray),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          if (index != Sizes.length - 1)
                            const Divider(
                              color: wajbah_primary,
                            ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Container(
          height: height * 0.07,
          decoration: const BoxDecoration(
            color: wajbah_white,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total : $totalprice EGP',
                  style: Styles.titleMedium.copyWith(fontSize: 20),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: wajbah_buttons,
                      borderRadius: BorderRadius.circular(10)),
                  height: height * 0.055,
                  width: width * 0.4,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const FaIcon(
                        FontAwesomeIcons.cartShopping,
                        size: 20,
                        color: wajbah_black,
                      ),
                      SizedBox(
                        width: width * 0.001,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Center(
                                  child: Text(
                                    'Item added to basket',
                                    style: Styles.titleMedium.copyWith(
                                        color: wajbah_primary, fontSize: 18),
                                  ),
                                ),
                                content: const Icon(
                                  Icons.done_outline,
                                  color: wajbah_green,
                                ),
                              );
                            },
                          );
                          AppConstants.cartMeals.add(CartItem(
                            id: args.menuItemId!,
                            name: args.name!,
                            price: totalprice,
                            quantity: 1,
                            kitchenName: args.restaurantName!,
                            description: args.description!,
                            image: args.photo!,
                          ));
                        },
                        child: Text(
                          'Add to basket',
                          style: Styles.titleSmall.copyWith(fontSize: 16),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
