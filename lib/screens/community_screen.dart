import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CommunityScreen extends StatefulWidget {
  const CommunityScreen({super.key});

  @override
  State<CommunityScreen> createState() => _CommunityScreenState();
}

class _CommunityScreenState extends State<CommunityScreen> {
  // Warna konsisten dengan home dan product screen
  static const Color primaryColor = Color(0xFF6C63FF);
  static const Color secondaryColor = Color(0xFFF8F9FA);
  static const Color textPrimary = Color(0xFF333333);
  static const Color textSecondary = Color(0xFF666666);

  Future<void> _launchUrl(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width >= 768;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: isDesktop ? 40 : 20,
            vertical: isDesktop ? 30 : 20,
          ),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1200),
              child: Column(
                children: [
                  // Main Community Card
                  Container(
                    decoration: BoxDecoration(
                      color: secondaryColor,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withAlpha(8),
                          blurRadius: 6,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    padding: EdgeInsets.all(isDesktop ? 24.0 : 16.0),
                    child:
                        isDesktop
                            ? _buildDesktopLayout()
                            : _buildMobileLayout(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDesktopLayout() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: _buildContentSection()),
        const SizedBox(width: 40),
        _buildImageSection(),
      ],
    );
  }

  Widget _buildMobileLayout() {
    return Column(
      children: [
        _buildImageSection(mobile: true),
        const SizedBox(height: 32),
        _buildContentSection(centerText: true),
      ],
    );
  }

  Widget _buildContentSection({bool centerText = false}) {
    return Column(
      crossAxisAlignment:
          centerText ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        // Header Text
        Text(
          'Komunitas Developer Digtren',
          textAlign: centerText ? TextAlign.center : TextAlign.left,
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w700,
            color: textPrimary,
            height: 1.3,
          ),
        ),
        const SizedBox(height: 16),
        if (!centerText)
          Container(
            height: 2,
            width: 80,
            color: primaryColor,
            margin: const EdgeInsets.only(bottom: 20),
          ),
        Text(
          'Bergabunglah bersama komunitas pengembang Digtren untuk belajar, berkolaborasi, dan membangun solusi digital untuk pesantren.',
          textAlign: centerText ? TextAlign.center : TextAlign.left,
          style: TextStyle(fontSize: 16, color: textSecondary, height: 1.6),
        ),
        const SizedBox(height: 32),

        // Action Buttons
        Wrap(
          spacing: 16,
          runSpacing: 16,
          alignment: centerText ? WrapAlignment.center : WrapAlignment.start,
          children: [
            _buildActionButton(
              icon: Icons.code,
              label: 'Repository GitHub',
              onTap: () => _launchUrl('https://github.com/programmernusantara'),
            ),
            _buildActionButton(
              icon: Icons.chat,
              label: 'Diskusi Discord',
              onTap: () => _launchUrl('https://discord.gg/mMcy6ZwS'),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildImageSection({bool mobile = false}) {
    return Container(
      constraints: BoxConstraints(
        maxWidth: mobile ? double.infinity : 500,
        maxHeight: mobile ? 220 : 350,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(10),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.asset(
          'assets/images/3.jpeg',
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) => _buildImageError(),
        ),
      ),
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return ElevatedButton.icon(
      onPressed: onTap,
      icon: Icon(icon, size: 20),
      label: Text(label),
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
    );
  }

  Widget _buildImageError() {
    return Container(
      color: secondaryColor,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.people, size: 50, color: Colors.grey[400]),
            const SizedBox(height: 8),
            Text('Gambar Komunitas', style: TextStyle(color: Colors.grey[500])),
          ],
        ),
      ),
    );
  }
}
