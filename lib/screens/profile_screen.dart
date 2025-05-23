// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 600),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Foto Profil
                Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.blue, width: 3),
                    image: DecorationImage(
                      image: AssetImage('assets/images/4.jpeg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: 16),
                // Nama
                Text(
                  'Wildan FQ',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue[800],
                  ),
                ),
                SizedBox(height: 6),
                // Deskripsi Singkat
                Text(
                  'Software Engineer | Santri',
                  style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                  textAlign: TextAlign.center,
                ),
                Text(
                  '20 Tahun | Muay Thai',
                  style: TextStyle(fontSize: 13, color: Colors.grey[700]),
                ),
                SizedBox(height: 30),

                // Motivasi Hidup
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                  decoration: BoxDecoration(
                    border: Border(
                      left: BorderSide(color: Colors.blue[800]!, width: 4),
                    ),
                  ),
                  child: Text(
                    'Saya mulai mengenal komputer saat berusia 12 tahun. Berawal dari sekadar bermain game di warnet, rasa penasaran saya tumbuh: '
                    'bagaimana sebenarnya game-game ini dibuat?\n\n'
                    'Dengan keterbatasan alat dan akses internet yang hanya bisa didapat dari warnet ke warnet, saya mulai belajar C++ dan mengenal Unreal Engine. '
                    'Rasa ingin tahu itu membawa saya lebih jauh—hingga ke dunia pemrograman, pengembangan game, dan bahkan penetrasi keamanan sistem.\n\n'
                    'Perjalanan ini bukan tentang kemewahan atau fasilitas, tapi tentang kemauan belajar di tengah keterbatasan. '
                    'Saya percaya, teknologi bukan sekadar alat, tapi pintu menuju perubahan besar dalam hidup saya.',
                    style: TextStyle(
                      fontSize: 15,
                      fontStyle: FontStyle.italic,
                      color: Colors.grey[800],
                      height: 1.6,
                    ),
                  ),
                ),
                SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
