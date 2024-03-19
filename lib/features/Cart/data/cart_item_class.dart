class CartItem {
  final int id;
  final String name;
  final double price;
  int quantity;

  CartItem(
      {required this.id,
      required this.name,
      required this.price,
      required this.quantity});
}
