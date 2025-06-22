import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CommunityScreen extends StatefulWidget {
  const CommunityScreen({super.key});

  @override
  State<CommunityScreen> createState() => _CommunityScreenState();
}

class _CommunityScreenState extends State<CommunityScreen> {
  bool _showTech = false;

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
                  const SizedBox(height: 40),

                  // Tech Section (Conditional)
                  if (_showTech) ...[
                    _buildSectionTitle("Teknologi Kami", context),
                    const SizedBox(height: 24),
                    _buildTechGrid(isDesktop),
                    const SizedBox(height: 40),
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Widget untuk judul section yang konsisten
  Widget _buildSectionTitle(String title, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w600,
              color: textPrimary,
              letterSpacing: -0.5,
            ),
          ),
          const SizedBox(height: 8),
          Container(height: 2, width: 60, color: primaryColor.withAlpha(180)),
        ],
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

        // Tech Toggle Button
        _buildToggleButton(centerText),
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

  Widget _buildToggleButton(bool centerText) {
    return GestureDetector(
      onTap: () => setState(() => _showTech = !_showTech),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: primaryColor.withAlpha(25),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: primaryColor.withAlpha(50)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              _showTech ? Icons.visibility_off : Icons.visibility,
              color: primaryColor,
              size: 20,
            ),
            const SizedBox(width: 8),
            Text(
              _showTech ? 'Sembunyikan Teknologi' : 'Lihat Teknologi Kami',
              style: TextStyle(
                color: primaryColor,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTechGrid(bool isDesktop) {
    final techItems = [
      _TechItem('UI/UX', [
        _TechSubItem('Figma', Icons.design_services, Colors.pink),
        _TechSubItem('Rive', Icons.animation, Colors.orange),
        _TechSubItem('Blender', Icons.threed_rotation, Colors.amber),
        _TechSubItem('Photoshop', Icons.brush, Colors.blue),
      ]),
      _TechItem('Frontend', [
        _TechSubItem('Dart', Icons.code, Colors.blueAccent),
        _TechSubItem('Flutter', Icons.phone_iphone, Colors.lightBlue),
        _TechSubItem('Riverpod', Icons.widgets, Colors.blueGrey),
        _TechSubItem('Serverpod', Icons.dns, Colors.lightBlue[400]!),
      ]),
      _TechItem('Backend', [
        _TechSubItem('Go', Icons.storage, Colors.teal),
        _TechSubItem('Fiber', Icons.api, Colors.cyan),
        _TechSubItem('PostgreSQL', Icons.storage, Colors.indigo),
        _TechSubItem('CockroachDB', Icons.storage, Colors.deepPurple),
        _TechSubItem('Redis', Icons.memory, Colors.red),
        _TechSubItem('Rebit', Icons.cached, Colors.deepOrange),
        _TechSubItem('Elasticsearch', Icons.search, Colors.green),
      ]),
      _TechItem('Infrastructure', [
        _TechSubItem('MinIO', Icons.cloud, Colors.blue),
        _TechSubItem('Docker', Icons.developer_board, Colors.blue),
        _TechSubItem('Ubuntu', Icons.computer, Colors.orange),
        _TechSubItem('Grafana', Icons.analytics, Colors.purple),
      ]),
    ];

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(8),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      padding: const EdgeInsets.all(24),
      child:
          isDesktop
              ? Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  for (var category in techItems)
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: _buildTechCategory(category),
                      ),
                    ),
                ],
              )
              : Column(children: techItems.map(_buildTechCategory).toList()),
    );
  }

  Widget _buildTechCategory(_TechItem category) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          category.category,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: textPrimary,
          ),
        ),
        const SizedBox(height: 16),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children:
              category.items.map((tech) {
                return Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: tech.color.withAlpha(25),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: tech.color.withAlpha(50)),
                      ),
                      child: Icon(tech.icon, size: 28, color: tech.color),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      tech.label,
                      style: TextStyle(fontSize: 12, color: textSecondary),
                    ),
                  ],
                );
              }).toList(),
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

class _TechItem {
  final String category;
  final List<_TechSubItem> items;

  _TechItem(this.category, this.items);
}

class _TechSubItem {
  final String label;
  final IconData icon;
  final Color color;

  _TechSubItem(this.label, this.icon, this.color);
}
