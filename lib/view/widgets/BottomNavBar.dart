import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

import '../screens/BagScreen.dart';
import '../screens/FavoriteScreen.dart';
import '../screens/HomeScreen.dart';
import '../screens/ProfileScreen.dart';
import '../screens/ShopScreen.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  final _bottomNavBarController = PersistentTabController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF9F9F9),
      body: PersistentTabView(
        screenTransitionAnimation: ScreenTransitionAnimation(
          curve: Curves.easeInOutCubic,

          duration: Duration(milliseconds: 300),
        ),
        controller: _bottomNavBarController,
        backgroundColor: Colors.white,
        handleAndroidBackButtonPress: true,
        resizeToAvoidBottomInset: true,
        stateManagement: true,

        tabs: [
          PersistentTabConfig(
            screen: Homescreen(),
            item: ItemConfig(
              icon: Icon(HeroIcons.home),
              title: "Home",
              activeForegroundColor: Colors.redAccent,
            ),
          ),
          PersistentTabConfig(
            screen: Shopscreen(),
            item: ItemConfig(
              icon: Icon(CupertinoIcons.shopping_cart),
              title: "Shop",
              activeForegroundColor: Colors.redAccent,
            ),
          ),
          PersistentTabConfig(
            screen: BagScreen(),
            item: ItemConfig(
              icon: Icon(Iconsax.bag_2_outline),
              title: "Bag",
              activeForegroundColor: Colors.redAccent,
            ),
          ),
          PersistentTabConfig(
            screen: FavoriteScreen(),
            item: ItemConfig(
              icon: Icon(Icons.favorite_outline_rounded),
              title: "Favorites",
              activeForegroundColor: Colors.redAccent,
            ),
          ),
          PersistentTabConfig(
            screen: Profilescreen(),
            item: ItemConfig(
              icon: Icon(Iconsax.user_outline),
              title: "Profile",
              activeForegroundColor: Colors.redAccent,
            ),
          ),
        ],

        navBarBuilder: (navBarConfig) => Style12BottomNavBar(
          itemAnimationProperties: ItemAnimation(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          ),
          navBarConfig: navBarConfig,
          navBarDecoration: NavBarDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
