import 'package:flutter/material.dart';
import 'package:wajba/constants/constants.dart';
import 'package:wajba/features/Cart/presentation/view/widgets/cart_item_card.dart';

import '../../../../core/styles.dart';
import '../../data/cart_item_class.dart';

class CartView extends StatefulWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  final List<CartItem> _cartItems = [
    CartItem(id: 1, name: 'Pizza', price: 10.99, quantity: 1),
    CartItem(id: 2, name: 'Burger', price: 8.99, quantity: 3),
    CartItem(id: 1, name: 'Pizza', price: 10.00, quantity: 1),
  ];

  double taxRate = 0.1;
  double deliveryFee = 5.0;
  double discount = 2.0;

  bool showPlusMinusButtons = false;

  @override
  Widget build(BuildContext context) {
    double subtotal = calculateSubtotal();
    double tax = subtotal * taxRate;
    double total = subtotal + tax + deliveryFee - discount;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Order Details',
                      style: Styles.titleMedium.copyWith(fontSize: 20)),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: _cartItems.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                showPlusMinusButtons = !showPlusMinusButtons;
                              });
                            },
                            child: Row(
                              children: [
                                Expanded(
                                  child: CartItemCard(
                                    cartItem: _cartItems[index],
                                    onDelete: () {
                                      setState(() {
                                        _cartItems.removeAt(index);
                                      });
                                    },
                                    onPlus: () {
                                      setState(() {
                                        _cartItems[index].quantity++;
                                      });
                                    },
                                    onMinus: () {
                                      setState(() {
                                        if (_cartItems[index].quantity > 1) {
                                          _cartItems[index].quantity--;
                                        }
                                      });
                                    },
                                    //showPlusMinusButtons: showPlusMinusButtons,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                  /*const SizedBox(height: 10),
                  for (var item in _cartItems)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Item: ${item.name}', style: Styles.titleSmall),
                        Text('Price: \$${item.price.toString()}',
                            style: Styles.titleSmall),
                        Text('Quantity: ${item.quantity}',
                            style: Styles.titleSmall),
                        const Divider(),
                      ],
                    ),*/
                ],
              ),
            ),
            const Divider(
              thickness: 15,
              color: wajbah_gray_light,
            ),
            Padding(
              padding: const EdgeInsets.all(32.0),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Delivery Fee:',
                        style: Styles.titleSmall,
                      ),
                      Text(
                        '\$${deliveryFee.toStringAsFixed(2)}',
                        style: Styles.titleSmall,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Discount:',
                        style: Styles.titleSmall,
                      ),
                      Text(
                        '\$${discount.toStringAsFixed(2)}',
                        style: Styles.titleSmall,
                      ),
                    ],
                  ),
                  const Divider(
                    color: wajbah_gray_light,
                  ),
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
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: wajbah_primary,
        onPressed: () {
          setState(() {
            showPlusMinusButtons = !showPlusMinusButtons;
          });
        },
        label: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
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
              total.toString(),
              style: Styles.titleSmall.copyWith(color: wajbah_white),
            ),
          ],
        ),
        icon: const Icon(
          Icons.one_x_mobiledata,
          color: wajbah_white,
          size: 28,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  double calculateSubtotal() {
    double subtotal = 0;
    for (var item in _cartItems) {
      subtotal += (item.price * item.quantity);
    }
    return subtotal;
  }
}
