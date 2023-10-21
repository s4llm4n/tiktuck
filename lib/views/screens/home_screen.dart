import 'package:firstproject/constant.dart';
import 'package:firstproject/views/widgets/custom_icon.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: backgroundColor,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.white,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, size: 30),
            label: 'Home',
            ),
            BottomNavigationBarItem(
            icon: Icon(Icons.search, size: 30),
            label: 'Search',
            ),
            BottomNavigationBarItem(
            icon: CustomIcon(),
            label: '',
            ),
            BottomNavigationBarItem(
            icon: Icon(Icons.message, size: 30),
            label: 'Messages',
            ),
            BottomNavigationBarItem(
            icon: Icon(Icons.person, size: 30),
            label: 'Profile',
            ),
          ],
      ),
      body: Center(
        child: Text('Home Screen'),
      ),
    );
  }
}
