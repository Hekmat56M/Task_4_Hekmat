import 'package:flutter/material.dart';
import 'package:task_4_hekmat/ui/home_screen.dart';
import 'package:task_4_hekmat/ui/profile_screen.dart';
import 'package:task_4_hekmat/ui/setting_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List screenList = [
    const HomeScreen(),
    const ProfileScreen(),
    const SettingScreen(),
    // MenuScreen(),
  ];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: screenList[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (value) {
            currentIndex = value;
            setState(() {});
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'List View'),
            BottomNavigationBarItem(
                icon: Icon(Icons.person), label: 'Grid View'),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: 'Form Field'),
            //BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'API'),
          ],
        ));
  }
}
