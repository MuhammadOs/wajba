import 'package:flutter/material.dart';
import 'package:wajba/core/util/theme.dart';
import 'package:wajba/core/util/sizeConfig.dart';
import 'package:wajba/features/Search/presenatation/view/widgets/Featured_Kitchens/featured_kitchens_listview.dart';
import 'package:wajba/features/Search/presenatation/view/widgets/search_chips.dart';
import 'package:wajba/features/Search/presenatation/view/widgets/search_custom_text.dart';
import 'package:wajba/features/Search/presenatation/view/widgets/search_text_field.dart';

import '../../../data/search_labels.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double width = SizeConfig.screenW!;
    double height = SizeConfig.screenH!;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: height * 0.04),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SearchTextField(),
              SizedBox(height: height * 0.02),
              const SearchCustomText(title: 'Recent searches'),
              SizedBox(height: height * 0.01),
              SearchChips(
                chipLabels: recentSearchLabels,
                icon: Icons.history,
              ),
              SizedBox(height: height * 0.01),
              const SearchCustomText(title: 'Popular Searches'),
              SizedBox(height: height * 0.02),
              SearchChips(
                chipLabels: popularSearchLabels,
                icon: Icons.trending_up,
              ),
              SizedBox(height: height * 0.02),
              const SearchCustomText(title: 'Featured Kitchens'),
              SizedBox(height: height * 0.005),
              const FeaturedKitchensListView()
            ],
          ),
        ],
      ),
    );
  }
}
