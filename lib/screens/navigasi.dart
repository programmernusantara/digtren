import 'package:flutter/material.dart';
import 'package:nusantara/screens/home_screen.dart';
import '../widgets/desktop_navbar.dart';
import '../widgets/mobile_drawer.dart';
import 'product_screen.dart';
import 'community_screen.dart';
import 'contact_screen.dart';
import 'profile_screen.dart';

class Navigasi extends StatefulWidget {
  const Navigasi({super.key});

  @override
  State<Navigasi> createState() => _NavigasiState();
}

class _NavigasiState extends State<Navigasi> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const ProductScreen(),
    const CommunityScreen(),
    const ContactScreen(),
    const TeamProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width >= 768;

    return Scaffold(
      key: _scaffoldKey,
      appBar:
          isDesktop
              ? null
              : AppBar(
                backgroundColor: Colors.grey[100],
                elevation: 0,
                centerTitle: true,
                title: const Text(
                  'Digtren',
                  style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                leading: IconButton(
                  icon: const Icon(Icons.menu, color: Colors.black87),
                  onPressed: () => _scaffoldKey.currentState?.openDrawer(),
                ),
              ),
      drawer:
          isDesktop
              ? null
              : MobileDrawer(
                onItemSelected: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                  Navigator.pop(context);
                },
              ),
      body: Column(
        children: [
          if (isDesktop)
            DesktopNavbar(
              onItemSelected: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
          Expanded(child: _screens[_currentIndex]),
        ],
      ),
    );
  }
}
