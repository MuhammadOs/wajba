import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:wajba/core/util/sizeConfig.dart';
import 'package:wajba/core/widgets/cutom_error_widget.dart';
import 'package:wajba/features/Home/presentation/view/widgets/Shinning_Kitchens/shinning_kitchens_item.dart';
import 'package:wajba/features/Home/presentation/view_model/TryThisToday%20Cubit/try_this_today_state.dart';
import 'package:wajba/features/Home/presentation/view_model/shining_kitchens_cubit/shinining_kitchen_cubit.dart';
import 'package:wajba/features/Home/presentation/view_model/shining_kitchens_cubit/shinining_kitchen_state.dart';
import '../../../view_model/TryThisToday Cubit/try_this_today_cubit.dart';

class ShinningKitchensListView extends StatefulWidget {
  const ShinningKitchensListView({Key? key}) : super(key: key);

  @override
  State<ShinningKitchensListView> createState() =>
      _ShinningKitchensListViewState();
}

class _ShinningKitchensListViewState extends State<ShinningKitchensListView> {
  @override
  void initState() {
    super.initState();
    context.read<ShiningKitchenCubit>().getShiningKitchens();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double height = SizeConfig.screenH!;
    double width = SizeConfig.screenW!;
    return BlocConsumer<ShiningKitchenCubit, ShiningKitchenState>(
      listener: (context, state) {
        if (state is ShiningKitchensFailure) {
          if (kDebugMode) {
            print("Error State: ${state.errMessage}");
          }
        }
      },
      builder: (context, state) {
        if (state is ShiningKitchensLoading) {
          return SizedBox(
            height: height * 0.24,
            child: Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: ListView.builder(
                itemCount: 5,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Container(
                      height: height * 0.2,
                      width: width * 0.8,
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
        } else if (state is ShiningKitchensSuccess) {
          final kitchens = state.getShiningKitchensRequest.result ?? [];
          return SizedBox(
            height: height * 0.325,
            child: ListView.builder(
              itemCount: kitchens.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final kitchen = kitchens[index];
                return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: ShinningKitchenItem(kitchen: kitchen));
              },
            ),
          );
        } else if (state is ShiningKitchensFailure) {
          return CustomErrorWidget(message: state.errMessage);
        }
        return Container();
      },
    );
    ;
  }
}
