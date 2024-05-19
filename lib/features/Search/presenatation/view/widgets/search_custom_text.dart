import 'package:flutter/material.dart';

import '../../../../../core/util/styles.dart';

class SearchCustomText extends StatelessWidget {
  const SearchCustomText({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Text(
        title,
        style: Styles.titleSmall
            .copyWith(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }
}
