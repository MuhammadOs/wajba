import 'package:flutter/material.dart';
import 'package:wajba/constants/constants.dart';
import 'package:wajba/features/Cart/presentation/view/widgets/cart_item_card.dart';

import '../../../data/cart_item_class.dart';

class CartItemCard extends StatefulWidget {
  const CartItemCard({
    Key? key,
    required this.cartItem,
    required this.onDelete,
    required this.onPlus,
    required this.onMinus,
  }) : super(key: key);

  final CartItem cartItem;
  final VoidCallback onDelete;
  final VoidCallback onPlus;
  final VoidCallback onMinus;

  @override
  State<CartItemCard> createState() => _CartItemCardState();
}

class _CartItemCardState extends State<CartItemCard> {
  bool _showButtons = false;

  void _toggleButtonsVisibility() {
    setState(() {
      _showButtons = !_showButtons;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 50, // Adjust radius for image size
                      backgroundImage: AssetImage("assets/images/willy.png"),
                    ),
                    SizedBox(width: 15),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Willy’s Kitchen',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '\$${widget.cartItem.price.toString()}',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.grey[800],
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Burger, Chicken, Fried chicken, Wrap',
                            style: TextStyle(fontSize: 16, color: Colors.grey),
                          ),
                          SizedBox(height: 8),
                          Row(
                            children: [
                              GestureDetector(
                                onTap: _toggleButtonsVisibility,
                                child: Icon(
                                  Icons.add_circle,
                                  color: wajbah_primary,
                                ),
                              ),
                              if (_showButtons)
                                Row(
                                  children: [
                                    IconButton(
                                      icon: Icon(Icons.remove),
                                      onPressed: widget.onMinus,
                                    ),
                                    Text(
                                      widget.cartItem.quantity.toString(),
                                      style: TextStyle(fontSize: 18),
                                    ),
                                    IconButton(
                                      icon: Icon(Icons.add),
                                      onPressed: widget.onPlus,
                                    ),
                                  ],
                                ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
              ],
            ),
          ),
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: widget.onDelete,
          ),
        ],
      ),
    );
  }
}
