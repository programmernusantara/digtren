import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CommunityScreen extends StatefulWidget {
  const CommunityScreen({super.key});

  @override
  State<CommunityScreen> createState() => _CommunityScreenState();
}

class _CommunityScreenState extends State<CommunityScreen> {
  bool _showTech = false;

  Future<void> _launchUrl(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width >= 768;

    return SingleChildScrollView(
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
                Card(
                  elevation: 0,
                  color: Colors.grey[50],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(isDesktop ? 32.0 : 20.0),
                    child:
                        isDesktop
                            ? _buildDesktopLayout()
                            : _buildMobileLayout(),
                  ),
                ),

                const SizedBox(height: 40),

                // Development Team Section (moved from home)
                _buildDevelopmentTeamSection(isDesktop),

                const SizedBox(height: 40),

                // Support Facilities Section (moved from home)
                _buildSupportFacilitiesSection(isDesktop),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDevelopmentTeamSection(bool isDesktop) {
    return Card(
      elevation: 0,
      color: Colors.grey[50],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: EdgeInsets.all(isDesktop ? 32.0 : 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.group,
                  size: isDesktop ? 32 : 28,
                  color: Colors.blue[800],
                ),
                const SizedBox(width: 12),
                Text(
                  'Tim Pengembang',
                  style: TextStyle(
                    fontSize: isDesktop ? 24 : 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue[800],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Container(
              height: 2,
              color: Colors.blue[100],
              margin: const EdgeInsets.only(bottom: 20),
            ),

            Text(
              'Tim profesional yang bertanggung jawab untuk mengembangkan aplikasi:',
              style: TextStyle(
                fontSize: isDesktop ? 16 : 14,
                color: Colors.grey[700],
                height: 1.5,
              ),
            ),
            const SizedBox(height: 24),

            // Team Grid - 2 cards per row in desktop
            isDesktop ? _buildDesktopTeamGrid() : _buildMobileTeamList(),
          ],
        ),
      ),
    );
  }

  Widget _buildSupportFacilitiesSection(bool isDesktop) {
    return Card(
      elevation: 0,
      color: Colors.grey[50],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: EdgeInsets.all(isDesktop ? 32.0 : 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.construction,
                  size: isDesktop ? 32 : 28,
                  color: Colors.blue[800],
                ),
                const SizedBox(width: 12),
                Text(
                  'Fasilitas Pendukung',
                  style: TextStyle(
                    fontSize: isDesktop ? 24 : 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue[800],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Container(
              height: 2,
              color: Colors.blue[100],
              margin: const EdgeInsets.only(bottom: 20),
            ),

            Text(
              'Fasilitas dan infrastruktur yang mendukung proses pengembangan:',
              style: TextStyle(
                fontSize: isDesktop ? 16 : 14,
                color: Colors.grey[700],
                height: 1.5,
              ),
            ),
            const SizedBox(height: 24),

            // Facilities Grid - 2 cards per row in desktop
            isDesktop
                ? _buildDesktopFacilitiesGrid()
                : _buildMobileFacilitiesList(),
            const SizedBox(height: 16),

            Text(
              '*Peralatan tambahan dapat disesuaikan dengan kebutuhan proyek',
              style: TextStyle(
                fontSize: isDesktop ? 14 : 12,
                fontStyle: FontStyle.italic,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDesktopTeamGrid() {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      childAspectRatio: 3,
      crossAxisSpacing: 20,
      mainAxisSpacing: 20,
      children: [
        _buildTeamRoleCard(
          'Project Manager',
          Icons.assignment,
          'Mengelola proyek dan tim',
          Colors.blue,
        ),
        _buildTeamRoleCard(
          'UI/UX Designer',
          Icons.design_services,
          'Mendesain antarmuka pengguna',
          Colors.purple,
        ),
        _buildTeamRoleCard(
          'Frontend Developer',
          Icons.code,
          'Membangun tampilan aplikasi',
          Colors.green,
        ),
        _buildTeamRoleCard(
          'Backend Developer',
          Icons.storage,
          'Mengembangkan sistem server',
          Colors.orange,
        ),
        _buildTeamRoleCard(
          'System Engineer',
          Icons.settings,
          'Menjaga infrastruktur IT',
          Colors.red,
        ),
        _buildTeamRoleCard(
          'Admin Operasional',
          Icons.people,
          'Mengelola administrasi',
          Colors.teal,
        ),
      ],
    );
  }

  Widget _buildMobileTeamList() {
    return Column(
      children: [
        _buildTeamRoleCard(
          'Project Manager',
          Icons.assignment,
          'Mengelola proyek dan tim',
          Colors.blue,
        ),
        const SizedBox(height: 12),
        _buildTeamRoleCard(
          'UI/UX Designer',
          Icons.design_services,
          'Mendesain antarmuka pengguna',
          Colors.purple,
        ),
        const SizedBox(height: 12),
        _buildTeamRoleCard(
          'Frontend Developer',
          Icons.code,
          'Membangun tampilan aplikasi',
          Colors.green,
        ),
        const SizedBox(height: 12),
        _buildTeamRoleCard(
          'Backend Developer',
          Icons.storage,
          'Mengembangkan sistem server',
          Colors.orange,
        ),
        const SizedBox(height: 12),
        _buildTeamRoleCard(
          'System Engineer',
          Icons.settings,
          'Menjaga infrastruktur IT',
          Colors.red,
        ),
        const SizedBox(height: 12),
        _buildTeamRoleCard(
          'Admin Operasional',
          Icons.people,
          'Mengelola administrasi',
          Colors.teal,
        ),
      ],
    );
  }

  Widget _buildTeamRoleCard(
    String title,
    IconData icon,
    String description,
    Color color,
  ) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            // Icon Section
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: color.withAlpha(100),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(icon, size: 32, color: color),
            ),
            const SizedBox(width: 16),

            // Info Section
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue[800],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(width: 40, height: 4, color: color),
                  const SizedBox(height: 8),
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                      height: 1.4,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDesktopFacilitiesGrid() {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      childAspectRatio: 3,
      crossAxisSpacing: 20,
      mainAxisSpacing: 20,
      children: [
        _buildFacilityCard(
          'Gedung dengan Ruang Kerja',
          'Ruang kerja ergonomis dengan fasilitas lengkap',
          Icons.business,
          Colors.blue,
        ),
        _buildFacilityCard(
          'Koneksi Internet Stabil',
          'Koneksi high-speed dengan backup connection',
          Icons.wifi,
          Colors.green,
        ),
        _buildFacilityCard(
          'Server untuk Testing',
          'Server dedicated untuk pengembangan dan testing',
          Icons.storage,
          Colors.orange,
        ),
        _buildFacilityCard(
          'Workstation Profesional',
          'PC/Laptop dengan spesifikasi tinggi untuk tim',
          Icons.computer,
          Colors.purple,
        ),
      ],
    );
  }

  Widget _buildMobileFacilitiesList() {
    return Column(
      children: [
        _buildFacilityCard(
          'Gedung dengan Ruang Kerja',
          'Ruang kerja ergonomis dengan fasilitas lengkap',
          Icons.business,
          Colors.blue,
        ),
        const SizedBox(height: 12),
        _buildFacilityCard(
          'Koneksi Internet Stabil',
          'Koneksi high-speed dengan backup connection',
          Icons.wifi,
          Colors.green,
        ),
        const SizedBox(height: 12),
        _buildFacilityCard(
          'Server untuk Testing',
          'Server dedicated untuk pengembangan dan testing',
          Icons.storage,
          Colors.orange,
        ),
        const SizedBox(height: 12),
        _buildFacilityCard(
          'Workstation Profesional',
          'PC/Laptop dengan spesifikasi tinggi untuk tim',
          Icons.computer,
          Colors.purple,
        ),
      ],
    );
  }

  Widget _buildFacilityCard(
    String title,
    String description,
    IconData icon,
    Color color,
  ) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: color.withAlpha(100),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(icon, size: 32, color: color),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue[800],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                      height: 1.4,
                    ),
                  ),
                ],
              ),
            ),
          ],
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
          'Komunitas Developer Indonesia',
          textAlign: centerText ? TextAlign.center : TextAlign.left,
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.blue[800],
            height: 1.3,
          ),
        ),
        const SizedBox(height: 16),
        if (!centerText)
          Container(
            height: 4,
            width: 80,
            color: Colors.blue[800],
            margin: const EdgeInsets.only(bottom: 20),
          ),
        Text(
          'Bergabunglah bersama komunitas pengembang dari seluruh Indonesia untuk belajar, berkolaborasi, dan membangun proyek open source yang berdampak.',
          textAlign: centerText ? TextAlign.center : TextAlign.left,
          style: TextStyle(fontSize: 16, color: Colors.grey[700], height: 1.6),
        ),
        const SizedBox(height: 32),

        // Tech Toggle Button
        GestureDetector(
          onTap: () => setState(() => _showTech = !_showTech),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.blue[800]?.withAlpha(25),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.blue[800]!.withAlpha(50)),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  _showTech ? Icons.visibility_off : Icons.visibility,
                  color: Colors.blue[800],
                  size: 20,
                ),
                const SizedBox(width: 8),
                Text(
                  _showTech ? 'Sembunyikan Teknologi' : 'Lihat Teknologi Kami',
                  style: TextStyle(
                    color: Colors.blue[800],
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),

        // Technology Grid (Conditional)
        if (_showTech) ...[
          const SizedBox(height: 24),
          _buildTechGrid(centerText: centerText),
        ],

        const SizedBox(height: 32),
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

  Widget _buildTechGrid({bool centerText = false}) {
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

    return Column(
      children:
          techItems.map((category) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 24),
              child: Column(
                crossAxisAlignment:
                    centerText
                        ? CrossAxisAlignment.center
                        : CrossAxisAlignment.start,
                children: [
                  Text(
                    category.category,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.blue[800],
                    ),
                  ),
                  const SizedBox(height: 12),
                  Wrap(
                    spacing: 12,
                    runSpacing: 12,
                    alignment:
                        centerText ? WrapAlignment.center : WrapAlignment.start,
                    children:
                        category.items.map((tech) {
                          return Column(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: tech.color.withAlpha(25),
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(
                                    color: tech.color.withAlpha(50),
                                  ),
                                ),
                                child: Icon(
                                  tech.icon,
                                  size: 28,
                                  color: tech.color,
                                ),
                              ),
                              const SizedBox(height: 6),
                              Text(
                                tech.label,
                                style: const TextStyle(fontSize: 12),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          );
                        }).toList(),
                  ),
                ],
              ),
            );
          }).toList(),
    );
  }

  Widget _buildImageSection({bool mobile = false}) {
    return Container(
      constraints: BoxConstraints(
        maxWidth: mobile ? double.infinity : 500,
        maxHeight: mobile ? 220 : 350,
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

  Widget _buildImageError() {
    return Container(
      color: Colors.grey[200],
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.people, size: 50, color: Colors.grey),
            const SizedBox(height: 8),
            Text('Gambar Komunitas', style: TextStyle(color: Colors.grey[600])),
          ],
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
        backgroundColor: Colors.blue[800],
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
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
