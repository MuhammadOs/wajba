import 'package:flutter/material.dart';
import 'package:wajba/core/util/styles.dart';
import '../../../../../core/util/theme.dart';
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
    String truncatedKitchenName = widget.cartItem.kitchenName.length > 15
        ? '${widget.cartItem.kitchenName.substring(0, 10)}...'
        : widget.cartItem.kitchenName;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        SizedBox(width: 10),
                        CircleAvatar(
                          radius: 50,
                          backgroundImage: NetworkImage(widget.cartItem.image),
                        ),
                        SizedBox(height: 10,),
                        Text(
                          truncatedKitchenName,
                          style: Styles.titleMedium.copyWith(fontSize: 14),
                        ),
                      ],
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            widget.cartItem.name,
                            style: Styles.titleMedium.copyWith(fontSize: 20),
                          ),
                          Text(
                            '\$${widget.cartItem.price.toString()}',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.grey[800],
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            widget.cartItem.description,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              InkWell(
                                onTap: _toggleButtonsVisibility,
                                child: const Icon(
                                  Icons.add_circle,
                                  color: wajbah_primary,
                                ),
                              ),
                              if (_showButtons)
                                Row(
                                  children: [
                                    IconButton(
                                      icon: const Icon(Icons.remove),
                                      onPressed: widget.onMinus,
                                    ),
                                    Text(
                                      widget.cartItem.quantity.toString(),
                                      style: const TextStyle(fontSize: 18),
                                    ),
                                    IconButton(
                                      icon: const Icon(Icons.add),
                                      onPressed: widget.onPlus,
                                    ),
                                  ],
                                ),
                            ],
                          ),],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          TextButton(
            onPressed: widget.onDelete,
            style: TextButton.styleFrom(
              foregroundColor: Colors.grey[800], minimumSize: Size.zero,
              padding: EdgeInsets.zero,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            child: const Icon(Icons.delete),
          ),
        ],
      ),
    );
  }
}
