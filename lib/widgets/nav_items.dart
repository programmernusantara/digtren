import 'package:flutter/material.dart';

class NavListTile extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback? onTap;

  const NavListTile({
    super.key,
    required this.icon,
    required this.text,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        child: Row(
          children: [
            Icon(icon, color: Colors.black87, size: 22),
            const SizedBox(width: 16),
            Text(
              text,
              style: const TextStyle(
                fontSize: 15,
                color: Colors.black87,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NavItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final double iconSize;
  final double textSize;
  final VoidCallback? onPressed;

  const NavItem({
    super.key,
    required this.icon,
    required this.text,
    this.iconSize = 20,
    this.textSize = 14,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      icon: Icon(icon, size: iconSize),
      label: Text(
        text,
        style: TextStyle(color: Colors.black87, fontSize: textSize),
      ),
      onPressed: onPressed,
      style: TextButton.styleFrom(foregroundColor: Colors.black87),
    );
  }
}
