import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:photo_view/photo_view.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  final PageController _pageController = PageController();
  final List<String> _appScreenshots = [
    'assets/product/poster.webp',
    'assets/product/1.webp',
    'assets/product/2.webp',
    'assets/product/3.webp',
    'assets/product/admin.webp',
  ];

  // Warna konsisten dengan home screen
  static const Color primaryColor = Color(0xFF6C63FF);
  static const Color secondaryColor = Color(0xFFF8F9FA);
  static const Color textPrimary = Color(0xFF333333);
  static const Color textSecondary = Color(0xFF666666);

  Future<void> _launchDownload() async {
    final url = Uri.parse(
      'https://drive.google.com/file/d/1Td4ocgqUJuLc0NyPqZzaT2pL_IRARfui/view?usp=sharing',
    );
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }

  void _showFullScreenImage(BuildContext context, int initialIndex) {
    final PageController fullScreenController = PageController(
      initialPage: initialIndex,
    );

    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          insetPadding: EdgeInsets.zero,
          child: Stack(
            children: [
              PageView.builder(
                controller: fullScreenController,
                itemCount: _appScreenshots.length,
                itemBuilder: (context, index) {
                  return PhotoView(
                    imageProvider: AssetImage(_appScreenshots[index]),
                    minScale: PhotoViewComputedScale.contained,
                    maxScale: PhotoViewComputedScale.covered * 2,
                    heroAttributes: PhotoViewHeroAttributes(
                      tag: 'image_$index',
                    ),
                  );
                },
              ),
              Positioned(
                top: 40,
                right: 20,
                child: IconButton(
                  icon: const Icon(Icons.close, color: Colors.white, size: 30),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ),
              if (_appScreenshots.length > 1)
                Positioned(
                  left: 20,
                  top: 0,
                  bottom: 0,
                  child: Center(
                    child: IconButton(
                      icon: const Icon(
                        Icons.chevron_left,
                        color: Colors.white,
                        size: 40,
                      ),
                      onPressed: () {
                        fullScreenController.previousPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      },
                    ),
                  ),
                ),
              if (_appScreenshots.length > 1)
                Positioned(
                  right: 20,
                  top: 0,
                  bottom: 0,
                  child: Center(
                    child: IconButton(
                      icon: const Icon(
                        Icons.chevron_right,
                        color: Colors.white,
                        size: 40,
                      ),
                      onPressed: () {
                        fullScreenController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      },
                    ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
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
                  // Main Product Card
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

                  // Additional Info Section
                  _buildSectionTitle("Fitur Unggulan", context),
                  const SizedBox(height: 24),
                  _buildFeaturesSection(isDesktop),
                  const SizedBox(height: 40),

                  // Description Section
                  _buildSectionTitle("Tentang Produk", context),
                  const SizedBox(height: 24),
                  _buildDescriptionSection(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Widget untuk judul section yang konsisten dengan home screen
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
        // App Icon and Basic Info
        Container(
          width: 200,
          padding: const EdgeInsets.only(right: 32),
          child: Column(
            children: [
              Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withAlpha(10),
                      blurRadius: 8,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    'assets/product/logo.png',
                    fit: BoxFit.contain,
                    errorBuilder:
                        (context, error, stackTrace) => _buildImageError(),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              _buildDownloadButton(),
              const SizedBox(height: 16),
              _buildInfoBadges(),
            ],
          ),
        ),

        // Main Content
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Bakid App',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                  color: textPrimary,
                  height: 1.2,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Aplikasi manajemen sekolah',
                style: TextStyle(
                  fontSize: 18,
                  color: textSecondary,
                  height: 1.4,
                ),
              ),
              const SizedBox(height: 24),

              // Screenshots Slider
              _buildScreenshotsSlider(false),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildMobileLayout() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // App Icon
        Container(
          width: 120,
          height: 120,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withAlpha(10),
                blurRadius: 8,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset(
              'assets/product/logo.png',
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) => _buildImageError(),
            ),
          ),
        ),
        const SizedBox(height: 20),

        // Title
        Text(
          'Bakid App',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w700,
            color: textPrimary,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          'Aplikasi manajemen sekolah',
          style: TextStyle(fontSize: 16, color: textSecondary),
        ),
        const SizedBox(height: 20),

        // Info Badges
        _buildInfoBadges(),
        const SizedBox(height: 20),

        // Screenshots Slider
        _buildScreenshotsSlider(true),
        const SizedBox(height: 24),

        // Download Button
        _buildDownloadButton(),
      ],
    );
  }

  Widget _buildScreenshotsSlider(bool isMobile) {
    return Column(
      children: [
        SizedBox(
          height: isMobile ? 200 : 300,
          child: PageView.builder(
            controller: _pageController,
            itemCount: _appScreenshots.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () => _showFullScreenImage(context, index),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: isMobile ? 8.0 : 16.0,
                  ),
                  child: Hero(
                    tag: 'image_$index',
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        _appScreenshots[index],
                        fit: BoxFit.cover,
                        errorBuilder:
                            (context, error, stackTrace) => _buildImageError(),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 16),
        if (_appScreenshots.length > 1)
          SmoothPageIndicator(
            controller: _pageController,
            count: _appScreenshots.length,
            effect: WormEffect(
              dotHeight: 8,
              dotWidth: 8,
              activeDotColor: primaryColor,
              dotColor: Colors.grey[300]!,
              spacing: 6,
            ),
          ),
      ],
    );
  }

  Widget _buildDownloadButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: _launchDownload,
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 14),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          elevation: 0,
        ),
        child: const Text(
          'UNDUH APLIKASI',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }

  Widget _buildInfoBadges() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildInfoBadge(Icons.download, '1.000+', 'Unduhan'),
        const SizedBox(width: 20),
        _buildInfoBadge(Icons.star, '4.8', 'Rating'),
        const SizedBox(width: 20),
        _buildInfoBadge(Icons.phone_android, '10+', 'Android'),
      ],
    );
  }

  Widget _buildInfoBadge(IconData icon, String value, String label) {
    return Column(
      children: [
        Icon(icon, size: 24, color: primaryColor),
        const SizedBox(height: 4),
        Text(
          value,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: textPrimary,
          ),
        ),
        Text(label, style: TextStyle(fontSize: 12, color: textSecondary)),
      ],
    );
  }

  Widget _buildFeaturesSection(bool isDesktop) {
    final features = [
      {
        'icon': Icons.class_,
        'title': 'Manajemen Kelas',
        'desc': 'Kelola kelas dan siswa dengan mudah',
      },
      {
        'icon': Icons.fingerprint,
        'title': 'Presensi Digital',
        'desc': 'Sistem presensi modern dengan verifikasi',
      },
      {
        'icon': Icons.assessment,
        'title': 'Penilaian Otomatis',
        'desc': 'Hitung nilai secara otomatis',
      },
      {
        'icon': Icons.calendar_today,
        'title': 'Perencanaan',
        'desc': 'Atur jadwal pembelajaran',
      },
      {
        'icon': Icons.description,
        'title': 'Laporan',
        'desc': 'Generate laporan otomatis',
      },
      {
        'icon': Icons.notifications,
        'title': 'Notifikasi',
        'desc': 'Pengingat untuk guru dan siswa',
      },
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
              ? GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 24,
                  mainAxisSpacing: 24,
                  childAspectRatio: 3,
                ),
                itemCount: features.length,
                itemBuilder:
                    (context, index) => _buildFeatureItem(features[index]),
              )
              : Column(
                children:
                    features
                        .map(
                          (feature) => Padding(
                            padding: const EdgeInsets.only(bottom: 16),
                            child: _buildFeatureItem(feature),
                          ),
                        )
                        .toList(),
              ),
    );
  }

  Widget _buildFeatureItem(Map<String, dynamic> feature) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: primaryColor.withAlpha(50),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(feature['icon'], size: 24, color: primaryColor),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                feature['title'],
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: textPrimary,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                feature['desc'],
                style: TextStyle(
                  fontSize: 14,
                  color: textSecondary,
                  height: 1.4,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDescriptionSection() {
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Pesantren Miftahul Ulum resmi meluncurkan aplikasi BAKID, sebuah platform digital yang dirancang khusus untuk memudahkan staf pengajar Madrasah Diniyah (Madin) dalam menjalankan tugas harian secara efisien. '
            'Dari pengelolaan jadwal hingga pencatatan kegiatan, semua bisa dilakukan dalam satu aplikasi yang sederhana namun efektif.\n\n'
            'Peluncuran ini menjadi langkah awal dari Digtren (Digital Pesantren)—sebuah gerakan transformasi digital untuk mewujudkan pesantren yang lebih modern dan mandiri secara teknologi. '
            'Peluncuran BAKID hanyalah langkah awal. '
            'Digtren akan terus dikembangkan menjadi ekosistem digital terpadu yang menyatukan semua lini aktivitas pesantren dalam satu sistem yang cerdas dan terintegrasi.\n\n'
            'Langkah selanjutnya adalah menghadirkan aplikasi khusus untuk wali santri—agar orang tua bisa memantau langsung aktivitas putra-putrinya di pesantren, mulai dari kehadiran, jadwal kegiatan, laporan keuangan, hingga perkembangan akademik dan pembinaan karakter.',
            style: TextStyle(fontSize: 15, color: textSecondary, height: 1.6),
          ),
        ],
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
            Icon(Icons.image, size: 40, color: Colors.grey[400]),
            const SizedBox(height: 8),
            Text(
              'Gambar Tidak Tersedia',
              style: TextStyle(color: Colors.grey[500]),
            ),
          ],
        ),
      ),
    );
  }
}
