import 'package:flutter/material.dart';
import 'package:wajba/core/widgets/custom_appbar.dart';
import 'package:wajba/features/Home/data/items_data.dart';
import 'package:wajba/features/Home/presentation/view/widgets/TryThisToday/viewall_try_item.dart';
import 'package:wajba/features/Home/presentation/view/widgets/viewall_appbar.dart';
import 'package:wajba/features/KitchensProfile/presentation/views/kitchen_profile_view.dart';

class TryThisTodayViewAllListView extends StatelessWidget {
  const TryThisTodayViewAllListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 40,),
          CustomAppBar(title: "Try this today"),
          Expanded(
            child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, mainAxisSpacing: 15),
                itemCount: ItemsData.length,
                itemBuilder: (context, index) {
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
                        child: TryThisTodayViewAllItem(
                            tryThisItem: ItemsData[index]),
                      ));
                }),
          )
        ],
      ),
    );
  }
}
