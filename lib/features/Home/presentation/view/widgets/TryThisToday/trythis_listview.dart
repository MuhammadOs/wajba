import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wajba/core/util/sizeConfig.dart';
import 'package:wajba/core/widgets/cutom_error_widget.dart';
import 'package:wajba/features/Home/data/models/item_model/get_meals_response_model.dart';
import 'package:wajba/features/Home/data/models/item_model/meal.dart';
import 'package:wajba/features/Home/presentation/view/widgets/TryThisToday/try_this_item.dart';
import 'package:wajba/features/Home/presentation/view_model/TryThisToday%20Cubit/try_this_today_cubit.dart';
import '../../../view_model/TryThisToday Cubit/try_this_today_state.dart';

class TryThisListView extends StatefulWidget {
  const TryThisListView({Key? key}) : super(key: key);

  @override
  State<TryThisListView> createState() => _TryThisListViewState();
}

class _TryThisListViewState extends State<TryThisListView> {
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
    SizeConfig().init(context);
    double height = SizeConfig.screenH!;
    return BlocConsumer<TryThisTodayCubit, TryThisTodayState>(
      buildWhen: (oldState, newState) =>
          newState is TryThisTodayFailure || newState is TryThisTodaySuccess,
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
            height: height * 0.284,
            child: ListView.builder(
              itemCount: state.getMealsResponseModel.result?.length ?? 0,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final meal = state.getMealsResponseModel.result![index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: TryThisListItem(
                    meal: meal,
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
    );
  }
}
