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
      image: 'assets/images/android_12_splash.png', name: 'Abo\nTarek'),
  KitchensNearby(image: 'assets/images/android_12_splash.png', name: 'Al\nAbd'),
  KitchensNearby(
      image: 'assets/images/android_12_splash.png', name: 'Asian\nHouse'),
  KitchensNearby(
      image: 'assets/images/android_12_splash.png', name: 'Hommy\nFoody'),
];
