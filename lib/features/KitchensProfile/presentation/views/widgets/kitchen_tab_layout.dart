import 'package:flutter/material.dart';
import 'package:wajba/constants/constants.dart';
import 'package:wajba/core/sizeConfig.dart';
import 'package:wajba/core/styles.dart';
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
    _tabController.addListener(_handleTabSelection);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _handleTabSelection() {
    setState(() {}); // Update the state to reflect the new tab selection
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final screenHeight = SizeConfig.screenH!;
    final tabBarHeight = screenHeight * 0.04;
    final tabViewHeight = screenHeight * 0.6;

    return SizedBox(
      height: tabBarHeight + tabViewHeight,
      child: Column(
        children: [
          SizedBox(
            height: tabBarHeight,
            child: TabBar(
              controller: _tabController,
              tabs: [
                _buildTab("Menu", 0),
                _buildTab("About", 1),
                _buildTab("Reviews", 2),
              ],
            ),
          ),
          Expanded(
            child: SizedBox(
              height: tabViewHeight,
              child: TabBarView(
                controller: _tabController,
                children: [
                  KitchenMenuTab(vsync: this),
                  const KitchenAboutTab(),
                  const KitchenReviewsTab(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTab(String text, int index) {
    return Tab(
      child: Text(
        text,
        style: _tabController.index == index
            ? Styles.hint.copyWith(color: wajbah_black)
            : Styles.hint.copyWith(color: wajbah_gray),
      ),
    );
  }
}
