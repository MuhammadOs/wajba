import 'package:flutter/material.dart';
import 'package:wajba/features/Home/presentation/view/widgets/Shortcuts/Hot%20Deals/hot_deals_view.dart';
import 'package:wajba/features/Home/presentation/view/widgets/Shortcuts/Hot%20Deals/no_hotdeals.dart';

class HotDealsBody extends StatelessWidget {
  const HotDealsBody({super.key});

  @override
  Widget build(BuildContext context) {
    bool thereisdeals = true;
    // ignore: dead_code
    return thereisdeals ? HotDealsView() : const NoHotDealsView();
  }
}
