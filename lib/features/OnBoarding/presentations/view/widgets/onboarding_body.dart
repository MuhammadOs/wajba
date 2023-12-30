import 'package:flutter/material.dart';
import 'package:wajba/constants/constants.dart';
import 'package:wajba/features/OnBoarding/data/onboarding_data.dart';
import 'package:wajba/features/OnBoarding/presentations/view/widgets/page_view_body.dart';
import 'custom_next_button.dart';
import 'onboarding_dots.dart';
import 'onboarding_login_button.dart';
import 'onboarding_register_skip_button.dart';

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
                OnboardingRegisterSkipButton(isLastPage: isLastPage, controller: controller),
                isLastPage
                    ? const OnboardingLoginButton()
                    : CustomNextButton(controller: controller)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
