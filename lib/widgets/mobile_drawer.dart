import 'package:flutter/material.dart';
import 'package:nusantara/widgets/nav_items.dart';

class MobileDrawer extends StatelessWidget {
  final Function(int) onItemSelected;

  const MobileDrawer({super.key, required this.onItemSelected});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Optional: Tambahkan branding di atas
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: Text(
                'Digtren',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Colors.black87,
                ),
              ),
            ),
            const Divider(thickness: 1, height: 1),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.only(top: 8),
                children: [
                  NavListTile(
                    icon: Icons.home,
                    text: 'Home',
                    onTap: () => onItemSelected(0),
                  ),
                  NavListTile(
                    icon: Icons.shopping_bag_outlined,
                    text: 'Product',
                    onTap: () => onItemSelected(1),
                  ),
                  NavListTile(
                    icon: Icons.people_outline,
                    text: 'Community',
                    onTap: () => onItemSelected(2),
                  ),
                  NavListTile(
                    icon: Icons.mail_outline,
                    text: 'Contact Us',
                    onTap: () => onItemSelected(3),
                  ),
                ],
              ),
            ),
            const Divider(thickness: 1, height: 1),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 12,
              ),
              child: NavListTile(
                icon: Icons.person_outline,
                text: 'Profile',
                onTap: () => onItemSelected(4),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
