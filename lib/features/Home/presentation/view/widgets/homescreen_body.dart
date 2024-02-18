import 'package:flutter/material.dart';
import 'package:wajba/features/Home/presentation/view/widgets/Categories/category_listview.dart';
import 'package:wajba/features/Home/presentation/view/widgets/Kitchens_nearby/kitchens_nearby_listview.dart';
import 'package:wajba/features/Home/presentation/view/widgets/Shinning_Kitchens/shinning_kitchens_listview.dart';
import 'package:wajba/features/Home/presentation/view/widgets/Shortcuts/shortcuts_listview.dart';
import 'package:wajba/features/Home/presentation/view/widgets/Sponsor_First/sponsor_list_view.dart';
import 'package:wajba/features/Home/presentation/view/widgets/Sponsor_Second/sponsor_list_view.dart';
import 'package:wajba/features/Home/presentation/view/widgets/TryThisToday/trythis_listview.dart';
import 'package:wajba/features/Home/presentation/view/widgets/homescreen_titles.dart';

class HomeScreenViewBody extends StatelessWidget {
  const HomeScreenViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SponsorListView(),
        HomeScreenMainTitles(text: 'Categories'),
        const CategoriesListView(),
        HomeScreenMainTitles(text: 'Try this today'),
        const TryThisListView(),
        HomeScreenMainTitles(text: 'Shinning Kitchens'),
        const SizedBox(
          height: 5,
        ),
        ShinningKitchensListView(),
        SecondSponsorListView(),
        HomeScreenMainTitles(text: 'ShortCuts'),
        const ShortcutsListView(),
        HomeScreenMainTitles(text: 'Kitchens Nearby'),
        const KitchensNearbyListview(),
      ],
    );
  }
}
