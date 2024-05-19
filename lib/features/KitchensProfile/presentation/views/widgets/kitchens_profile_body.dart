import 'package:flutter/material.dart';
import 'package:wajba/core/util/theme.dart';
import 'package:wajba/core/util/sizeConfig.dart';
import 'package:wajba/features/KitchensProfile/presentation/views/widgets/kitchen_tab_layout.dart';
import 'kitchen_profile_info_card.dart';
import 'offers_list_view.dart';

class KitchensProfileBody extends StatefulWidget {
  const KitchensProfileBody({Key? key}) : super(key: key);

  @override
  _KitchensProfileBodyState createState() => _KitchensProfileBodyState();
}

class _KitchensProfileBodyState extends State<KitchensProfileBody>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final double screenWidth = SizeConfig.screenW!;
    final double screenHeight = SizeConfig.screenH!;

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
            left: screenWidth * 0.04,
            bottom: screenWidth * 0.04,
          ),
          child: Column(
            children: [
              SizedBox(height: screenHeight * 0.02),
              const KitchenProfileInfoCard(),
              SizedBox(height: screenHeight * 0.02),
              const OfferListView(),
            ],
          ),
        ),
        const Divider(
          color: wajbah_gray_light,
          thickness: 5,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
          child: const KitchenTabLayout(),
        ),
      ],
    );
  }
}
