import 'package:flutter/material.dart';
import 'package:wajba/features/Home/data/shortcuts_data.dart';
import 'package:wajba/features/Home/presentation/view/widgets/Shortcuts/Hot%20Deals/hot_deals_body.dart';
import 'package:wajba/features/Home/presentation/view/widgets/Shortcuts/Hot%20Deals/hot_deals_view.dart';
import 'package:wajba/features/Home/presentation/view/widgets/Shortcuts/Past%20Orders/past_orders_body.dart';
import 'package:wajba/features/Home/presentation/view/widgets/viewall_appbar.dart';

class ShortcutsViewScreen extends StatelessWidget {
  const ShortcutsViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final arg = ModalRoute.of(context)!.settings.arguments as shortcuts;
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            ViewAllAppBar(title: arg.name),
            arg.name == 'Past Orders'
                ? PastOrdersBody()
                : arg.name == 'Customize Order'
                    ? Text('Customize Order')
                    : arg.name == 'Hot Deals'
                        ? const HotDealsBody()
                        : arg.name == 'Coupons Sale'
                            ? Text('Coupouns sale')
                            : arg.name == 'Popular Orders'
                                ? Text('Popular Orders')
                                : Text('No Data')
          ],
        ),
      ),
    );
  }
}
