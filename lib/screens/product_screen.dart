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
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: isDesktop ? 40 : 16,
            vertical: 20,
          ),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1200),
              child: Column(
                children: [
                  // Main App Card - No border, no shadow
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[50],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: EdgeInsets.all(isDesktop ? 24.0 : 16.0),
                    child:
                        isDesktop
                            ? _buildDesktopLayout(theme)
                            : _buildMobileLayout(theme),
                  ),
                  const SizedBox(height: 24),

                  // Additional Info Section - No border, no shadow
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: EdgeInsets.all(isDesktop ? 24.0 : 16.0),
                    child: _buildAdditionalInfoSection(isDesktop, theme),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDesktopLayout(ThemeData theme) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // App Icon and Basic Info
        Container(
          width: 180,
          padding: const EdgeInsets.only(right: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.white,
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
              const SizedBox(height: 20),
              _buildDownloadButton(theme),
              const SizedBox(height: 12),
              Text(
                'Versi 1.0.0 • 25MB',
                style: theme.textTheme.bodySmall?.copyWith(
                  color: const Color(0xFF757575), // Fixed color
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'Android 10+',
                style: theme.textTheme.bodySmall?.copyWith(
                  color: const Color(0xFF757575), // Fixed color
                ),
              ),
              const SizedBox(height: 16),
              const Divider(
                color: Color(0xFFE0E0E0), // Fixed color
                height: 1,
              ),
              const SizedBox(height: 16),
              _buildInfoBadge(Icons.people, '1.000+', 'Unduhan', theme),
              const SizedBox(height: 8),
              _buildInfoBadge(Icons.star, '4.8', 'Rating', theme),
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
                style: theme.textTheme.headlineSmall?.copyWith(
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'Aplikasi manajemen sekolah',
                style: theme.textTheme.titleMedium?.copyWith(
                  color: const Color(0xFF616161), // Fixed color
                ),
              ),
              const SizedBox(height: 16),

              // Screenshots Slider
              _buildScreenshotsSlider(false),
              const SizedBox(height: 24),

              // Description
              _buildDescriptionSection(theme),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildMobileLayout(ThemeData theme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // App Icon and Title
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.white,
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
        const SizedBox(height: 16),
        Text(
          'Bakid App',
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          'Aplikasi manajemen sekolah',
          style: theme.textTheme.bodyMedium?.copyWith(
            color: const Color(0xFF616161), // Fixed color
          ),
        ),
        const SizedBox(height: 16),

        // Rating and Downloads
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildInfoBadge(Icons.star, '4.8', 'Rating', theme),
            const SizedBox(width: 16),
            _buildInfoBadge(Icons.people, '1.000+', 'Unduhan', theme),
          ],
        ),
        const SizedBox(height: 20),

        // Screenshots Slider
        _buildScreenshotsSlider(true),
        const SizedBox(height: 24),

        // Download Button
        _buildDownloadButton(theme),
        const SizedBox(height: 12),
        Text(
          'Versi 1.0.0 • 25MB',
          style: theme.textTheme.bodySmall?.copyWith(
            color: const Color(0xFF757575), // Fixed color
          ),
        ),
        const SizedBox(height: 4),
        Text(
          'Android 10+',
          style: theme.textTheme.bodySmall?.copyWith(
            color: const Color(0xFF757575), // Fixed color
          ),
        ),
        const SizedBox(height: 24),

        // Description
        _buildDescriptionSection(theme),
      ],
    );
  }

  Widget _buildScreenshotsSlider(bool isMobile) {
    return Column(
      children: [
        SizedBox(
          height: isMobile ? 180 : 280,
          child: Stack(
            children: [
              PageView.builder(
                controller: _pageController,
                itemCount: _appScreenshots.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => _showFullScreenImage(context, index),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: isMobile ? 8.0 : 12.0,
                      ),
                      child: Hero(
                        tag: 'image_$index',
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Image.asset(
                              _appScreenshots[index],
                              fit: BoxFit.contain,
                              errorBuilder:
                                  (context, error, stackTrace) => Container(
                                    color: const Color(
                                      0xFFF5F5F5,
                                    ), // Fixed color
                                    child: Center(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.image,
                                            size: 40,
                                            color: const Color(
                                              0xFF9E9E9E,
                                            ), // Fixed color
                                          ),
                                          const SizedBox(height: 8),
                                          Text(
                                            'Screenshot ${index + 1}',
                                            style: TextStyle(
                                              color: const Color(
                                                0xFF757575,
                                              ), // Fixed color
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
              if (_appScreenshots.length > 1)
                Positioned(
                  left: 0,
                  top: 0,
                  bottom: 0,
                  child: Center(
                    child: IconButton(
                      icon: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.black.withAlpha(100),
                        ),
                        child: const Icon(
                          Icons.chevron_left,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                      onPressed: () {
                        _pageController.previousPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      },
                    ),
                  ),
                ),
              if (_appScreenshots.length > 1)
                Positioned(
                  right: 0,
                  top: 0,
                  bottom: 0,
                  child: Center(
                    child: IconButton(
                      icon: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.black.withAlpha(100),
                        ),
                        child: const Icon(
                          Icons.chevron_right,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                      onPressed: () {
                        _pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      },
                    ),
                  ),
                ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        if (_appScreenshots.length > 1)
          SmoothPageIndicator(
            controller: _pageController,
            count: _appScreenshots.length,
            effect: const WormEffect(
              dotHeight: 8,
              dotWidth: 8,
              activeDotColor: Colors.blueAccent,
              dotColor: Color(0xFFE0E0E0), // Fixed color
              spacing: 4,
            ),
          ),
      ],
    );
  }

  Widget _buildDescriptionSection(ThemeData theme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Tentang Aplikasi',
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          'Pesantren Miftahul Ulum resmi meluncurkan aplikasi BAKID, sebuah platform digital yang dirancang khusus untuk memudahkan staf pengajar Madrasah Diniyah (Madin) dalam menjalankan tugas harian secara efisien. '
          'Dari pengelolaan jadwal hingga pencatatan kegiatan, semua bisa dilakukan dalam satu aplikasi yang sederhana namun efektif.\n\n'
          'Peluncuran ini menjadi langkah awal dari Digtren (Digital Pesantren)—sebuah gerakan transformasi digital untuk mewujudkan pesantren yang lebih modern dan mandiri secara teknologi. '
          'Peluncuran BAKID hanyalah langkah awal. '
          'Digtren akan terus dikembangkan menjadi ekosistem digital terpadu yang menyatukan semua lini aktivitas pesantren dalam satu sistem yang cerdas dan terintegrasi.\n\n'
          'Langkah selanjutnya adalah menghadirkan aplikasi khusus untuk wali santri—agar orang tua bisa memantau langsung aktivitas putra-putrinya di pesantren, mulai dari kehadiran, jadwal kegiatan, laporan keuangan, hingga perkembangan akademik dan pembinaan karakter.\n\n'
          'Tak hanya itu, Digtren juga akan memperkuat sistem keamanan digital pesantren. '
          'Nantinya, setiap tamu yang datang akan melalui proses verifikasi digital yang ketat. '
          'Bahkan, akan diterapkan tes urin berkala bagi santri setelah masa liburan, dan hasilnya langsung terhubung ke sistem agar wali santri dapat mengetahui kondisi anak secara transparan.\n\n'
          'Dengan Digtren, pesantren tidak hanya adaptif terhadap zaman, tapi juga menjadi ruang yang lebih aman, bersih, dan terpercaya—tanpa meninggalkan jati diri keislaman.',
          style: theme.textTheme.bodyMedium?.copyWith(
            color: const Color(0xFF424242),
            height: 1.6,
          ),
        ),
      ],
    );
  }

  Widget _buildDownloadButton(ThemeData theme) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: _launchDownload,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blueAccent,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 14),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          elevation: 0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.download, size: 20),
            const SizedBox(width: 8),
            Text(
              'UNDUH',
              style: theme.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.bold,
                letterSpacing: 0.5,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAdditionalInfoSection(bool isDesktop, ThemeData theme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Fitur Unggulan',
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 16),
        isDesktop
            ? _buildDesktopFeaturesGrid(theme)
            : _buildMobileFeaturesList(theme),
        const SizedBox(height: 24),
        const Divider(color: Color(0xFFE0E0E0)), // Fixed color
        const SizedBox(height: 24),
        Text(
          'Informasi Tambahan',
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 16),
        _buildInfoTable(theme),
      ],
    );
  }

  Widget _buildDesktopFeaturesGrid(ThemeData theme) {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      childAspectRatio: 5,
      crossAxisSpacing: 20,
      mainAxisSpacing: 12,
      children: [
        _buildFeatureItem(theme, 'Manajemen Kelas', Icons.class_),
        _buildFeatureItem(theme, 'Presensi Digital', Icons.fingerprint),
        _buildFeatureItem(theme, 'Jurnal guru', Icons.assessment),
        _buildFeatureItem(
          theme,
          'Perencanaan Pembelajaran',
          Icons.calendar_today,
        ),
        _buildFeatureItem(theme, 'Laporan Otomatis', Icons.description),
      ],
    );
  }

  Widget _buildMobileFeaturesList(ThemeData theme) {
    return Column(
      children: [
        _buildFeatureItem(theme, 'Manajemen Kelas', Icons.class_),
        const SizedBox(height: 12),
        _buildFeatureItem(theme, 'Presensi Digital', Icons.fingerprint),
        const SizedBox(height: 12),
        _buildFeatureItem(theme, 'Penilaian Otomatis', Icons.assessment),
        const SizedBox(height: 12),
        _buildFeatureItem(theme, 'Jurnal Harian', Icons.chat),
        const SizedBox(height: 12),
        _buildFeatureItem(
          theme,
          'Perencanaan Pembelajaran',
          Icons.calendar_today,
        ),
        const SizedBox(height: 12),
        _buildFeatureItem(theme, 'Laporan Otomatis', Icons.description),
      ],
    );
  }

  Widget _buildFeatureItem(ThemeData theme, String title, IconData icon) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 20, color: Colors.blueAccent),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            title,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: const Color(0xFF424242), // Fixed color
              height: 1.4,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildInfoTable(ThemeData theme) {
    return Table(
      columnWidths: const {0: FlexColumnWidth(1.5), 1: FlexColumnWidth(3)},
      children: [
        _buildInfoRow(theme, 'Dibuat', '01 Juni 2025'),
        _buildInfoRow(theme, 'Pengembang', 'Tim Pengembang Digtren'),
        _buildInfoRow(theme, 'Ukuran', '25MB'),
        _buildInfoRow(theme, 'Kompabilitas', 'Android 10 ke atas'),
        _buildInfoRow(theme, 'Kategori', 'Pendidikan'),
      ],
    );
  }

  TableRow _buildInfoRow(ThemeData theme, String label, String value) {
    return TableRow(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Text(
            label,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: const Color(0xFF757575), // Fixed color
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Text(
            value,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: const Color(0xFF424242), // Fixed color
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildInfoBadge(
    IconData icon,
    String value,
    String label,
    ThemeData theme,
  ) {
    return Column(
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 16, color: const Color(0xFF757575)), // Fixed color
            const SizedBox(width: 4),
            Text(
              value,
              style: theme.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: const Color(0xFF424242), // Fixed color
              ),
            ),
          ],
        ),
        const SizedBox(height: 2),
        Text(
          label,
          style: theme.textTheme.bodySmall?.copyWith(
            color: const Color(0xFF757575), // Fixed color
          ),
        ),
      ],
    );
  }

  Widget _buildImageError() {
    return Container(
      color: const Color(0xFFF5F5F5), // Fixed color
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.image,
              size: 40,
              color: const Color(0xFF9E9E9E),
            ), // Fixed color
            const SizedBox(height: 8),
            Text(
              'Gambar Tidak Tersedia',
              style: TextStyle(color: const Color(0xFF757575)), // Fixed color
            ),
          ],
        ),
      ),
    );
  }
}
