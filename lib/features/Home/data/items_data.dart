// ignore_for_file: public_member_api_docs, sort_constructors_first
class ItemData {
  final String itemname;
  String kitchenIcon;
  String itemDiscription;
  String itemPrice;
  String itemImage;
  String kitchenName;
  int itemRating;
  int prepareTime;
  List<double> Prices;

  ItemData(
      {required this.itemname,
      required this.kitchenIcon,
      required this.itemDiscription,
      required this.itemPrice,
      required this.itemImage,
      required this.kitchenName,
      required this.itemRating,
      required this.prepareTime,
      required this.Prices});
}

List<ItemData> ItemsData = [
  ItemData(
      kitchenName: 'Willys Kitchen',
      Prices: [70, 150, 170],
      itemname: 'Willys One',
      kitchenIcon: 'assets/images/onboarding/Wajbah_Finale.png',
      itemDiscription: '200g Burger + Cheese + lettuce + sauce + Onion Rings',
      itemPrice: '120',
      itemImage: 'assets/images/onboarding/Wajbah_Finale.png',
      itemRating: 23,
      prepareTime: 30),
  ItemData(
    kitchenName: 'Burger Arena',
    itemname: 'Smash it Burger',
    kitchenIcon: 'assets/images/onboarding/Wajbah_Finale.png',
    itemDiscription:
        '200g Chicker Burger + Cheese + lettuce + Mozarella Sticks',
    itemPrice: '250',
    itemImage: 'assets/images/onboarding/Wajbah_Finale.png',
    itemRating: 77,
    prepareTime: 50,
    Prices: [80, 150, 170],
  ),
  ItemData(
    kitchenName: 'Pizza Land',
    itemname: 'BBQ Pizza',
    kitchenIcon: 'assets/images/onboarding/Wajbah_Finale.png',
    itemDiscription: '200g Burger + Cheese + lettuce + sauce + Onion Rings',
    itemPrice: '120',
    itemImage: 'assets/images/onboarding/Wajbah_Finale.png',
    prepareTime: 60,
    itemRating: 114,
    Prices: [80, 150, 170],
  ),
  ItemData(
    kitchenName: 'Pizza Palace',
    itemname: 'Supreme Delight Pizza',
    kitchenIcon: 'assets/images/onboarding/Wajbah_Finale.png',
    itemDiscription:
        'A delightful combination of pepperoni, sausage, bell peppers, onions, mushrooms, and olives',
    itemPrice: '300',
    itemImage: 'assets/images/onboarding/Wajbah_Finale.png',
    itemRating: 85,
    prepareTime: 40,
    Prices: [80, 150, 170],
  ),
  ItemData(
    kitchenName: 'Sushi Haven',
    itemname: 'Dragon Roll Combo',
    kitchenIcon: 'assets/images/onboarding/Wajbah_Finale.png',
    itemDiscription:
        'Freshly prepared dragon roll filled with crab, avocado, and cucumber, served with soy sauce and wasabi',
    itemPrice: '280',
    itemImage: 'assets/images/onboarding/Wajbah_Finale.png',
    itemRating: 90,
    prepareTime: 35,
    Prices: [80, 150, 170],
  ),
  ItemData(
    kitchenName: 'Taco Fiesta',
    itemname: 'Ultimate Taco Platter',
    kitchenIcon: 'assets/images/onboarding/Wajbah_Finale.png',
    itemDiscription:
        'An assortment of tacos filled with grilled chicken, beef, shrimp, and a variety of toppings, served with salsa and guacamole',
    itemPrice: '270',
    itemImage: 'assets/images/onboarding/Wajbah_Finale.png',
    itemRating: 80,
    prepareTime: 45,
    Prices: [80, 150, 170],
  ),
  ItemData(
    kitchenName: 'Pasta Paradise',
    itemname: 'Creamy Alfredo Pasta',
    kitchenIcon: 'assets/images/onboarding/Wajbah_Finale.png',
    itemDiscription:
        'Al dente fettuccine pasta tossed in a rich and creamy Alfredo sauce, garnished with Parmesan cheese and parsley',
    itemPrice: '220',
    itemImage: 'assets/images/onboarding/Wajbah_Finale.png',
    itemRating: 88,
    prepareTime: 30,
    Prices: [80, 150, 170],
  )
];
