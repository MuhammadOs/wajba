// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:wajba/features/Home/presentation/view/widgets/custom_app_bar.dart';
import 'package:wajba/features/Home/presentation/view/widgets/homescreen_body.dart';

class HomeScreenView extends StatelessWidget {
  const HomeScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          CustomAppBar(),
          HomeScreenViewBody(),
        ],
      ),
    );
  }
}
