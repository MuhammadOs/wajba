// ignore_for_file: public_member_api_docs, sort_constructors_first
class shortcuts {
  String image;
  String name;
  shortcuts({
    required this.image,
    required this.name,
  });
}

List<shortcuts> shortcutsdata = [
  shortcuts(image: 'assets/images/Shortcuts/Order.png', name: 'Past\nOrders'),
  shortcuts(
      image: 'assets/images/Shortcuts/Checklist.png', name: 'Customize\nOrder'),
  shortcuts(image: 'assets/images/Shortcuts/Hot Deals.png', name: 'Hot\nDeals'),
  shortcuts(image: 'assets/images/Shortcuts/Coupon.png', name: 'Coupons\nSale'),
  shortcuts(
      image: 'assets/images/Shortcuts/Trending.png', name: 'Popular\nOrders'),
];
