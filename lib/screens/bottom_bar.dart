import 'package:gokz/screens/categories_page.dart';
import 'package:gokz/screens/main_page.dart';
import 'package:gokz/screens/profile_page.dart';
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _selectedIndex = 0;
  static final List<Widget> _widgetOptopns = <Widget>[
    MainPage(),
    CategoriesPage(),
    const Text("Profile"),
    ProfilePage(),
  ];
  void _onItemTapped(int index){
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptopns[_selectedIndex
        ]),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Colors.blueGrey,
        unselectedItemColor: const Color(0xff526480),
         items: [
           BottomNavigationBarItem(icon: Icon(FluentSystemIcons.ic_fluent_home_regular),
           activeIcon:Icon(FluentSystemIcons.ic_fluent_home_filled) ,
            label: "Home"),
           BottomNavigationBarItem(icon: Icon(FluentSystemIcons.ic_fluent_app_folder_regular), 
           activeIcon:Icon(FluentSystemIcons.ic_fluent_app_folder_filled) ,
           label: "Search"),
            BottomNavigationBarItem(icon: Icon(FluentSystemIcons.ic_fluent_heart_regular), 
           activeIcon:Icon(FluentSystemIcons.ic_fluent_heart_filled) ,
           label: "Ticket"),
            BottomNavigationBarItem(icon: Icon(FluentSystemIcons.ic_fluent_person_regular), 
           activeIcon:Icon(FluentSystemIcons.ic_fluent_person_filled) ,
           label: "Search"),
      ]),
    );
  }
}