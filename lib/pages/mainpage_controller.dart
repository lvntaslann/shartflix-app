import 'package:flutter/material.dart';
import 'package:shartflix/pages/home/home_page.dart';
import 'package:shartflix/pages/profil/profil_page.dart';
import 'package:shartflix/themes/app_colors.dart';
import 'package:shartflix/widgets/bottomnav/my_bottom_navbar.dart';


class MainPageController extends StatefulWidget {
  const MainPageController({Key? key}) : super(key: key);

  @override
  _MainPageControllerState createState() => _MainPageControllerState();
}

class _MainPageControllerState extends State<MainPageController> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomePage(),
    ProfilPage(),
  ];

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: _pages[_selectedIndex],
      bottomNavigationBar: MyBottomNavbar(
        currentIndex: _selectedIndex,
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
