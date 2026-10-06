import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Halaman Profil Mahasiswa',
      theme: ThemeData(
        // Tema warna kustom
        colorSchemeSeed: Colors.teal,
        useMaterial3: true,
      ),
      home: const HalamanProfil(),
    );
  }
}

class HalamanProfil extends StatelessWidget {
  const HalamanProfil({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil Mahasiswa'),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      // Mencegah error overflow pada layar kecil
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Widget Icon sebagai foto profil
                const Icon(
                  Icons.account_circle,
                  size: 130,
                  color: Colors.teal,
                ),
                const SizedBox(height: 16),

                // Data Diri: Nama Mahasiswa
                const Text(
                  'Yuki Ramadhan',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 6),

                // Data Diri: NIM
                const Text(
                  'NIM: 24051130053',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 4),

                // Data Diri: Program Studi
                const Text(
                  'Teknologi Informasi - Universitas Negeri Yogyakarta',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),

                // Deskripsi Singkat
                const Text(
                  'Mahasiswa semester 5 yang fokus mempelajari rekayasa perangkat lunak, arsitektur sistem, dan mobile app development dengan Flutter.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14, height: 1.4),
                ),
                const SizedBox(height: 12),

                // Widget Text tambahan: Minat & Hobi
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.teal.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Text(
                    'Minat & Hobi: Software Engineering, Videography, & UI Design',
                    style: TextStyle(
                      fontSize: 13,
                      fontStyle: FontStyle.italic,
                      color: Colors.teal,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 24),

                // Tombol Aksi 1: Hubungi Saya
                ElevatedButton.icon(
                  onPressed: () {
                    print('[LOG EVENT]: Tombol Hubungi Saya berhasil ditekan oleh pengguna.');
                  },
                  icon: const Icon(Icons.email),
                  label: const Text('Hubungi Saya'),
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(200, 45),
                  ),
                ),
                const SizedBox(height: 10),

                // Tombol Aksi 2: Tombol tambahan dengan log konsol berbeda
                OutlinedButton.icon(
                  onPressed: () {
                    print('[LOG EVENT]: Tombol Lihat Portofolio / GitHub dibuka.');
                  },
                  icon: const Icon(Icons.code),
                  label: const Text('Lihat Portofolio Proyek'),
                  style: OutlinedButton.styleFrom(
                    minimumSize: const Size(200, 45),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}