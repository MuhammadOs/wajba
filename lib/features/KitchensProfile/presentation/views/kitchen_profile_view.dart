import 'package:flutter/material.dart';
import 'package:wajba/core/sizeConfig.dart';
import 'package:wajba/features/KitchensProfile/presentation/views/widgets/kitchen_profile_app_bar.dart';
import 'package:wajba/features/KitchensProfile/presentation/views/widgets/kitchens_profile_body.dart';

class KitchenProfileView extends StatefulWidget {
  const KitchenProfileView({Key? key}) : super(key: key);

  @override
  State<KitchenProfileView> createState() => _KitchenProfileViewState();
}

class _KitchenProfileViewState extends State<KitchenProfileView> {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              KitchensProfileAppBar(),
              KitchensProfileBody(),
            ],
          ),
        ),
      ),
    );
  }
}
