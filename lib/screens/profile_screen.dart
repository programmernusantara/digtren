import 'package:flutter/material.dart';

class ResponsiveTeamProfile extends StatelessWidget {
  const ResponsiveTeamProfile({super.key});

  // Design Constants
  static const Color primaryColor = Color(0xFF6C63FF);
  static const Color secondaryColor = Color(0xFFF8F9FA);
  static const Color accentColor = Color(0xFF4A40CC);
  static const Color textPrimary = Color(0xFF2D3748);
  static const Color textSecondary = Color(0xFF718096);
  static const double desktopMaxWidth = 1200.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: LayoutBuilder(
        builder: (context, constraints) {
          // Responsive grid configuration
          double screenWidth = constraints.maxWidth;
          bool isMobile = screenWidth < 600;

          return SingleChildScrollView(
            padding: EdgeInsets.symmetric(
              horizontal: isMobile ? 16 : 20,
              vertical: 16,
            ),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: desktopMaxWidth),
                child: Column(
                  children: [
                    // Header Section
                    _buildHeaderSection(),
                    const SizedBox(height: 24),

                    // Team Grid - Responsive
                    _buildTeamGrid(isMobile, screenWidth),
                    const SizedBox(height: 32),

                    // About Section
                    _buildAboutSection(),
                    const SizedBox(height: 32),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildTeamGrid(bool isMobile, double screenWidth) {
    if (isMobile) {
      return Column(children: _buildTeamCards(isMobile: true));
    } else {
      int crossAxisCount = screenWidth > 900 ? 3 : 2;
      return GridView.count(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        childAspectRatio: screenWidth > 900 ? 0.9 : 1.0,
        children: _buildTeamCards(isMobile: false),
      );
    }
  }

  Widget _buildHeaderSection() {
    return Column(
      children: [
        Text(
          'Tim DigTren',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w800,
            color: textPrimary,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          height: 3,
          width: 80,
          decoration: BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
      ],
    );
  }

  List<Widget> _buildTeamCards({required bool isMobile}) {
    return [
      _buildTeamCard(
        name: "Devisi Kosong",
        role: "Chief Executive Officer",
        responsibilities: [
          "Menentukan arah, visi, dan strategi utama DigTren",
          "Mengawasi seluruh aktivitas organisasi",
          "Mengambil keputusan penting terkait pengembangan",
        ],
        isMobile: isMobile,
      ),
      _buildTeamCard(
        name: "Wildan Firmani Quraisi",
        role: "Project Manager",
        responsibilities: [
          "Mengelola seluruh aspek proyek dari perencanaan hingga eksekusi",
          "Memastikan seluruh target proyek tercapai dengan baik",
          "Memiliki keahlian lintas bidang dalam struktur tim",
        ],
        isMobile: isMobile,
      ),
      _buildTeamCard(
        name: "Devisi Kosong",
        role: "UI/UX Designer",
        responsibilities: [
          "Merancang antarmuka pengguna yang menarik dan intuitif",
          "Mendesain pengalaman pengguna yang optimal",
        ],
        tools: [
          "Adobe Illustrator",
          "Adobe Photoshop",
          "Adobe XD",
          "Blender 3D",
        ],
        isMobile: isMobile,
      ),
      _buildTeamCard(
        name: "Mahbubi Ali Gufron",
        role: "Frontend Developer",
        responsibilities: [
          "Membangun antarmuka aplikasi mobile",
          "Mengintegrasikan UI dengan sistem backend",
        ],
        tools: ["Flutter", "Rive", "Riverpod"],
        isMobile: isMobile,
      ),
      _buildTeamCard(
        name: "Devisi Kosong",
        role: "Backend Developer",
        responsibilities: [
          "Mengembangkan dan mengelola API serta infrastruktur",
          "Menjaga keandalan dan keamanan sistem",
        ],
        tools: ["Serverpod", "Supabase", "Docker", "Ubuntu Server"],
        isMobile: isMobile,
      ),
      _buildTeamCard(
        name: "Farhan",
        role: "Admin Operasional",
        responsibilities: [
          "Mendukung kelancaran operasional tim",
          "Mengelola administrasi dan komunikasi internal",
        ],
        tools: ["Office", "Google Workspace", "Discord"],
        isMobile: isMobile,
      ),
    ];
  }

  Widget _buildTeamCard({
    required String name,
    required String role,
    required List<String> responsibilities,
    List<String> tools = const [],
    required bool isMobile,
  }) {
    return Container(
      margin: EdgeInsets.only(bottom: isMobile ? 16 : 0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(50),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header with gradient
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(isMobile ? 14 : 16),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [primaryColor, accentColor],
              ),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontSize: isMobile ? 16 : 18,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  role,
                  style: TextStyle(
                    fontSize: isMobile ? 13 : 14,
                    color: Colors.white.withAlpha(500),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),

          // Content
          Padding(
            padding: EdgeInsets.all(isMobile ? 12 : 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Responsibilities
                Text(
                  'Tugas:',
                  style: TextStyle(
                    fontSize: isMobile ? 14 : 15,
                    fontWeight: FontWeight.w600,
                    color: textPrimary,
                  ),
                ),
                const SizedBox(height: 8),
                ...responsibilities.map(
                  (item) => Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.check_circle,
                          size: isMobile ? 14 : 16,
                          color: primaryColor,
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            item,
                            style: TextStyle(
                              fontSize: isMobile ? 13 : 14,
                              color: textSecondary,
                              height: 1.4,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // Tools
                if (tools.isNotEmpty) ...[
                  SizedBox(height: isMobile ? 8 : 12),
                  Text(
                    'Tools:',
                    style: TextStyle(
                      fontSize: isMobile ? 14 : 15,
                      fontWeight: FontWeight.w600,
                      color: textPrimary,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Wrap(
                    spacing: 6,
                    runSpacing: 6,
                    children:
                        tools
                            .map(
                              (tool) => Chip(
                                label: Text(
                                  tool,
                                  style: TextStyle(
                                    fontSize: isMobile ? 11 : 12,
                                    color: primaryColor,
                                  ),
                                ),
                                backgroundColor: primaryColor.withAlpha(50),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                padding: EdgeInsets.symmetric(
                                  horizontal: isMobile ? 8 : 10,
                                  vertical: 4,
                                ),
                                side: BorderSide(
                                  color: primaryColor.withAlpha(50),
                                  width: 1,
                                ),
                              ),
                            )
                            .toList(),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAboutSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Tentang DigTren',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w700,
            color: textPrimary,
          ),
        ),
        const SizedBox(height: 8),
        Container(height: 3, width: 70, color: primaryColor),
        const SizedBox(height: 16),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: secondaryColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "DigTren (Digital Pesantren) adalah organisasi teknologi informasi berbasis pesantren yang dibentuk sebagai respons terhadap tantangan era digital. Organisasi ini bertujuan membekali para santri dengan keterampilan teknologi serta kemampuan mengelola sistem digital di lingkungan pesantren.",
                style: TextStyle(
                  fontSize: 14,
                  color: textSecondary,
                  height: 1.6,
                ),
              ),
              SizedBox(height: 12),
              Text(
                "DigTren hadir sebagai solusi dan inovasi nyata dalam mendorong kemajuan pesantren melalui pemberdayaan santri di bidang teknologi. Dengan pendekatan mandiri dan terstruktur, DigTren berkomitmen menjadikan pesantren sebagai pelopor transformasi digital.",
                style: TextStyle(
                  fontSize: 14,
                  color: textSecondary,
                  height: 1.6,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
