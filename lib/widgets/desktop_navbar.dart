import 'package:flutter/material.dart';
import 'nav_items.dart';

class DesktopNavbar extends StatelessWidget {
  final Function(int) onItemSelected;

  const DesktopNavbar({super.key, required this.onItemSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      color: Colors.grey[100],
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        children: [
          // Logo Nusantara di kiri
          GestureDetector(
            onTap: () => onItemSelected(0),
            child: const Text(
              'Nusantara',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ),

          // Menu tengah (ikon + teks)
          Expanded(
            child: Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  NavItem(
                    icon: Icons.shopping_bag_outlined,
                    text: 'Product',
                    onPressed: () => onItemSelected(1),
                  ),
                  const SizedBox(width: 32),
                  NavItem(
                    icon: Icons.people_outline,
                    text: 'Community',
                    onPressed: () => onItemSelected(2),
                  ),
                  const SizedBox(width: 32),
                  NavItem(
                    icon: Icons.mail_outline,
                    text: 'Contact',
                    onPressed: () => onItemSelected(3),
                  ),
                ],
              ),
            ),
          ),

          // Profile dengan teks
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: NavItem(
              icon: Icons.person_outline,
              text: 'Profile',
              iconSize: 24,
              textSize: 14,
              onPressed: () => onItemSelected(4),
            ),
          ),
        ],
      ),
    );
  }
}
