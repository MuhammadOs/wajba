import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wajba/core/sizeConfig.dart';
import 'package:wajba/core/widgets/cutom_error_widget.dart';
import 'package:wajba/features/Home/data/items_data.dart';
import 'package:wajba/features/Home/presentation/view/widgets/TryThisToday/try_this_item.dart';
import 'package:wajba/features/Home/presentation/view_model/TryThisToday%20Cubit/try_this_today_cubit.dart';

class TryThisListView extends StatelessWidget {
  const TryThisListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    double height = SizeConfig.screenH!;
    return BlocBuilder<TryThisTodayCubit, TryThisTodayState>(
      builder: (context, state) {
        if (state is TryThisTodaySuccess) {
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
        } else if (state is TryThisTodayFaliure) {
          return CustomErrorWidget();
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
