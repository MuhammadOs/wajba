import 'package:flutter/material.dart';
import 'package:wajba/core/util/constants.dart';
import 'package:wajba/features/Cart/presentation/view/widgets/cart_item_card.dart';
import '../../../../core/util/theme.dart';
import '../../../../core/util/styles.dart';
import '../../data/cart_item_class.dart';
import 'checkout_view.dart';

class CartView extends StatefulWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  double taxRate = 0.1;
  double deliveryFee = 5.0;
  double discount = 0;
  List<CartItem> cartMeals = AppConstants.cartMeals;

  @override
  Widget build(BuildContext context) {
    double subtotal = calculateSubtotal();
    double tax = subtotal * taxRate;
    double totalBeforeDiscount = subtotal + tax + deliveryFee;
    discount = totalBeforeDiscount * 0.01;
    double total = totalBeforeDiscount - discount;

    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text('Order details',
                style: Styles.titleMedium.copyWith(fontSize: 20)),
            backgroundColor: Colors.white,
            elevation: 0,
            floating: true,
          ),
          SliverPadding(
            padding: const EdgeInsets.all(16.0),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return Column(
                    children: [
                      Card(
                        color: wajbah_green_light,
                        child: CartItemCard(
                          cartItem: cartMeals[index],
                          onDelete: () {
                            setState(() {
                              cartMeals.removeAt(index);
                            });
                          },
                          onPlus: () {
                            setState(() {
                              cartMeals[index].quantity++;
                            });
                          },
                          onMinus: () {
                            setState(() {
                              if (cartMeals[index].quantity > 1) {
                                cartMeals[index].quantity--;
                              }
                            });
                          },
                        ),
                      ),
                      const SizedBox(height: 16),
                    ],
                  );
                },
                childCount: cartMeals.length,
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(16.0),
            sliver: SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Payment Details',
                      style: Styles.titleMedium.copyWith(fontSize: 20)),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Subtotal:',
                        style: Styles.titleSmall,
                      ),
                      Text(
                        '\$ ${subtotal.toStringAsFixed(2)}',
                        style: Styles.titleSmall,
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Tax (${(taxRate * 100).toStringAsFixed(1)}%):',
                        style: Styles.titleSmall,
                      ),
                      Text(
                        '\$${tax.toStringAsFixed(2)}',
                        style: Styles.titleSmall,
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Delivery Fee:',
                        style: Styles.titleSmall,
                      ),
                      Text(
                        '\$${deliveryFee.toStringAsFixed(2)}',
                        style: Styles.titleSmall,
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Discount:',
                        style: Styles.titleSmall,
                      ),
                      Text(
                        '\$${discount.toStringAsFixed(2)}',
                        style: Styles.titleSmall,
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Divider(
                    color: wajbah_gray_light,
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Total:',
                        style: Styles.titleSmall,
                      ),
                      Text(
                        '\$${total.toStringAsFixed(2)}',
                        style: Styles.titleSmall,
                      ),
                    ],
                  ),
                  const SizedBox(height: 60),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: wajbah_primary,
        onPressed: () {
          _navigateToCheckoutScreen(context);
        },
        label: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              calculateTotalItems().toString(),
              style: Styles.titleSmall.copyWith(color: wajbah_white),
            ),
            const SizedBox(
              width: 60,
            ),
            Text(
              "Checkout",
              style:
                  Styles.titleSmall.copyWith(color: wajbah_white, fontSize: 18),
            ),
            const SizedBox(
              width: 60,
            ),
            Text(
              total.roundToDouble().toString(),
              style: Styles.titleSmall.copyWith(color: wajbah_white),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  double calculateSubtotal() {
    double subtotal = 0;
    for (var item in cartMeals) {
      subtotal += (item.price * item.quantity);
    }
    return subtotal;
  }

  int calculateTotalItems() {
    int totalItems = 0;
    for (var item in cartMeals) {
      totalItems += item.quantity;
    }
    return totalItems;
  }

  void _navigateToCheckoutScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => CheckoutScreen(
                cartItems: cartMeals,
                totalItems: calculateTotalItems(),
                taxRate: taxRate,
                deliveryFee: deliveryFee,
                discount: discount,
              )),
    );
  }
}
