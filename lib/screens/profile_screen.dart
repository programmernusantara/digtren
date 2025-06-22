import 'package:flutter/material.dart';

class TeamProfileScreen extends StatelessWidget {
  const TeamProfileScreen({super.key});

  // Warna konsisten dengan screen lainnya
  static const Color primaryColor = Color(0xFF6C63FF);
  static const Color secondaryColor = Color(0xFFF8F9FA);
  static const Color textPrimary = Color(0xFF333333);
  static const Color textSecondary = Color(0xFF666666);

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width >= 768;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: isDesktop ? 40 : 20,
          vertical: isDesktop ? 30 : 20,
        ),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1200),
            child: Column(
              children: [
                // Header Section - Konsisten dengan screen lainnya
                _buildSectionTitle("Tim Kami", context),
                const SizedBox(height: 40),

                // Team Members Grid
                if (isDesktop) ...[
                  _buildDesktopTeamGrid(),
                ] else ...[
                  _buildMobileTeamList(),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDesktopTeamGrid() {
    return Column(
      children: [
        // First row
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: _buildTeamMemberCard(
                name: "M. Kholili",
                role: "Project Manager",
                photoAsset: "assets/kholili.jpg",
                responsibilities: [
                  "Mengelola seluruh proyek dari perencanaan hingga eksekusi",
                  "Pengawasan tim dan pencapaian target",
                  "Koordinasi antar divisi",
                ],
                tools: [
                  "Google Workspace",
                  "Trello/Notion/Jira",
                  "WhatsApp/Slack",
                ],
                isDesktop: true,
              ),
            ),
            const SizedBox(width: 24),
            Expanded(
              child: _buildTeamMemberCard(
                name: "Yazid Khoiron",
                role: "UI/UX Designer",
                photoAsset: "assets/yazid.jpg",
                responsibilities: [
                  "Merancang antarmuka pengguna yang menarik",
                  "Membuat pengalaman pengguna yang intuitif",
                  "Mendesain elemen visual dan interaksi",
                ],
                tools: [
                  "Figma",
                  "Blender 3D",
                  "Adobe Illustrator/Photoshop",
                  "CorelDRAW",
                ],
                isDesktop: true,
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),
        // Second row
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: _buildTeamMemberCard(
                name: "Mahbubi Ali Gufron",
                role: "Frontend Developer",
                photoAsset: "assets/mahbubi.jpg",
                responsibilities: [
                  "Membangun tampilan aplikasi mobile",
                  "Menghubungkan UI dengan backend",
                  "Mengimplementasikan animasi dan interaksi",
                ],
                tools: ["Dart/Flutter", "Rive", "Riverpod"],
                isDesktop: true,
              ),
            ),
            const SizedBox(width: 24),
            Expanded(
              child: _buildTeamMemberCard(
                name: "Wildan Firmani Quraisi",
                role: "Backend Developer",
                photoAsset: "assets/wildan.jpg",
                responsibilities: [
                  "Membangun dan mengelola API",
                  "Mengembangkan logika bisnis",
                  "Mengelola database dan infrastruktur",
                ],
                tools: [
                  "Golang/Fiber",
                  "PostgreSQL/CockroachDB",
                  "MinIO",
                  "Elasticsearch",
                  "Docker",
                ],
                isDesktop: true,
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),
        // Third row
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: _buildTeamMemberCard(
                name: "Putra Abdillah",
                role: "IT Support",
                photoAsset: "assets/putra.jpg",
                responsibilities: [
                  "Dukungan teknis dan troubleshooting",
                  "Manajemen jaringan dan keamanan",
                  "Instalasi dan maintenance hardware",
                ],
                tools: [
                  "Ubuntu Server",
                  "Prometheus + Grafana",
                  "Mikrotik/TP-Link",
                  "Wi-Fi Mesh",
                ],
                isDesktop: true,
              ),
            ),
            const SizedBox(width: 24),
            Expanded(
              child: _buildTeamMemberCard(
                name: "Open Position",
                role: "Data Scientist/Analyst & Admin",
                photoAsset: "assets/placeholder.jpg",
                responsibilities: [
                  "Mengolah dan menganalisis data",
                  "Mendukung pengambilan keputusan",
                  "Menangani administrasi operasional",
                ],
                tools: ["Python", "Microsoft Office", "Discord Server"],
                isPlaceholder: true,
                isDesktop: true,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildMobileTeamList() {
    return Column(
      children: [
        _buildTeamMemberCard(
          name: "M. Kholili",
          role: "Project Manager",
          photoAsset: "assets/kholili.jpg",
          responsibilities: [
            "Mengelola seluruh proyek dari perencanaan hingga eksekusi",
            "Pengawasan tim dan pencapaian target",
            "Koordinasi antar divisi",
          ],
          tools: ["Google Workspace", "Trello/Notion/Jira", "WhatsApp/Slack"],
          isDesktop: false,
        ),
        const SizedBox(height: 20),
        _buildTeamMemberCard(
          name: "Yazid Khoiron",
          role: "UI/UX Designer",
          photoAsset: "assets/yazid.jpg",
          responsibilities: [
            "Merancang antarmuka pengguna yang menarik",
            "Membuat pengalaman pengguna yang intuitif",
            "Mendesain elemen visual dan interaksi",
          ],
          tools: [
            "Figma",
            "Blender 3D",
            "Adobe Illustrator/Photoshop",
            "CorelDRAW",
          ],
          isDesktop: false,
        ),
        const SizedBox(height: 20),
        _buildTeamMemberCard(
          name: "Mahbubi Ali Gufron",
          role: "Frontend Developer",
          photoAsset: "assets/mahbubi.jpg",
          responsibilities: [
            "Membangun tampilan aplikasi mobile",
            "Menghubungkan UI dengan backend",
            "Mengimplementasikan animasi dan interaksi",
          ],
          tools: ["Dart/Flutter", "Rive", "Riverpod"],
          isDesktop: false,
        ),
        const SizedBox(height: 20),
        _buildTeamMemberCard(
          name: "Wildan Firmani Quraisi",
          role: "Backend Developer",
          photoAsset: "assets/wildan.jpg",
          responsibilities: [
            "Membangun dan mengelola API",
            "Mengembangkan logika bisnis",
            "Mengelola database dan infrastruktur",
          ],
          tools: [
            "Golang/Fiber",
            "PostgreSQL/CockroachDB",
            "MinIO",
            "Elasticsearch",
            "Docker",
          ],
          isDesktop: false,
        ),
        const SizedBox(height: 20),
        _buildTeamMemberCard(
          name: "Putra Abdillah",
          role: "IT Support",
          photoAsset: "assets/putra.jpg",
          responsibilities: [
            "Dukungan teknis dan troubleshooting",
            "Manajemen jaringan dan keamanan",
            "Instalasi dan maintenance hardware",
          ],
          tools: [
            "Ubuntu Server",
            "Prometheus + Grafana",
            "Mikrotik/TP-Link",
            "Wi-Fi Mesh",
          ],
          isDesktop: false,
        ),
        const SizedBox(height: 20),
        _buildTeamMemberCard(
          name: "Open Position",
          role: "Data Scientist/Analyst & Admin",
          photoAsset: "assets/placeholder.jpg",
          responsibilities: [
            "Mengolah dan menganalisis data",
            "Mendukung pengambilan keputusan",
            "Menangani administrasi operasional",
          ],
          tools: ["Python", "Microsoft Office", "Discord Server"],
          isPlaceholder: true,
          isDesktop: false,
        ),
      ],
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

  Widget _buildTeamMemberCard({
    required String name,
    required String role,
    required String photoAsset,
    required List<String> responsibilities,
    required List<String> tools,
    bool isPlaceholder = false,
    required bool isDesktop,
  }) {
    return Container(
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
      padding: EdgeInsets.all(isDesktop ? 24 : 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile Photo
              Container(
                width: isDesktop ? 100 : 80,
                height: isDesktop ? 100 : 80,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey[200],
                  image: DecorationImage(
                    image: AssetImage(photoAsset),
                    fit: BoxFit.cover,
                  ),
                  border: Border.all(
                    color: isPlaceholder ? Colors.grey[400]! : primaryColor,
                    width: 2,
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                        fontSize: isDesktop ? 22 : 18,
                        fontWeight: FontWeight.w700,
                        color: textPrimary,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      role,
                      style: TextStyle(
                        fontSize: isDesktop ? 16 : 14,
                        color: primaryColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          // Responsibilities Section
          Text(
            "Tanggung Jawab:",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: isDesktop ? 18 : 16,
              color: textPrimary,
            ),
          ),
          const SizedBox(height: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:
                responsibilities.map((item) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(Icons.circle, size: 6, color: primaryColor),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            item,
                            style: TextStyle(
                              fontSize: isDesktop ? 15 : 14,
                              color: textSecondary,
                              height: 1.5,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
          ),
          const SizedBox(height: 20),
          // Tools Section
          Text(
            "Alat & Teknologi:",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: isDesktop ? 18 : 16,
              color: textPrimary,
            ),
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children:
                tools.map((tool) {
                  return Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: isDesktop ? 12 : 10,
                      vertical: isDesktop ? 6 : 4,
                    ),
                    decoration: BoxDecoration(
                      color: primaryColor.withAlpha(25),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: primaryColor.withAlpha(50)),
                    ),
                    child: Text(
                      tool,
                      style: TextStyle(
                        fontSize: isDesktop ? 14 : 12,
                        color: primaryColor,
                      ),
                    ),
                  );
                }).toList(),
          ),
        ],
      ),
    );
  }
}
