class OnBoardingData {
  String image;
  String firstText;
  String secondText;
  String description;

  OnBoardingData(
      {required this.image,
      required this.firstText,
      required this.secondText,
      required this.description});
}

List<OnBoardingData> content = [
  OnBoardingData(
      image: 'assets/images/onboarding/Onboarding_1.png',
      firstText: 'Delicious',
      secondText: 'Homemade Food',
      description:
          'Savoring the extraordinary flavors of homemade dishes crafted with love and expertise.'),
  OnBoardingData(
      image: 'assets/images/onboarding/Onboarding_2.png',
      firstText: 'Stay',
      secondText: 'Updated',
      description:
          'Track your orders in real-time, receive timely updates,meals like never before.'),
  OnBoardingData(
      image: 'assets/images/onboarding/Onboarding_3.png',
      firstText: 'Lighting-Fast',
      secondText: 'Delivery',
      description:
          'Delivering your order quickly to your doorstep, ensuring you satisfy your cravings in no time.'),
  OnBoardingData(
      image: 'assets/images/onboarding/Onboarding_4.png',
      firstText: 'Customize',
      secondText: 'Your Wajbah',
      description:
          'Personalize your orders by selecting ingredients and dietary preferences'),
];
