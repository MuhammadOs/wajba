import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wajba/core/networking/dio_factory.dart';
import 'package:wajba/core/widgets/cutom_error_widget.dart';
import 'package:wajba/features/Authentication/presentations/view_model/auth_cubit.dart';
import 'package:wajba/features/Home/data/repo/home_repo_imp.dart';
import 'package:wajba/features/Home/presentation/view/widgets/Categories/category_listview.dart';
import 'package:wajba/features/Home/presentation/view/widgets/Categories/viewall_categories_listview.dart';
import 'package:wajba/features/Home/presentation/view/widgets/Kitchens_nearby/kitchens_nearby_listview.dart';
import 'package:wajba/features/Home/presentation/view/widgets/Shinning_Kitchens/shinning_kitchens_listview.dart';
import 'package:wajba/features/Home/presentation/view/widgets/Shinning_Kitchens/shinning_viewall.dart';
import 'package:wajba/features/Home/presentation/view/widgets/Shortcuts/shortcuts_listview.dart';
import 'package:wajba/features/Home/presentation/view/widgets/Sponsor_First/sponsor_list_view.dart';
import 'package:wajba/features/Home/presentation/view/widgets/Sponsor_Second/sponsor_list_view.dart';
import 'package:wajba/features/Home/presentation/view/widgets/TryThisToday/trythis_listview.dart';
import 'package:wajba/features/Home/presentation/view/widgets/TryThisToday/viewall_try_listview.dart';
import 'package:wajba/features/Home/presentation/view/widgets/homescreen_titles.dart';
import 'package:wajba/features/Home/presentation/view_model/TryThisToday%20Cubit/try_this_today_cubit.dart';
import 'package:wajba/features/Home/presentation/view_model/TryThisToday%20Cubit/try_this_today_state.dart';

class HomeScreenViewBody extends StatefulWidget {
  const HomeScreenViewBody({super.key});

  @override
  State<HomeScreenViewBody> createState() => _HomeScreenViewBodyState();
}

class _HomeScreenViewBodyState extends State<HomeScreenViewBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SponsorListView(),
        HomeScreenMainTitles(
          text: 'Categories',
          ScreenToNavigateTo: const CategoriesItemListView(),
          visible: false,
        ),
        const CategoriesListView(),
        HomeScreenMainTitles(
          text: 'Try this today',
          ScreenToNavigateTo: const TryThisTodayViewAllListView(),
          visible: true,
        ),
        const TryThisListView(),
        HomeScreenMainTitles(
          text: 'Shinning Kitchens',
          ScreenToNavigateTo: const ShinningAll(),
          visible: true,
        ),
        const SizedBox(
          height: 5,
        ),
        const ShinningKitchensListView(),
        const SecondSponsorListView(),
        HomeScreenMainTitles(
          text: 'ShortCuts',
          ScreenToNavigateTo: ShinningAll(),
          visible: false,
        ),
        const ShortcutsListView(),
        HomeScreenMainTitles(
          text: 'Kitchens Nearby',
          ScreenToNavigateTo: ShinningAll(),
          visible: true,
        ),
        const KitchensNearbyListview(),
      ],
    );
  }
}
