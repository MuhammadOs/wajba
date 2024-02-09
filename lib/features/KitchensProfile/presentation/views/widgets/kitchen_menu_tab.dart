import 'package:flutter/material.dart';
import 'package:wajba/constants/constants.dart';
import 'package:wajba/core/sizeConfig.dart';
import '../../../../../core/styles.dart';
import 'custom_menu_item.dart';


List<String> _tabTitles = ["Trending","Up to 50 %","Share box", "Kids Meals", "Offers"];

class KitchenMenuTab extends StatefulWidget {
  final TickerProvider vsync;

  const KitchenMenuTab({
    Key? key,
    required this.vsync,
  }) : super(key: key);

  @override
  State<KitchenMenuTab> createState() => _KitchenMenuTabState();
}

class _KitchenMenuTabState extends State<KitchenMenuTab>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: _scrollController,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24.0),
            child: TabBar(
              controller: _tabController,
              isScrollable: true,
              automaticIndicatorColorAdjustment: false,
              dividerHeight: 0,
              indicatorSize: TabBarIndicatorSize.label,
              indicatorColor: Theme.of(context).scaffoldBackgroundColor,
              tabs: [
                Tab(
                  icon: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: wajbah_primary,
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: Text("Trending", style: Styles.hint.copyWith(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),),
                  ),
                ),
                Tab(
                  icon: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                        color: wajbah_primary,
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: Text("Up to 50 %", style: Styles.hint.copyWith(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w500
                    ),),
                  ),
                ),
                Tab(
                  icon: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                        color: wajbah_primary,
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: Text("Share Box", style: Styles.hint.copyWith(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w500
                    ),),
                  ),
                ),
                Tab(
                  icon: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                        color: wajbah_primary,
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: Text("Kids Meal", style: Styles.hint.copyWith(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w500
                    ),),
                  ),
                ),
                Tab(
                  icon: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                        color: wajbah_primary,
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: Text("Offers", style: Styles.hint.copyWith(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w500
                    ),),
                  ),
                ),
              ],
              onTap: (index) {
                _scrollTo(index);
              },
            ),
          ),
          for (int i = 0; i < _tabTitles.length; i++)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      _tabTitles[i],
                      style: Styles.titleMedium.copyWith(
                        fontSize: 28
                      ),
                    ),
                  ),
                  const CustomMenuItem(),
                  Divider(
                    indent: MediaQuery.of(context).size.width * 0.05,
                    endIndent: MediaQuery.of(context).size.width * 0.05,
                  ),
                  const CustomMenuItem(),
                  Divider(
                    indent: MediaQuery.of(context).size.width * 0.05,
                    endIndent: MediaQuery.of(context).size.width * 0.05,
                  ),
                  const CustomMenuItem(),
                  const SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  void _scrollTo(int index) {
    _scrollController.animateTo(
      index * 520.0, // Adjust the scroll position based on tab index and item height
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }
}
