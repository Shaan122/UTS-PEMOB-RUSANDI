import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BUKU PENDIDIKAN DASAR',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    TabelWisataScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Buku',
          ),
        ],
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue, // Warna AppBar
        title: const Text('Selamat Datang'),
        centerTitle: true,
      ),
      body: Center(
        child: const Text(
          'Aplikasi Buku Pendidikan Dasar',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

class TabelWisataScreen extends StatelessWidget {
  TabelWisataScreen({super.key});

  final List<Map<String, String>> wisataData = [
    {
      "gambar": "assets/images/cover.png",
      "nama": "SENI BUDAYA",
      "kelas": "KELAS 1",
      "deskripsi": "Buku Seni Budaya Dasar untuk kelas 1 SD/MI dirancang untuk memperkenalkan siswa pada dunia seni dan budaya sejak dini. Buku ini memberikan pengetahuan dan keterampilan dasar yang berkaitan dengan berbagai aspek seni dan budaya, serta mendukung perkembangan kreativitas dan apresiasi seni anak-anak. Pada tingkat kelas 1, buku ini fokus pada pengenalan seni yang sederhana, dengan cara yang menyenangkan dan mudah dipahami."
    },
    {
      "gambar": "assets/images/cover2.png",
      "nama": "PAI",
      "kelas": "KELAS 2",
      "deskripsi": "Buku Pendidikan Agama Islam (PAI) untuk kelas dasar dirancang khusus untuk membantu anak-anak memahami konsep dasar agama Islam. Materi dalam buku ini tidak hanya fokus pada pengetahuan agama, tetapi juga pada pengembangan karakter siswa melalui pendekatan yang interaktif dan menyenangkan."
    },
    {
      "gambar": "assets/images/cover3.png",
      "nama": "PJOK",
      "kelas": "KELAS 3",
      "deskripsi": "Buku Pendidikan Jasmani, Olahraga, dan Kesehatan (PJOK) untuk kelas 3 SD/MI adalah bagian dari kurikulum pendidikan dasar yang dirancang untuk membantu siswa mengembangkan kemampuan fisik, kebugaran, dan pemahaman tentang pentingnya hidup sehat. Buku ini memadukan teori dan praktik, sehingga siswa tidak hanya memahami konsep tetapi juga mempraktikkannya dalam kegiatan sehari-hari."
    },
    {
      "gambar": "assets/images/cover4.png",
      "nama": "PPKN",
      "kelas": "KELAS 1",
      "deskripsi": "Buku Pendidikan Pancasila dan Kewarganegaraan (PPKn) kelas 4 SD/MI dirancang untuk memperkenalkan dan menanamkan nilai-nilai luhur Pancasila, kepribadian bangsa, serta wawasan kebangsaan kepada siswa sekolah dasar. Buku ini membantu siswa memahami hak, kewajiban, serta tanggung jawab mereka sebagai warga negara Indonesia."
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue, // Warna AppBar
        title: const Text('Daftar buku pendidikan dasar'),
        centerTitle: true,
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 0.75,
        ),
        itemCount: wisataData.length,
        itemBuilder: (context, index) {
          final wisata = wisataData[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailBukuScreen(wisata: wisata),
                ),
              );
            },
            child: Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Image.asset(
                      wisata['gambar']!,
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          wisata['nama']!,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          wisata['kelas']!,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class DetailBukuScreen extends StatelessWidget {
  final Map<String, String> wisata;

  const DetailBukuScreen({super.key, required this.wisata});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue, // Warna AppBar
        title: Text(wisata['nama']!),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              wisata['gambar']!,
              fit: BoxFit.cover,
              width: double.infinity,
              height: 200,
            ),
            const SizedBox(height: 16),
            Text(
              wisata['nama']!,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "Kelas: ${wisata['kelas']!}",
              style: const TextStyle(fontSize: 18, color: Colors.grey),
            ),
            const SizedBox(height: 16),
            Text(
              wisata['deskripsi']!,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
