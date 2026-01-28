import 'package:flutter/material.dart';

class BottomNavYogesh extends StatefulWidget {
  const BottomNavYogesh({Key? key}) : super(key: key);

  @override
  State<BottomNavYogesh> createState() => _BottomNavYogeshState();
}

class _BottomNavYogeshState extends State<BottomNavYogesh> {
  int _currentIndex = 0;

  final List<Widget> _screens = const [
    _PlaceholderScreen(title: "Home Screen"),
    _PlaceholderScreen(title: "Menu Screen"),
    _PlaceholderScreen(title: "Profile Screen"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.restaurant_menu),
            label: "Menu",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}


class _PlaceholderScreen extends StatelessWidget {
  final String title;

  const _PlaceholderScreen({required this.title});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}