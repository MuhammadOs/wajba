import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:wajba/constants/constants.dart';
import 'package:wajba/features/OnBoarding/data/onboarding_data.dart';
import 'package:wajba/features/OnBoarding/presentations/view/widgets/page_view_body.dart';
import 'onboarding_discription.dart';
import 'onboarding_dots.dart';
import 'onboarding_titles.dart';

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
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.06),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.5,
              child: PageView.builder(
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
                  return PageViewBody(index: index);
                },
              ),
            ),
            OnboardingDots(controller: controller),
            const SizedBox(height: 40,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  child: Text(
                    isLastPage ? 'Register ?' : 'Skip',
                    style: const TextStyle(
                        fontSize: 16,
                        color: wajbah_gray,
                        fontWeight: FontWeight.w700),
                  ),
                  onPressed: () {
                    if (isLastPage) {
                      //navigate to register view
                    } else {
                      controller.jumpToPage(content.length - 1);
                    }
                  },
                ),
                isLastPage
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
                          onPressed: () {
                            controller.nextPage(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeInOut);
                          },
                        ),
                      ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
