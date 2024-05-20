import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wajba/core/networking/dio_factory.dart';
import 'package:wajba/core/util/sizeConfig.dart';
import 'package:wajba/core/widgets/custom_appbar.dart';
import 'package:wajba/core/widgets/cutom_error_widget.dart';
import 'package:wajba/features/Authentication/presentations/view_model/auth_cubit.dart';
import 'package:wajba/features/Home/data/models/item_model/get_menu_items_meals.dart';
import 'package:wajba/features/Home/data/models/item_model/meal.dart';
import 'package:wajba/features/Home/data/repo/home_repo_imp.dart';
import 'package:wajba/features/Home/presentation/view/widgets/TryThisToday/viewall_try_item.dart';
import 'package:wajba/features/Home/presentation/view_model/TryThisToday%20Cubit/try_this_today_cubit.dart';
import 'package:wajba/features/Home/presentation/view_model/TryThisToday%20Cubit/try_this_today_state.dart';
import 'package:wajba/features/KitchensProfile/presentation/views/kitchen_profile_view.dart';

class TryThisTodayViewAllListView extends StatefulWidget {
  const TryThisTodayViewAllListView({Key? key}) : super(key: key);

  @override
  State<TryThisTodayViewAllListView> createState() =>
      _TryThisTodayViewAllListViewState();
}

class _TryThisTodayViewAllListViewState
    extends State<TryThisTodayViewAllListView> {
  GetMenuItemsMeals? getMealsResponseModel;
  List<Meal> meals = [];

  @override
  void initState() {
    super.initState();
    final tryThisTodayCubit = context.read<TryThisTodayCubit>();
    tryThisTodayCubit.getMeals();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double height = SizeConfig.screenH!;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const SizedBox(height: 40),
          CustomAppBar(title: "Try this today"),
          BlocConsumer<TryThisTodayCubit, TryThisTodayState>(
            listener: (context, state) {
              if (state is TryThisTodayFailure) {
                print("Error State: ${state.errMessage}");
              } else if (state is TryThisTodaySuccess) {
                setState(() {
                  getMealsResponseModel = state.getMenuItemsMeals;
                  meals.addAll(getMealsResponseModel?.result ?? []);
                });
              }
            },
            builder: (context, state) {
              if (state is TryThisTodayLoading) {
                return const Center(
                  child: CircularProgressIndicator.adaptive(),
                );
              } else if (state is TryThisTodaySuccess) {
                return SizedBox(
                  height: height * 0.8,
                  child: GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 15,
                    ),
                    itemCount: meals.length,
                    itemBuilder: (context, index) {
                      final meal = meals[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) {
                              return const KitchenProfileView();
                            }),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 2),
                          child: TryThisTodayViewAllItem(tryThisItem: meal),
                        ),
                      );
                    },
                  ),
                );
              } else if (state is TryThisTodayFailure) {
                return CustomErrorWidget(message: state.errMessage);
              }
              return Container();
            },
          ),
        ],
      ),
    );
  }
}