import 'package:flutter/material.dart';
import 'package:wajba/features/Home/presentation/view/widgets/Shortcuts/Past%20Orders/no_past_orders_view.dart';
import 'package:wajba/features/Home/presentation/view/widgets/Shortcuts/Past%20Orders/past_orders_listview.dart';

class PastOrdersBody extends StatelessWidget {
  PastOrdersBody({super.key});

  @override
  final itemsList = [];
  Widget build(BuildContext context) {
    return itemsList.length == 0 ? NoPastOrders() : PastOrdersListView();
  }
}
