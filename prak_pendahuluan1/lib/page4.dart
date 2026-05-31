import 'package:flutter/material.dart';

class Page4 extends StatelessWidget {
  const Page4({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            // --- BACKDROP MELENGKUNG ATAS ---
            Positioned(
              top: -150,
              left: -50,
              right: -50,
              child: Container(
                height: 320,
                decoration: const BoxDecoration(
                  color: Color(0xFFEAF2FF), // Biru muda pastel sesuai gambar
                  shape: BoxShape.circle,
                ),
              ),
            ),

            // --- BACKDROP MELENGKUNG BAWAH ---
            Positioned(
              bottom: -200,
              left: -50,
              right: -50,
              child: Container(
                height: 320,
                decoration: const BoxDecoration(
                  color: Color(0xFFEAF2FF),
                  shape: BoxShape.circle,
                ),
              ),
            ),

            // --- KONTEN UTAMA ---
            Column(
              children: [
                const SizedBox(height: 40),
                const Text(
                  'Profile Wong ganteng',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontFamily: 'Serif',
                  ),
                ),
                const SizedBox(height: 25),

                // Foto Profil
                Container(
                  width: 110,
                  height: 110,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.grey.shade300, width: 2),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.person_outline,
                    size: 60,
                    color: Colors.blue,
                  ),
                ),
                const SizedBox(height: 40),

                // --- LIST DATA IDENTITAS PROFILE ---
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: ListView(
                      physics:
                          const NeverScrollableScrollPhysics(), // Agar tidak nge-scroll kaku
                      children: [
                        _buildProfileItem(
                          icon: Icons.person_pin_outlined,
                          text: 'Aniqul Ilmi',
                        ),
                        _buildProfileItem(
                          icon: Icons.phone_android,
                          text: '1462300046',
                        ),
                        _buildProfileItem(
                          icon: Icons.email_outlined,
                          text: 'aniqulilmi.mhs@gmail.com',
                        ),
                        _buildProfileItem(
                          icon: Icons.location_on_outlined,
                          text: 'Madura, Indonesia',
                        ),
                        _buildProfileItem(
                          icon: Icons.camera_alt_outlined,
                          text: 'aniqul_ilmi',
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Widget pembangun baris list item dengan border bawah sederhana ala mahasiswa
  Widget _buildProfileItem({required IconData icon, required String text}) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey.shade300, width: 1),
        ),
      ),
      padding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 8.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.blue, size: 26),
          const SizedBox(width: 24),
          Text(
            text,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
              fontFamily: 'Serif',
            ),
          ),
        ],
      ),
    );
  }
}
