/*import 'package:flutter/material.dart';
import 'package:wajba/constants/constants.dart';

import '../../../../../core/styles.dart';
import '../../../data/cart_item_class.dart';
import 'cart_item_card.dart';

class CartViewBody extends StatefulWidget {
  @override
  _CartViewBodyState createState() => _CartViewBodyState();
}

class _CartViewBodyState extends State<CartViewBody> {
  final List<CartItem> _cartItems = [
    CartItem(id: 1, name: 'Pizza', price: 10.99, quantity: 1),
    CartItem(id: 2, name: 'Burger', price: 8.99, quantity: 3),
    CartItem(id: 3, name: 'Fried Chicken', price: 19.99, quantity: 2),
  ];

  double taxRate = 0.1;
  double deliveryFee = 5.0;
  double discount = 2.0;

  @override
  Widget build(BuildContext context) {
    double subtotal = calculateSubtotal();
    double tax = subtotal * taxRate;
    double total = subtotal + tax + deliveryFee - discount;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: _cartItems.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  CartItemCard(
                    cartItems: _cartItems,
                    index: index,
                    onDelete: () {
                      setState(() {
                        _cartItems.removeAt(index);
                      });
                    },
                    onMinus: () {
                      setState(() {
                        if (_cartItems[index].quantity > 1) {
                          _cartItems[index].quantity--;
                        }
                      });
                    },
                    onPlus: () {
                      setState(() {
                        _cartItems[index].quantity++;
                      });
                    },
                  ),
                ],
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Card(
            elevation: 2,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Order Details',
                      style: Styles.titleMedium.copyWith(fontSize: 20)),
                  const SizedBox(height: 10),
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
                    ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Payment Details',
                      style: Styles.titleMedium.copyWith(fontSize: 20)),
                  const SizedBox(height: 10),
                  Text('Subtotal: \$${subtotal.toStringAsFixed(2)}',
                      style: Styles.titleSmall),
                  Text(
                      'Tax (${(taxRate * 100).toStringAsFixed(1)}%): \$${tax.toStringAsFixed(2)}',
                      style: Styles.titleSmall),
                  Text('Delivery Fee: \$${deliveryFee.toStringAsFixed(2)}',
                      style: Styles.titleSmall),
                  Text('Discount: \$${discount.toStringAsFixed(2)}',
                      style: Styles.titleSmall),
                  const Divider(),
                  Text('Total: \$${total.toStringAsFixed(2)}',
                      style: Styles.titleSmall),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  double calculateSubtotal() {
    double subtotal = 0;
    for (var item in _cartItems) {
      subtotal += (item.price * item.quantity);
    }
    return subtotal;
  }
}*/