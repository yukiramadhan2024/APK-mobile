import 'package:flutter/material.dart';

// Konstanta warna utama tema dashboard
const MaterialColor primaryColor = Colors.red;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dashboard',
      theme: ThemeData(colorSchemeSeed: primaryColor, useMaterial3: true),
      home: const HalamanDashboard(),
    );
  }
}

class HalamanDashboard extends StatelessWidget {
  const HalamanDashboard({super.key});

  // Widget kecil untuk kotak statistik (dipakai berulang di ringkasan)
  Widget _kotakStatistik(String label, String nilai, IconData ikon) {
    return Builder(
      builder: (context) => Material(
        color: primaryColor.shade50,
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Statistik $label: $nilai'),
                duration: const Duration(seconds: 1),
                behavior: SnackBarBehavior.floating,
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 4),
            child: Column(
              children: [
                Icon(ikon, color: primaryColor),
                const SizedBox(height: 6),
                Text(
                  nilai,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                ),
                Text(
                  label,
                  style: const TextStyle(fontSize: 11, color: Colors.grey),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Widget kecil untuk menu ikon (dipakai berulang di menu utama)
  Widget _menuIkon(String label, IconData ikon) {
    return Builder(
      builder: (context) => InkWell(
        borderRadius: BorderRadius.circular(30),
        onTap: () {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Membuka menu $label'),
              duration: const Duration(seconds: 1),
              behavior: SnackBarBehavior.floating,
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: Column(
            children: [
              CircleAvatar(
                radius: 26,
                backgroundColor: primaryColor.shade100,
                child: Icon(ikon, color: primaryColor),
              ),
              const SizedBox(height: 6),
              Text(label, style: const TextStyle(fontSize: 12)),
            ],
          ),
        ),
      ),
    );
  }

  // Widget kecil untuk kartu fitur (dipakai berulang di daftar fitur)
  Widget _kartuFitur(String judul, String deskripsi, IconData ikon) {
    return Builder(
      builder: (context) => Card(
        elevation: 2,
        margin: const EdgeInsets.only(bottom: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: ListTile(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          contentPadding: const EdgeInsets.all(12),
          leading: Icon(ikon, size: 32, color: primaryColor),
          title: Text(
            judul,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(deskripsi),
          onTap: () {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Membuka fitur: $judul'),
                duration: const Duration(seconds: 1),
                behavior: SnackBarBehavior.floating,
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dashboard'), centerTitle: true),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header pengguna
            Container(
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.circular(16),
                  onTap: () {
                    ScaffoldMessenger.of(context).hideCurrentSnackBar();
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Profil pengguna: Yuki Ramadhan'),
                        duration: Duration(seconds: 1),
                        behavior: SnackBarBehavior.floating,
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: const [
                        CircleAvatar(
                          radius: 28,
                          backgroundColor: Colors.white,
                          child: Icon(
                            Icons.person,
                            color: primaryColor,
                            size: 32,
                          ),
                        ),
                        SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Selamat datang,',
                                style: TextStyle(color: Colors.white70),
                              ),
                              Text(
                                'Yuki Ramadhan',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Ringkasan statistik (4 kotak statistik menggunakan Expanded)
            Row(
              children: [
                Expanded(
                  child: _kotakStatistik('Tugas', '12', Icons.assignment),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _kotakStatistik('Selesai', '9', Icons.check_circle),
                ),
                const SizedBox(width: 12),
                Expanded(child: _kotakStatistik('IPK', '3.70', Icons.star)),
                const SizedBox(width: 12),
                Expanded(
                  child: _kotakStatistik('Poin', '85', Icons.emoji_events),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Menu utama
            const Text(
              'Menu Utama',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _menuIkon('Jadwal', Icons.calendar_today),
                _menuIkon('Nilai', Icons.grade),
                _menuIkon('Absensi', Icons.fact_check),
                _menuIkon('Profil', Icons.person),
              ],
            ),
            const SizedBox(height: 24),

            // Fitur unggulan (minimal 5 kartu)
            const Text(
              'Fitur Unggulan',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            _kartuFitur(
              'Pengumuman Kampus',
              'Lihat pengumuman terbaru dari kampus',
              Icons.campaign,
            ),
            _kartuFitur(
              'Perpustakaan Digital',
              'Akses koleksi buku dan jurnal daring',
              Icons.menu_book,
            ),
            _kartuFitur(
              'Bimbingan Akademik',
              'Jadwalkan konsultasi dengan dosen wali',
              Icons.support_agent,
            ),
            _kartuFitur(
              'Jadwal Kuliah Hari Ini',
              'Cek waktu kuliah dan ruang kelas Anda',
              Icons.schedule,
            ),
            _kartuFitur(
              'Info Beasiswa',
              'Daftar beasiswa dan peluang bantuan pendidikan',
              Icons.school,
            ),

            // SizedBox tambahan agar konten terakhir tidak mepet bawah
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
