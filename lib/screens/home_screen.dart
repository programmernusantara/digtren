import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width >= 768;
    const Color primaryColor = Color(0xFF6C63FF); // Changed to softer purple
    const Color secondaryColor = Color(0xFFF8F9FA); // Very light gray

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.white, // Changed to pure white background
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: isDesktop ? 40 : 20,
              vertical: isDesktop ? 30 : 20,
            ),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1200),
                child: Column(
                  children: [
                    // Header Section
                    _buildHeaderSection(isDesktop, primaryColor),

                    const SizedBox(height: 40),

                    // Services Section
                    _buildSectionTitle("Our Services", context, primaryColor),
                    const SizedBox(height: 40),

                    // Services Cards
                    _buildServiceSection(
                      context,
                      title: "Website Development",
                      items: [
                        "Personal/Portfolio Websites",
                        "Institutional Websites",
                        "Business Websites",
                        "Digital Invitations",
                      ],
                      imagePath: 'assets/images/web_dev.jpeg',
                      isDesktop: isDesktop,
                      primaryColor: primaryColor,
                      cardColor: secondaryColor,
                      index: 0,
                    ),

                    const SizedBox(height: 24), // Reduced spacing

                    _buildServiceSection(
                      context,
                      title: "Graphic Design",
                      items: [
                        "Logo Design",
                        "Vector Illustrations",
                        "Banners (Digital & Print)",
                        "Poster Design",
                        "CV Design",
                      ],
                      imagePath: 'assets/images/graphic_design.jpeg',
                      isDesktop: isDesktop,
                      primaryColor: primaryColor,
                      cardColor: Colors.white,
                      index: 1,
                    ),

                    const SizedBox(height: 24), // Reduced spacing

                    _buildServiceSection(
                      context,
                      title: "Digital Animation",
                      items: [
                        "2D & 3D Animation",
                        "Educational Animation",
                        "Product Explainer Videos",
                      ],
                      imagePath: 'assets/images/animation.jpeg',
                      isDesktop: isDesktop,
                      primaryColor: primaryColor,
                      cardColor: secondaryColor,
                      index: 2,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeaderSection(bool isDesktop, Color primaryColor) {
    return Container(
      padding: EdgeInsets.all(isDesktop ? 32.0 : 20.0),
      child:
          isDesktop
              ? Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(child: _buildHeaderContent(primaryColor)),
                  const SizedBox(width: 40),
                  _buildHeaderImage(),
                ],
              )
              : Column(
                children: [
                  _buildHeaderImage(mobile: true),
                  const SizedBox(height: 20),
                  _buildHeaderContent(primaryColor),
                ],
              ),
    );
  }

  Widget _buildHeaderContent(Color primaryColor) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Digtren',
          style: TextStyle(
            fontSize: 42,
            fontWeight: FontWeight.w700,
            color: primaryColor,
            height: 1.2,
            letterSpacing: -0.5, // Tighter letter spacing
          ),
        ),
        const SizedBox(height: 16),
        Container(
          height: 2, // Thinner line
          width: 80,
          color: primaryColor.withAlpha((0.7 * 255).round()), // Fixed opacity
          margin: const EdgeInsets.only(bottom: 24),
        ),
        Text(
          'Professional digital solutions for your business needs. '
          'We specialize in creating beautiful, functional digital products.',
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey[600], // Softer text color
            height: 1.6,
          ),
        ),
      ],
    );
  }

  Widget _buildHeaderImage({bool mobile = false}) {
    return Container(
      constraints: BoxConstraints(
        maxWidth: mobile ? double.infinity : 500,
        maxHeight: mobile ? 220 : 350,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.asset(
          'assets/images/header_image.jpeg',
          fit: BoxFit.cover,
          errorBuilder:
              (context, error, stackTrace) => Container(
                color: Colors.grey[50], // Lighter fallback color
                child: Center(
                  child: Icon(
                    Icons.photo_camera,
                    size: 50,
                    color: Colors.grey[300], // Lighter icon
                  ),
                ),
              ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(
    String title,
    BuildContext context,
    Color primaryColor,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16), // Reduced padding
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w600, // Slightly lighter
              color: Colors.grey[800],
              letterSpacing: -0.5, // Tighter letter spacing
            ),
          ),
          const SizedBox(height: 8),
          Container(
            height: 2, // Thinner line
            width: 60,
            color: primaryColor.withAlpha((0.7 * 255).round()), // Fixed opacity
          ),
        ],
      ),
    );
  }

  Widget _buildServiceSection(
    BuildContext context, {
    required String title,
    required List<String> items,
    required String imagePath,
    required bool isDesktop,
    required Color primaryColor,
    required Color cardColor,
    required int index,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 24), // Reduced spacing
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(
              (0.03 * 255).round(),
            ), // Fixed opacity
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(isDesktop ? 24.0 : 16.0), // Reduced padding
        child:
            isDesktop
                ? Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (index % 2 == 0) ...[
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 24),
                          child: _buildServiceContent(
                            title,
                            items,
                            primaryColor,
                          ),
                        ),
                      ),
                      _buildServiceImage(imagePath),
                    ] else ...[
                      _buildServiceImage(imagePath),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 24),
                          child: _buildServiceContent(
                            title,
                            items,
                            primaryColor,
                          ),
                        ),
                      ),
                    ],
                  ],
                )
                : Column(
                  children: [
                    _buildServiceImage(imagePath, mobile: true),
                    const SizedBox(height: 16),
                    _buildServiceContent(title, items, primaryColor),
                  ],
                ),
      ),
    );
  }

  Widget _buildServiceContent(
    String title,
    List<String> items,
    Color primaryColor,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 20, // Slightly smaller
            fontWeight: FontWeight.w600,
            color: Colors.grey[800],
          ),
        ),
        const SizedBox(height: 12),
        Container(
          height: 1.5, // Thinner line
          width: 50, // Shorter line
          color: primaryColor.withAlpha((0.7 * 255).round()), // Fixed opacity
          margin: const EdgeInsets.only(bottom: 16),
        ),
        ...items.map(
          (item) => Padding(
            padding: const EdgeInsets.only(bottom: 8), // Reduced spacing
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.circle,
                  size: 6, // Smaller bullet
                  color: primaryColor.withAlpha(
                    (0.7 * 255).round(),
                  ), // Fixed opacity
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    item,
                    style: TextStyle(
                      fontSize: 15, // Slightly smaller
                      height: 1.5,
                      color: Colors.grey[600], // Softer text color
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildServiceImage(String imagePath, {bool mobile = false}) {
    return Container(
      constraints: BoxConstraints(
        maxWidth: mobile ? double.infinity : 400,
        maxHeight: mobile ? 180 : 250, // Slightly smaller images
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(
              (0.05 * 255).round(),
            ), // Fixed opacity
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.asset(
          imagePath,
          fit: BoxFit.cover,
          errorBuilder:
              (context, error, stackTrace) => Container(
                color: Colors.grey[50], // Lighter fallback color
                child: Center(
                  child: Icon(
                    Icons.photo_camera,
                    size: 40,
                    color: Colors.grey[300], // Lighter icon
                  ),
                ),
              ),
        ),
      ),
    );
  }
}
