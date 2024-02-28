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
  shortcuts(image: 'assets/images/Shortcuts/Order.png', name: 'Past Orders'),
  shortcuts(
      image: 'assets/images/Shortcuts/Checklist.png', name: 'Customize Order'),
  shortcuts(image: 'assets/images/Shortcuts/Hot Deals.png', name: 'Hot Deals'),
  shortcuts(image: 'assets/images/Shortcuts/Coupon.png', name: 'Coupons Sale'),
  shortcuts(
      image: 'assets/images/Shortcuts/Trending.png', name: 'Popular Orders'),
];
