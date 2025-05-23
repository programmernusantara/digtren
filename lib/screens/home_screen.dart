import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(right: 40),
            child: _buildContentSection(centerText: false),
          ),
        ),
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

  Widget _buildContentSection({required bool centerText}) {
    return Column(
      crossAxisAlignment:
          centerText ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        Text(
          'Selamat Datang di Developer Nusantara',
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
          'Platform kolaboratif bagi para developer di Indonesia untuk terhubung, berdiskusi, dan membangun proyek open-source bersama.',
          textAlign: centerText ? TextAlign.center : TextAlign.left,
          style: TextStyle(fontSize: 16, color: Colors.grey[700], height: 1.6),
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
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.asset(
          'assets/images/1.jpeg',
          fit: BoxFit.cover,
          errorBuilder:
              (context, error, stackTrace) => Container(
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
              ),
        ),
      ),
    );
  }
}
