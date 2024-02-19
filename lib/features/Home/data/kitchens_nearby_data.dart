// ignore_for_file: public_member_api_docs, sort_constructors_first
class KitchensNearby {
  String image;
  String name;
  KitchensNearby({
    required this.image,
    required this.name,
  });
}

List<KitchensNearby> kitchensnearbydata = [
  KitchensNearby(
      image: 'assets/images/android_12_splash.png', name: 'Willys\nKitchen'),
  KitchensNearby(
      image: 'assets/images/android_12_splash.png', name: 'Customize\nOrder'),
  KitchensNearby(
      image: 'assets/images/android_12_splash.png', name: 'Hot\nDeals'),
  KitchensNearby(
      image: 'assets/images/android_12_splash.png', name: 'Coupons\nSale'),
  KitchensNearby(
      image: 'assets/images/android_12_splash.png', name: 'Popular\nOrders'),
];
