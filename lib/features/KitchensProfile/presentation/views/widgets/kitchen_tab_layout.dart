import 'package:flutter/material.dart';
import 'kitchen_about_tab.dart';
import 'kitchen_menu_tab.dart';
import 'kitchen_review_tab.dart';
class KitchenTabLayout extends StatefulWidget {
  const KitchenTabLayout({Key? key}) : super(key: key);

  @override
  _KitchenTabLayoutState createState() => _KitchenTabLayoutState();
}

class _KitchenTabLayoutState extends State<KitchenTabLayout>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.7,
      child: Column(
        children: [
          TabBar(
            controller: _tabController,
            tabs: const [
              Tab(text: 'Menu'),
              Tab(text: 'About'),
              Tab(text: 'Reviews'),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                KitchenMenuTab(vsync: this),
                const KitchenAboutTab(),
                const KitchenReviewsTab()
              ],
            ),
          ),
        ],
      ),
    );
  }
}
