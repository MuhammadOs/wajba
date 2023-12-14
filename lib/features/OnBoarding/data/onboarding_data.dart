class OnBoardindData {
  String image;
  String firstText;
  String secondText;
  String description;

  OnBoardindData(
      {required this.image,
      required this.firstText,
      required this.secondText,
      required this.description});
}

List<OnBoardindData> content = [
  OnBoardindData(
      image: 'assets/images/Onboarding_1.svg',
      firstText: 'Delicious',
      secondText: 'Homemade Food',
      description:
          'Savoring the extraordinary flavors of homemade dishes crafted with love and expertise.'),
  OnBoardindData(
      image: 'assets/images/Onboarding_2.svg',
      firstText: 'Stay',
      secondText: 'Updated',
      description:
          'Track your orders in real-time, receive timely updates,meals like never before.'),
  OnBoardindData(
      image: 'assets/images/Onboarding_3.svg',
      firstText: 'Lighting-Fast',
      secondText: 'Delivery',
      description:
          'Delivering your order quickly to your doorstep, ensuring you satisfy your cravings in no time.'),
  OnBoardindData(
      image: 'assets/images/Onboarding_4.svg',
      firstText: 'Customize',
      secondText: 'Your Wajbah',
      description:
          'Personalize your orders by selecting ingredients and dietary preferences'),
];
