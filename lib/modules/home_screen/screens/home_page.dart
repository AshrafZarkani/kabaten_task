import 'package:flutter/material.dart';
import 'package:kabaten_task/core/constants/constants.dart';
import 'package:kabaten_task/modules/profile_screen/profile_sr.dart';
import 'package:kabaten_task/modules/users_screen/users_sr.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List _pages = [
    const UserListScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: _pages[_selectedIndex],
      bottomNavigationBar: SizedBox(
        child: BottomNavigationBar(
          type: BottomNavigationBarType.shifting,
          selectedItemColor: MyAppColors.blue,
          unselectedItemColor: MyAppColors.grey,
          selectedLabelStyle: const TextStyle(fontSize: 12),
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.people_alt_outlined,
                size: 21,
              ),
              label: 'Users',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.settings,
                size: 21,
              ),
              label: 'Settings',
            ),
          ],
        ),
      ),
    );
  }
}
