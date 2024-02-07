import 'package:flutter/material.dart';
import 'package:wajba/features/Home/presentation/view/widgets/HomeScreen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: HomeScreenView(),
    );
  }
}
