import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wajba/core/sizeConfig.dart';
import 'package:wajba/core/widgets/cutom_error_widget.dart';
import 'package:wajba/features/Home/data/items_data.dart';
import 'package:wajba/features/Home/data/models/item_model/meal_model.dart';
import 'package:wajba/features/Home/presentation/view/widgets/TryThisToday/try_this_item.dart';
import 'package:wajba/features/Home/presentation/view_model/TryThisToday%20Cubit/try_this_today_cubit.dart';

import '../../../../data/models/item_model/result.dart';
import '../../../view_model/TryThisToday Cubit/try_this_today_state.dart';

class TryThisListView extends StatefulWidget {
  const TryThisListView({Key? key}) : super(key: key);

  @override
  State<TryThisListView> createState() => _TryThisListViewState();
}

class _TryThisListViewState extends State<TryThisListView> {

  @override
  void initState() {
    getTryThisTodayCubit(context).fetchTryThisItems();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double height = SizeConfig.screenH!;
    return BlocConsumer<TryThisTodayCubit, TryThisTodayState>(
      builder: (context, state) {
        if (state is TryThisTodaySuccess) {
          print("try this list view: ${state.meals}");
          //meals = state.meals;
          return SizedBox(
            height: height * 0.284,
            child: ListView.builder(
              itemCount: state.meals.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: TryThisListItem(
                    meal: state.meals[index],
                  ),
                );
              },
            ),
          );
        } else if (state is TryThisTodayFailure) {
          return CustomErrorWidget(message: state.errMessage);
        } else {
          return const CircularProgressIndicator();
        }
      }, listener: (BuildContext context, TryThisTodayState state) {

    },
    );
  }
}