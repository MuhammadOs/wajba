import 'package:flutter/material.dart';
import 'package:wajba/features/Search/presenatation/view/widgets/search_view_body.dart';
import '../../../../core/constants/constants.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        backgroundColor: wajbah_white,
        body: SearchViewBody(),
      ),
    );
  }
}
