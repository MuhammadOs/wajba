import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:wajba/core/util/sizeConfig.dart';
import 'package:wajba/core/widgets/cutom_error_widget.dart';
import 'package:wajba/features/Home/data/models/item_model/get_menu_items_meals.dart';
import 'package:wajba/features/Home/presentation/view/widgets/TryThisToday/try_this_item.dart';
import 'package:wajba/features/Home/presentation/view_model/TryThisToday%20Cubit/try_this_today_cubit.dart';
import 'package:wajba/features/Home/presentation/view_model/TryThisToday%20Cubit/try_this_today_state.dart';

class TryThisListView extends StatefulWidget {
  const TryThisListView({Key? key}) : super(key: key);

  @override
  State<TryThisListView> createState() => _TryThisListViewState();
}

class _TryThisListViewState extends State<TryThisListView> {
  GetMenuItemsMeals? getMealsResponseModel;

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
    double width = SizeConfig.screenW!;
    return BlocConsumer<TryThisTodayCubit, TryThisTodayState>(
      listener: (context, state) {
        if (state is TryThisTodayFailure) {
          if (kDebugMode) {
            print("Error State: ${state.errMessage}");
          }
        }
      },
      builder: (context, state) {
        if (state is TryThisTodayLoading) {
          return SizedBox(
            height: height * 0.24,
            child: Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: ListView.builder(
                itemCount: 5, // Placeholder count for shimmer effect
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Container(
                      width: width * 0.45,
                      height: height * 0.24,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(23)),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(color: Colors.grey, blurRadius: 2)
                          ]),
                    ),
                  );
                },
              ),
            ),
          );
        } else if (state is TryThisTodaySuccess) {
          final meals = state.getMenuItemsMeals.result ?? [];
          return SizedBox(
            height: height * 0.24,
            child: ListView.builder(
              itemCount: meals.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final meal = meals[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
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
