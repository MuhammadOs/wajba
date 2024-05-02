import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wajba/core/sizeConfig.dart';
import 'package:wajba/core/widgets/custom_appbar.dart';
import 'package:wajba/core/widgets/cutom_error_widget.dart';
import 'package:wajba/features/Home/data/models/get_meals_response_model.dart';
import 'package:wajba/features/Home/data/models/meal.dart';
import 'package:wajba/features/Home/presentation/view/widgets/TryThisToday/viewall_try_item.dart';
import 'package:wajba/features/Home/presentation/view_model/TryThisToday%20Cubit/try_this_today_cubit.dart';
import 'package:wajba/features/Home/presentation/view_model/TryThisToday%20Cubit/try_this_today_state.dart';
import 'package:wajba/features/KitchensProfile/presentation/views/kitchen_profile_view.dart';

class TryThisTodayViewAllListView extends StatefulWidget {
  const TryThisTodayViewAllListView({super.key});

  @override
  State<TryThisTodayViewAllListView> createState() =>
      _TryThisTodayViewAllListViewState();
}

class _TryThisTodayViewAllListViewState
    extends State<TryThisTodayViewAllListView> {
  GetMealsResponseModel? getMealsResponseModel;
  List<Meal> meals = [];

  getMeals() {
    getTryThisTodayCubit(context).getMeals();
  }

  @override
  void initState() {
    getMeals();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = SizeConfig.screenH!;
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            CustomAppBar(title: "Try this today"),
            BlocConsumer<TryThisTodayCubit, TryThisTodayState>(
              buildWhen: (oldState, newState) =>
                  newState is TryThisTodayFailure ||
                  newState is TryThisTodaySuccess,
              listener: (context, state) {
                if (state is TryThisTodayFailure) {
                  print("Error State");
                } else if (state is TryThisTodaySuccess) {
                  getMealsResponseModel = state.getMealsResponseModel;
                  meals.addAll(getMealsResponseModel?.result ?? []);
                }
              },
              builder: (context, state) {
                if (state is TryThisTodayLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is TryThisTodaySuccess) {
                  return SizedBox(
                    height: height * 0.8,
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2, mainAxisSpacing: 15),
                      itemCount:
                          state.getMealsResponseModel.result?.length ?? 0,
                      itemBuilder: (context, index) {
                        final meal = state.getMealsResponseModel.result![index];
                        return GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (c) {
                                  return const KitchenProfileView();
                                },
                              ));
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 2),
                              child: TryThisTodayViewAllItem(tryThisItem: meal),
                            ));
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
        ));
  }
}
