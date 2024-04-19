import 'package:flutter/material.dart';
import 'package:wajba/features/KitchensProfile/presentation/views/widgets/kitchen_profile_app_bar.dart';
import 'package:wajba/features/KitchensProfile/presentation/views/widgets/kitchens_profile_body.dart';

import '../../../../core/widgets/custom_appbar.dart';

class KitchenProfileView extends StatefulWidget {
  const KitchenProfileView({Key? key}) : super(key: key);

  @override
  State<KitchenProfileView> createState() => _KitchenProfileViewState();
}

class _KitchenProfileViewState extends State<KitchenProfileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 40,),
            CustomAppBar(title: "willys kitchen profile"),
            const KitchensProfileBody(),
          ],
        ),
      ),
    );
  }
}
