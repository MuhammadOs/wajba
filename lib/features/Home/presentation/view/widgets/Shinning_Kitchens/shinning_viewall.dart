import 'package:flutter/material.dart';
import 'package:wajba/features/Home/presentation/view/widgets/Shinning_Kitchens/shinning_viewall_item.dart';
import 'package:wajba/features/Home/presentation/view/widgets/viewall_appbar.dart';
import 'package:wajba/features/KitchensProfile/presentation/views/kitchen_profile_view.dart';

class ShinningAll extends StatelessWidget {
  const ShinningAll({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const ViewAllAppBar(
              title: 'Shinning Kitchens',
            ),
            Expanded(
              child: ListView.builder(itemBuilder: (context, index) {
                return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (c) {
                          return const KitchenProfileView();
                        },
                      ));
                    },
                    child: const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                      child: ShinningAllItems(),
                    ));
              }),
            )
          ],
        ),
      ),
    );
  }
}
