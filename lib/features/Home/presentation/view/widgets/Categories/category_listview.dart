import 'package:flutter/material.dart';
import 'package:wajba/core/util/sizeConfig.dart';
import 'package:wajba/features/Home/data/categories_data.dart';
import 'package:wajba/features/Home/presentation/view/widgets/Categories/category_item.dart';

class CategoriesListView extends StatelessWidget {
  const CategoriesListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double height = SizeConfig.screenH!;
    return SizedBox(
      height: height * 0.13,
      child: ListView.builder(
        itemCount: categoriesdata.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: CategoryItem(categoryItem: categoriesdata[index]),
          );
        },
      ),
    );
  }
}
