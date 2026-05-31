import 'package:flutter/material.dart';
import 'page2.dart'; // Import Halaman Home (PetAdoptScreen)
import 'page3.dart'; // Import Halaman Detail (Page3)
import 'page4.dart'; // Import Halaman Profile (Page4)

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _currentIndex = 0;

  // tampilan aktif
  void _changeTab(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      PetAdoptScreen(onCategoryTap: () => _changeTab(1)),

      Page3(
        onBack: () {
          _changeTab(0);
        },
      ),
      const Page4(),
    ];

    return Scaffold(
      body: pages[_currentIndex],

      // --- BOTTOM NAVIGATION BAR  ---
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _changeTab,
        backgroundColor: const Color(0xff1a2536),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white60,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
        unselectedLabelStyle: const TextStyle(fontSize: 14),
        items: const [
          // TAB 0: HOME
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.only(bottom: 4),
              child: Icon(Icons.home, size: 28),
            ),
            label: 'Home',
          ),

          // TAB 1: DETAIL (PETS)
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.only(bottom: 4),
              child: Icon(Icons.pets, size: 28),
            ),
            label: 'Detail',
          ),

          // TAB 2: PROFILE
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.only(bottom: 4),
              child: Icon(Icons.person, size: 28),
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
