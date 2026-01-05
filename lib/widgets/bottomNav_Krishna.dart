import 'package:flutter/material.dart';

class BottomNavKrishna extends StatefulWidget {
  const BottomNavKrishna({super.key});

  @override
  State<BottomNavKrishna> createState() => _BottomNavKrishnaState();
}

class _BottomNavKrishnaState extends State<BottomNavKrishna> {
  int _selectedIndex = 0;

  // Function to handle tap events
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // IndexedStack keeps all children in the tree but only paints the one at 'index'.
      // This preserves the state (scroll position, text inputs) of the other pages.
      body: IndexedStack(
        index: _selectedIndex,
        children: const [
          // Tab 0: Home
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.home_rounded, size: 64, color: Colors.blueAccent),
                SizedBox(height: 16),
                Text(
                  "Home Feed",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          // Tab 1: Menu
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.restaurant_menu_rounded,
                  size: 64,
                  color: Colors.orange,
                ),
                SizedBox(height: 16),
                Text(
                  "Mess Menu",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          // Tab 2: Profile
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.person_rounded, size: 64, color: Colors.purple),
                SizedBox(height: 16),
                Text(
                  "Student Profile",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),

      // The Navigation Bar at the bottom
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: _onItemTapped,
        elevation: 3.0,
        backgroundColor: Colors.white,
        indicatorColor: Colors.blue.shade100,
        destinations: const <NavigationDestination>[
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home_rounded, color: Colors.blue),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.restaurant_menu),
            selectedIcon: Icon(
              Icons.restaurant_menu_rounded,
              color: Colors.orange,
            ),
            label: 'Menu',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person_rounded, color: Colors.purple),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
