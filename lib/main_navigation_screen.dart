import 'package:flutter/material.dart';
import 'package:sign_bridge/screens/dictionary/dictionary_screen.dart';
import 'package:sign_bridge/screens/education/education_path_screen.dart';
import 'package:sign_bridge/screens/home/home_screen.dart';
import 'package:sign_bridge/screens/profile/profile_screen.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const DictionaryScreen(),
    const EducationPathScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    // Determine current theme brightness to adjust nav bar color
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      extendBody: true,
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: isDark ? Colors.white.withOpacity(0.05) : Colors.black.withOpacity(0.05),
              width: 1,
            ),
          ),
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          type: BottomNavigationBarType.fixed,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor.withOpacity(0.8),
          selectedItemColor: Theme.of(context).primaryColor,
          unselectedItemColor: isDark ? Colors.grey[500] : Colors.grey[400],
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedFontSize: 12,
          unselectedFontSize: 12,
          elevation: 0,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              activeIcon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.menu_book_outlined),
              activeIcon: Icon(Icons.menu_book),
              label: 'Dictionary',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.school_outlined), // Using School for Education/Quizzes
              activeIcon: Icon(Icons.school),
              label: 'Education',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              activeIcon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
