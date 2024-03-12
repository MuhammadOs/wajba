import 'package:flutter/material.dart';
import 'package:wajba/constants/constants.dart';
import 'package:wajba/features/Search/presenatation/view/widgets/Featured_Kitchens/featured_kitchens_listview.dart';
import 'package:wajba/features/Search/presenatation/view/widgets/search_chips.dart';
import 'package:wajba/features/Search/presenatation/view/widgets/search_custom_text.dart';
import 'package:wajba/features/Search/presenatation/view/widgets/search_text_field.dart';

import '../../../data/search_labels.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SearchTextField(),
              const SizedBox(height: 20),
              const SearchCustomText(title: 'Recent searches'),
              const SizedBox(height: 10),
              SearchChips(
                chipLabels: recentSearchLabels,
                icon: Icons.history,
              ),
              const SizedBox(height: 20),
              const SearchCustomText(title: 'Popular Searches'),
              const SizedBox(height: 10),
              SearchChips(
                chipLabels: popularSearchLabels,
                icon: Icons.trending_up,
              ),
              const SizedBox(height: 20),
              const SearchCustomText(title: 'Featured Kitchens'),
              const FeaturedKitchensListView()
            ],
          ),
        ],
      ),
    );
  }
}
