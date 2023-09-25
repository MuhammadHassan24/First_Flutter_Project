import 'package:flutter/material.dart';
import 'package:practies_app/screen/Favoride/favoride_screen.dart';
import 'package:practies_app/screen/Home/home_screen.dart';
import 'package:practies_app/screen/Menu/menu_view.dart';

class ButtomNavigator extends StatefulWidget {
  const ButtomNavigator({super.key});

  @override
  State<ButtomNavigator> createState() => _ButtomNavigatorState();
}

class _ButtomNavigatorState extends State<ButtomNavigator> {
  int selectIndex = 0;
  List screens = [HomeScreen(), MenuScreen(), FavorideScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: screens[selectIndex],
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.menu), label: "Menu"),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite), label: "Favorite")
          ],
          currentIndex: selectIndex,
          onTap: (index) {
            setState(() {
              selectIndex = index;
            });
          },
        ));
  }
}
