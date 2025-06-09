import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 600),
              child: Column(
                children: [
                  // Foto Profil
                  CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage('assets/images/4.webp'),
                  ),
                  SizedBox(height: 16),

                  // Nama
                  Text(
                    'Wildan FQ',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),

                  SizedBox(height: 6),

                  // Deskripsi Singkat
                  Text(
                    'Software Engineer · Santri\n20 Tahun · Muay Thai',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                      height: 1.4,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  SizedBox(height: 30),

                  // Motivasi Hidup
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      'Saya mulai mengenal komputer pada usia 12 tahun. Awalnya, saya hanya bermain game di warnet, namun rasa penasaran saya tumbuh: bagaimana game-game ini dibuat?\n\n'
                      'Dengan keterbatasan alat dan akses internet yang hanya bisa didapatkan dari warnet ke warnet, saya mulai belajar C++ dan mengenal Unreal Engine. '
                      'Rasa ingin tahu tersebut membawa saya semakin dalam—hingga memasuki dunia pemrograman, pengembangan game, dan penetrasi keamanan sistem.',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey[800],
                        height: 1.6,
                      ),
                    ),
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
