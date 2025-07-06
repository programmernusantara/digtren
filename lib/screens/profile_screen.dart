import 'package:flutter/material.dart';

class TeamProfileScreen extends StatelessWidget {
  const TeamProfileScreen({super.key});

  // Design Constants
  static const Color primaryColor = Color(0xFF6C63FF);
  static const Color secondaryColor = Color(0xFFF8F9FA);
  static const Color textPrimary = Color(0xFF333333);
  static const Color textSecondary = Color(0xFF666666);
  static const double desktopMaxWidth = 1200.0;
  static const double cardBorderRadius = 12.0; // Reduced border radius
  static const double sectionSpacing = 40.0;
  static const double desktopPadding = 40.0;
  static const double mobilePadding = 20.0;
  static const double tabletBreakpoint = 768.0;
  static const double largeDesktopBreakpoint = 1024.0;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < tabletBreakpoint;
    final isTablet =
        screenWidth >= tabletBreakpoint && screenWidth < largeDesktopBreakpoint;
    final isDesktop = screenWidth >= largeDesktopBreakpoint;

    final double horizontalPadding =
        isMobile
            ? mobilePadding
            : isTablet
            ? mobilePadding * 1.5
            : desktopPadding;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding,
            vertical: isMobile ? 20.0 : 30.0,
          ),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: desktopMaxWidth),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Team Section
                  _buildTeamSection(isMobile, isTablet, isDesktop),
                  SizedBox(
                    height: isMobile ? sectionSpacing * 0.7 : sectionSpacing,
                  ),

                  // Combined About & Closing Section
                  _buildAboutAndClosingSection(isMobile, isTablet, isDesktop),
                  SizedBox(height: isMobile ? 20.0 : 40.0),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTeamSection(bool isMobile, bool isTablet, bool isDesktop) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Struktur Tim DigTren',
          style: TextStyle(
            fontSize:
                isDesktop
                    ? 32.0
                    : isTablet
                    ? 28.0
                    : 24.0,
            fontWeight: FontWeight.w700,
            color: textPrimary,
          ),
        ),
        const SizedBox(height: 8.0),
        Container(height: 4.0, width: 80.0, color: primaryColor),
        const SizedBox(height: 24.0),
        _buildResponsiveTeamGrid(isMobile, isTablet, isDesktop),
      ],
    );
  }

  Widget _buildResponsiveTeamGrid(
    bool isMobile,
    bool isTablet,
    bool isDesktop,
  ) {
    if (isMobile) {
      return Column(children: _buildTeamMembers(isMobile, isTablet, isDesktop));
    } else if (isTablet) {
      return GridView.count(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        crossAxisCount: 2,
        crossAxisSpacing: 20.0,
        mainAxisSpacing: 20.0,
        childAspectRatio: 1.4,
        children: _buildTeamMembers(isMobile, isTablet, isDesktop),
      );
    } else {
      return GridView.count(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        crossAxisCount: 2,
        crossAxisSpacing: 24.0,
        mainAxisSpacing: 24.0,
        childAspectRatio: 1.3,
        children: _buildTeamMembers(isMobile, isTablet, isDesktop),
      );
    }
  }

  List<Widget> _buildTeamMembers(bool isMobile, bool isTablet, bool isDesktop) {
    return [
      _buildTeamMemberCard(
        name: "M. Kholili",
        role: "Chief Executive Officer (CEO)",
        photoAsset: "assets/kholili.jpg",
        responsibilities: [
          "Menentukan arah, visi, dan strategi utama DigTren",
          "Mengawasi seluruh kegiatan organisasi",
          "Mengambil keputusan penting terkait pengembangan dan ekspansi tim",
        ],
        tools: [],
        isMobile: isMobile,
        isTablet: isTablet,
        isDesktop: isDesktop,
      ),
      _buildTeamMemberCard(
        name: "Wildan Firmani Quraisi",
        role: "Project Manager",
        photoAsset: "assets/wildan.jpg",
        responsibilities: [
          "Mengelola seluruh aspek proyek dari perencanaan hingga eksekusi",
          "Memastikan seluruh target proyek tercapai dengan baik",
          "Memiliki keahlian lintas bidang dalam struktur tim",
        ],
        tools: [],
        isMobile: isMobile,
        isTablet: isTablet,
        isDesktop: isDesktop,
      ),
      _buildTeamMemberCard(
        name: "Yazid Khoiron",
        role: "UI/UX Designer",
        photoAsset: "assets/yazid.jpg",
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
        isTablet: isTablet,
        isDesktop: isDesktop,
      ),
      _buildTeamMemberCard(
        name: "Mahbubi Ali Gufron",
        role: "Frontend Developer",
        photoAsset: "assets/mahbubi.jpg",
        responsibilities: [
          "Membangun antarmuka aplikasi mobile",
          "Mengintegrasikan UI dengan sistem backend",
        ],
        tools: ["Dart/Flutter", "Rive", "Riverpod"],
        isMobile: isMobile,
        isTablet: isTablet,
        isDesktop: isDesktop,
      ),
      _buildTeamMemberCard(
        name: "Fahrur Rozi",
        role: "Backend Developer",
        photoAsset: "assets/putra.jpg",
        responsibilities: [
          "Mengembangkan dan mengelola API serta infrastruktur",
          "Menjaga keandalan dan keamanan sistem",
        ],
        tools: ["Dart/Serverpod", "Supabase", "Docker", "Ubuntu Server"],
        isMobile: isMobile,
        isTablet: isTablet,
        isDesktop: isDesktop,
      ),
      _buildTeamMemberCard(
        name: "Muhammad Farhan Ardiansyah",
        role: "Admin Operasional",
        photoAsset: "assets/placeholder.jpg",
        responsibilities: [
          "Mendukung kelancaran operasional tim",
          "Mengelola administrasi dan komunikasi internal",
        ],
        tools: ["Microsoft Office", "Google Workspace", "Discord"],
        isMobile: isMobile,
        isTablet: isTablet,
        isDesktop: isDesktop,
      ),
    ];
  }

  Widget _buildTeamMemberCard({
    required String name,
    required String role,
    required String photoAsset,
    required List<String> responsibilities,
    required List<String> tools,
    bool isMobile = false,
    bool isTablet = false,
    bool isDesktop = false,
  }) {
    final double cardPadding =
        isMobile
            ? 16.0
            : isTablet
            ? 20.0
            : 24.0;
    final double profileImageSize =
        isMobile
            ? 64.0
            : isTablet
            ? 72.0
            : 80.0;
    final double nameFontSize =
        isMobile
            ? 18.0
            : isTablet
            ? 20.0
            : 22.0;
    final double roleFontSize =
        isMobile
            ? 13.0
            : isTablet
            ? 14.0
            : 15.0;
    final double contentFontSize =
        isMobile
            ? 13.0
            : isTablet
            ? 14.0
            : 15.0;
    final double sectionTitleFontSize =
        isMobile
            ? 15.0
            : isTablet
            ? 16.0
            : 17.0;

    return Container(
      margin: EdgeInsets.only(bottom: isMobile ? 20.0 : 0.0),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.circular(cardBorderRadius),
        // Removed shadow as requested
      ),
      padding: EdgeInsets.all(cardPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Profile Header
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile Image
              Container(
                width: profileImageSize,
                height: profileImageSize,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey[200],
                  image: const DecorationImage(
                    image: AssetImage("assets/placeholder.jpg"),
                    fit: BoxFit.cover,
                  ),
                  border: Border.all(
                    color: primaryColor.withAlpha(50),
                    width: 1.0, // Reduced border width
                  ),
                ),
              ),
              const SizedBox(width: 16.0),
              // Name and Role
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                        fontSize: nameFontSize,
                        fontWeight: FontWeight.w700,
                        color: textPrimary,
                      ),
                    ),
                    const SizedBox(height: 4.0),
                    Text(
                      role,
                      style: TextStyle(
                        fontSize: roleFontSize,
                        color: primaryColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20.0),

          // Responsibilities
          Text(
            "Tugas:",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: sectionTitleFontSize,
              color: textPrimary,
            ),
          ),
          const SizedBox(height: 8.0),
          ...responsibilities.map(
            (item) => Padding(
              padding: const EdgeInsets.only(bottom: 6.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.circle,
                    size: 6.0,
                    color: primaryColor,
                  ), // Smaller bullet point
                  const SizedBox(width: 8.0),
                  Expanded(
                    child: Text(
                      item,
                      style: TextStyle(
                        fontSize: contentFontSize,
                        color: textSecondary,
                        height: 1.4,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Tools (if any)
          if (tools.isNotEmpty) ...[
            const SizedBox(height: 16.0),
            Text(
              "Tools & Teknologi:",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: sectionTitleFontSize,
                color: textPrimary,
              ),
            ),
            const SizedBox(height: 8.0),
            Wrap(
              spacing: 8.0,
              runSpacing: 8.0,
              children:
                  tools
                      .map(
                        (tool) => Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: isMobile ? 10.0 : 12.0,
                            vertical: isMobile ? 5.0 : 6.0,
                          ),
                          decoration: BoxDecoration(
                            color: primaryColor.withAlpha(
                              20,
                            ), // Lighter background
                            borderRadius: BorderRadius.circular(
                              6.0,
                            ), // Smaller radius
                            border: Border.all(
                              color: primaryColor.withAlpha(50),
                              width: 0.5, // Thinner border
                            ),
                          ),
                          child: Text(
                            tool,
                            style: TextStyle(
                              fontSize: isMobile ? 12.0 : 13.0,
                              color: primaryColor,
                            ),
                          ),
                        ),
                      )
                      .toList(),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildAboutAndClosingSection(
    bool isMobile,
    bool isTablet,
    bool isDesktop,
  ) {
    final double titleFontSize =
        isDesktop
            ? 32.0
            : isTablet
            ? 28.0
            : 24.0;
    final double contentFontSize =
        isDesktop
            ? 16.0
            : isTablet
            ? 15.0
            : 14.0;
    final double sectionPadding =
        isMobile
            ? 16.0
            : isTablet
            ? 20.0
            : 24.0;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Text(
            'Tentang DigTren',
            style: TextStyle(
              fontSize: titleFontSize,
              fontWeight: FontWeight.w700,
              color: textPrimary,
            ),
          ),
        ),
        const SizedBox(height: 8.0),
        Center(child: Container(height: 4.0, width: 80.0, color: primaryColor)),
        const SizedBox(height: 24.0),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: secondaryColor,
            borderRadius: BorderRadius.circular(cardBorderRadius),
          ),
          padding: EdgeInsets.all(sectionPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "DigTren (Digital Pesantren) adalah organisasi teknologi informasi berbasis pesantren yang dibentuk sebagai respons terhadap tantangan era digital. Organisasi ini bertujuan membekali para santri dengan keterampilan teknologi serta kemampuan mengelola sistem digital di lingkungan pesantren.",
                style: TextStyle(
                  fontSize: contentFontSize,
                  color: textSecondary,
                  height: 1.6,
                ),
              ),
              const SizedBox(height: 20.0),

              Text(
                "DigTren hadir sebagai solusi dan inovasi nyata dalam mendorong kemajuan pesantren melalui pemberdayaan santri di bidang teknologi. Dengan pendekatan mandiri dan terstruktur, DigTren berkomitmen menjadikan pesantren sebagai pelopor transformasi digital—bukan hanya sebagai pusat pendidikan agama, tetapi juga sebagai motor kemajuan teknologi.",
                style: TextStyle(
                  fontSize: contentFontSize,
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
