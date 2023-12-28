import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:wajba/constants/constants.dart';
import 'package:wajba/features/OnBoarding/data/onboarding_data.dart';

class OnBoardingBody extends StatefulWidget {
  const OnBoardingBody({Key? key}) : super(key: key);

  @override
  State<OnBoardingBody> createState() => _OnBoardingBodyState();
}

class _OnBoardingBodyState extends State<OnBoardingBody> {
  final controller = PageController();
  bool isLastPage = false;
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Stack(
              children: [
                PageView.builder(
                  onPageChanged: (index) {
                    setState(() {
                      // Check if the current page is the last page
                      index == content.length - 1
                          ? isLastPage = true
                          : isLastPage = false;
                    });
                  },
                  controller: controller,
                  itemCount: content.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            content[index].image,
                            width: 300,
                            height: 300,
                          ),
                          const SizedBox(height: 20), // Adjust the spacing here
                          Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: content[index].firstText,
                                  style: const TextStyle(
                                      color: wajbah_black,
                                      fontSize: 32,
                                      fontWeight: FontWeight.w800),
                                ),
                                TextSpan(
                                  text: '\n${content[index].secondText}',
                                  style: const TextStyle(
                                      color: wajbah_primary,
                                      fontSize: 32,
                                      fontWeight: FontWeight.w800),
                                ),
                              ],
                            ),
                          ),

                          Text(
                            content[index].description,
                            style: const TextStyle(
                                color: wajbah_gray,
                                fontSize: 14,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    );
                  },
                ),
                Positioned(
                  bottom: 120,
                  left: 25,
                  child: Center(
                    child: SmoothPageIndicator(
                      controller: controller,
                      count: content.length,
                      effect: ExpandingDotsEffect(
                        dotHeight: 9,
                        dotWidth: 9,
                        activeDotColor: wajbah_primary,
                        dotColor: wajbah_primary.withOpacity(.5),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 35,
                  left: 10,
                  child: TextButton(
                    child: Text(
                      isLastPage ? 'Register ?' : 'Skip',
                      style: const TextStyle(
                          fontSize: 16,
                          color: wajbah_gray,
                          fontWeight: FontWeight.w700),
                    ),
                    onPressed: () {
                      controller.jumpToPage(content.length - 1);
                    },
                  ),
                ),
                Positioned(
                  bottom: 35,
                  right: 20,
                  child: isLastPage
                      ? Container(
                          decoration: BoxDecoration(
                              color: wajbah_primary,
                              borderRadius: BorderRadius.circular(15)),
                          width: MediaQuery.of(context).size.width * .3,
                          height: MediaQuery.of(context).size.height * 0.06,
                          child: TextButton(
                            child: const Padding(
                              padding: EdgeInsets.only(left: 13),
                              child: Row(
                                children: [
                                  Text(
                                    'Login',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 15),
                                  ),
                                  SizedBox(
                                    width: 7,
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    color: Colors.white,
                                  )
                                ],
                              ),
                            ),
                            onPressed: () {},
                          ),
                        )
                      : Container(
                          decoration: BoxDecoration(
                              color: wajbah_buttons,
                              borderRadius: BorderRadius.circular(10)),
                          width: 40,
                          height: 40,
                          child: IconButton(
                            icon: const Icon(Icons.arrow_forward_ios),
                            onPressed: () {},
                          ),
                        ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
