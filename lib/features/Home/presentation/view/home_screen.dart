import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wajba/core/util/theme.dart';
import 'package:wajba/core/util/styles.dart';
import 'package:wajba/features/Account/presentation/view/account_view_body.dart';
import 'package:wajba/features/Cart/presentation/view/cart_view.dart';
import 'package:wajba/features/Home/presentation/view/widgets/HomeScreen.dart';
import 'package:wajba/features/Search/presenatation/view/search_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _current_index = 0;

  final tabs = [
    const HomeScreenView(),
    const SearchScreen(),
    const CartView(),
    const AccountViewBody()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: tabs[_current_index],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: Styles.titleMedium.copyWith(fontSize: 14),
        unselectedLabelStyle: Styles.titleMedium.copyWith(fontSize: 12),
        enableFeedback: true,
        unselectedItemColor: wajbah_gray,
        currentIndex: _current_index,
        selectedItemColor: wajbah_primary,
        iconSize: 25,
        items: const [
          BottomNavigationBarItem(
              icon: FaIcon(
                FontAwesomeIcons.home,
              ),
              label: 'Home'),
          BottomNavigationBarItem(
              icon: FaIcon(
                FontAwesomeIcons.search,
              ),
              label: 'Search'),
          BottomNavigationBarItem(
              icon: FaIcon(
                FontAwesomeIcons.shoppingBasket,
              ),
              label: 'Cart'),
          BottomNavigationBarItem(
            icon: FaIcon(
              FontAwesomeIcons.userCircle,
            ),
            label: 'Account',
          ),
        ],
        onTap: (index) {
          setState(() {
            _current_index = index;
          });
        },
      ),
    );
  }
}
