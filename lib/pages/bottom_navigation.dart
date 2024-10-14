import 'package:flutter/material.dart';
import 'package:ostello_assignment/pages/schdule_screen.dart';
import 'home_screen.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _selectedIndex = 0;

  // List of screens that will appear when corresponding BottomNavigationBar item is tapped
  final List<Widget> _screens = [
    HomeScreen(),
    SchduleScreen(),
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // Helper method to create BottomNavigationBarItem
  BottomNavigationBarItem _buildNavItem(String iconPath, String label) {
    return BottomNavigationBarItem(
      icon: Column(
        children: [
          Image.asset(
            iconPath,
            height: 24, // Adjust icon size for reduced height
          ),
          SizedBox(height: 4), // Space between icon and label
          Text(
            label,
            style: TextStyle(
              fontSize: 12, // Adjust font size if necessary
              color: Colors.black, // Customize color if needed
            ),
          ),
        ],
      ),
      label: '', // Empty label to avoid overlap
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        iconSize: 24, // Reduce icon size for overall smaller height
        items: [
          _buildNavItem('assets/images/home_nav.png', 'Home'),
          _buildNavItem('assets/images/calendar.png', 'Schedule'),
          _buildNavItem('assets/images/book_nav.png', 'Content'),
          _buildNavItem('assets/images/batches_nav.png', 'Batches'),
          _buildNavItem('assets/images/ai_tutor.png', 'Ai Tutor'),
        ],
      ),
    );
  }
}
