import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  Future<void> _launchDownload() async {
    final url = Uri.parse(
      'https://drive.google.com/file/d/1W6XuseN28ktqLNHgLVSdYod0vk2JsDN0/view?usp=drive_link',
    );
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
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
            child: Card(
              elevation: 0,
              color: Colors.grey[50],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: EdgeInsets.all(isDesktop ? 32.0 : 20.0),
                child: isDesktop ? _buildDesktopLayout() : _buildMobileLayout(),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDesktopLayout() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _buildImageSection(),
        const SizedBox(width: 40),
        Expanded(child: _buildContentSection()),
      ],
    );
  }

  Widget _buildMobileLayout() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _buildImageSection(mobile: true),
        const SizedBox(height: 24),
        Text(
          'BAKID App',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.blue[800],
            height: 1.3,
          ),
        ),
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            'Aplikasi manajemen sekolah modern yang dirancang khusus untuk mendukung kinerja guru secara efisien dan terintegrasi.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15,
              color: Colors.grey[700],
              height: 1.5,
            ),
          ),
        ),
        const SizedBox(height: 24),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
              icon: Icon(Icons.download, size: 36, color: Colors.blue[800]),
              onPressed: _launchDownload,
              tooltip: 'Download Aplikasi',
            ),
            const SizedBox(height: 8),
            Text(
              'Versi 2.4.1 • 28MB',
              style: TextStyle(fontSize: 12, color: Colors.grey[600]),
            ),
            const SizedBox(height: 4),
            Text(
              'Android 10+',
              style: TextStyle(fontSize: 11, color: Colors.grey[500]),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildContentSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Bakid App',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.blue[800],
            height: 1.3,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          'Aplikasi manajemen sekolah modern yang dirancang khusus untuk mendukung kinerja guru secara efisien dan terintegrasi.',
        ),
        const SizedBox(height: 24),
        Row(
          children: [
            IconButton(
              icon: Icon(Icons.download, size: 32, color: Colors.blue[800]),
              onPressed: _launchDownload,
              tooltip: 'Download Aplikasi',
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Versi 2.4.1 • 28MB',
                  style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                ),
                const SizedBox(height: 4),
                Text(
                  'Android 10+ / iOS 14+',
                  style: TextStyle(fontSize: 11, color: Colors.grey[500]),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildImageSection({bool mobile = false}) {
    return Container(
      constraints: BoxConstraints(
        maxWidth: mobile ? double.infinity : 400,
        maxHeight: mobile ? 220 : 500,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.asset(
          'assets/images/2.png',
          fit: BoxFit.contain,
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
            const Icon(Icons.image, size: 50, color: Colors.grey),
            const SizedBox(height: 8),
            Text(
              'Gambar Tidak Tersedia',
              style: TextStyle(color: Colors.grey[600]),
            ),
          ],
        ),
      ),
    );
  }
}
