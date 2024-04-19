import 'package:flutter/material.dart';
import 'package:wajba/features/Home/data/categories_data.dart';
import 'package:wajba/features/Home/presentation/view/widgets/Categories/viewall_categries_item.dart';
import 'package:wajba/features/Home/presentation/view/widgets/viewall_appbar.dart';
import 'package:wajba/features/KitchensProfile/presentation/views/kitchen_profile_view.dart';

class CategoriesItemListView extends StatelessWidget {
  const CategoriesItemListView({super.key});

  @override
  Widget build(BuildContext context) {
    final arg = ModalRoute.of(context)!.settings.arguments as categories;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            ViewAllAppBar(
              title: arg.name,
            ),
            Expanded(
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, mainAxisSpacing: 15),
                  itemBuilder: (context, index) {
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
                              EdgeInsets.symmetric(horizontal: 15, vertical: 2),
                          child: CategoriesViewallItem(),
                        ));
                  }),
            )
          ],
        ),
      ),
    );
  }
}
