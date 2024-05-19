import 'package:flutter/material.dart';

class CartItem {
  final int id;
  final String name;
  final double price;
  final String kitchenName;
  final String description;
  final String image;
  int quantity;

  CartItem({
    required this.id,
    required this.name,
    required this.price,
    required this.quantity,
    required this.kitchenName,
    required this.description,
    required this.image,
  });
}
