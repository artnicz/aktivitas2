import 'package:flutter/material.dart';
import 'page1.dart';

class praktikum1 extends StatelessWidget {
  const praktikum1({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: pendahuluan1(), // halaman pertama yang dibuka Page 1 dulu
    );
  }
}

class PetAdoptScreen extends StatelessWidget {
  const PetAdoptScreen({super.key, required this.onCategoryTap});

  final VoidCallback onCategoryTap;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        // Tambahin SingleChildScrollView biar page-nya bisa di-scroll ke bawah
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // --- 1. BANNER UTAMA ---
                Container(
                  height: 180,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    image: const DecorationImage(
                      image: NetworkImage(
                        'https://images.unsplash.com/photo-1543466835-00a7907e9de1?q=80&w=600&auto=format&fit=crop',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black.withOpacity(0.6),
                        ],
                      ),
                    ),
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'PetAdopt:',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Find your new friend',
                          style: TextStyle(color: Colors.white70, fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 24),

                // --- 2. MENU KATEGORI HEWAN ---
                // Expanded dihapus, diganti shrinkWrap dan physics agar tidak error saat di dalam SingleChildScrollView
                GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 1.1,
                  children: [
                    _buildMenuCard(
                      icon: Icons.pets,
                      label: 'Kucing',
                      onTap: onCategoryTap,
                    ),
                    _buildMenuCard(
                      icon: Icons.pets,
                      label: 'Anjing',
                      onTap: () {},
                    ),
                    _buildMenuCard(
                      icon: Icons.cruelty_free,
                      label: 'Kelinci',
                      onTap: () {},
                    ),
                    _buildMenuCard(
                      icon: Icons.flutter_dash,
                      label: 'Burung',
                      onTap: () {},
                    ),
                  ],
                ),

                const SizedBox(height: 24),

                // --- 3. TAMBAHAN LIST HEWAN ADOPSI BIKIN SCROLL PANJANG ---
                const Text(
                  'Butuh Adopsi Segera',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 12),

                // Data statis manual, khas ngerjain tugas praktikum
                _buildListHewan('Milo', 'Kucing Persia', '3 Bulan - Jantan'),
                _buildListHewan('Bobi', 'Anjing Kampung', '5 Bulan - Jantan'),
                _buildListHewan('Kitty', 'Kucing Domestik', '2 Bulan - Betina'),
                _buildListHewan('Piko', 'Burung Parkit', '1 Tahun - Jantan'),
                _buildListHewan('Jojo', 'Kelinci Anggora', '4 Bulan - Jantan'),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMenuCard({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xffe8ecf1),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: Colors.deepOrange),
            const SizedBox(height: 12),
            Text(
              label,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // --- Widget tambahan sederhana untuk list adopsi ---
  Widget _buildListHewan(String nama, String jenis, String detail) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      color: Colors.grey.shade50,
      elevation: 1, // Dibuat flat aja biar nggak terlalu mewah
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.blue.shade100,
          child: const Icon(Icons.pets, color: Colors.blue),
        ),
        title: Text(nama, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text('$jenis\n$detail'),
        isThreeLine: true,
        trailing: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(
              0xff1a2536,
            ), // samain sama warna navbar
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: const Text('Adopsi', style: TextStyle(color: Colors.white)),
        ),
      ),
    );
  }
}
