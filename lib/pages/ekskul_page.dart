import 'package:flutter/material.dart';
import '../widgets/common_header.dart';
import '../widgets/common_navbar.dart';
import './detail_ekskul.dart'; // Import file detail ekskul

// Main Ekskul Page
class EkskulPage extends StatelessWidget {
  const EkskulPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF435059),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            // Common Header
            const CommonHeader(),
            
            // Header Section with Ekstrakurikuler text
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      'Ekstrakurikuler',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            
            // Search Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Cari Ekstrakurikuler...',
                    hintStyle: TextStyle(color: Colors.grey[400], fontSize: 16),
                    prefixIcon: const Icon(Icons.search, color: Colors.grey),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(vertical: 15),
                  ),
                ),
              ),
            ),
            
            // Main content - Ekskul List
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Title for active extracurriculars
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          'Ekstrakurikuler aktif',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      
                      // Scrollable list of extracurriculars
                      Expanded(
                        child: ListView(
                          children: [
                            _buildEkskulItem(
                              context,
                              'Pramuka INTI',
                              '65 anggota • Sen - sabtu',
                              Icons.flare,
                              'Pramuka',
                              'assets/logo/images/Pramuka.png',
                            ),
                            _buildEkskulItem(
                              context,
                              'Banggar Sastra Dan Jurnalistik',
                              '40 anggota • Kam & Sab',
                              Icons.book,
                              'Jurnalistik',
                              null,
                            ),
                            _buildEkskulItem(
                              context,
                              'Sepak Bola',
                              '80 anggota • Kam',
                              Icons.sports_soccer,
                              'Sepak Bola',
                              'assets/logo/images/SepakBola1.png',
                            ),
                            _buildEkskulItem(
                              context,
                              'Basket',
                              '50 anggota • Sel',
                              Icons.sports_basketball,
                              'Basket',
                              'assets/logo/images/Basket.png',
                            ),
                            _buildEkskulItem(
                              context,
                              'Voli',
                              '40 anggota • Sel',
                              Icons.sports_volleyball,
                              'Voli',
                              'assets/logo/images/BolaVoli.png',
                            ),
                            _buildEkskulItem(
                              context,
                              'Desain Grafis',
                              '25 anggota • Jum',
                              Icons.palette,
                              'Desain Grafis',
                              null,
                            ),
                            _buildEkskulItem(
                              context,
                              'Karate',
                              '30 anggota • Rab',
                              Icons.sports_martial_arts,
                              'Karate',
                              null,
                            ),
                            _buildEkskulItem(
                              context,
                              'Palang Merah Remaja',
                              '37 anggota • Sen - Jum',
                              Icons.medical_services,
                              'PMR',
                              null,
                            ),
                            _buildEkskulItem(
                              context,
                              'Al - Banjari',
                              '25 anggota • Kam',
                              Icons.music_note,
                              'Al-Banjari',
                              null,
                            ),
                            _buildEkskulItem(
                              context,
                              'Tari',
                              '35 anggota • Rab',
                              Icons.attractions,
                              'Tari',
                              null,
                            ),
                            _buildEkskulItem(
                              context,
                              'Paduan Suara',
                              '25 anggota • Kam',
                              Icons.mic,
                              'Paduan Suara',
                              null,
                            ),
                            _buildEkskulItem(
                              context,
                              'BTQ',
                              '25 anggota • Kam',
                              Icons.menu_book,
                              'BTQ',
                              null,
                            ),
                            _buildEkskulItem(
                              context,
                              'Perisai Diri',
                              '30 anggota • Rab',
                              Icons.shield,
                              'Perisai Diri',
                              null,
                            ),
                            _buildEkskulItem(
                              context,
                              'Karawitan',
                              '25 anggota • Kam',
                              Icons.music_note,
                              'Karawitan',
                              null,
                            ),
                            _buildEkskulItem(
                              context,
                              'Band',
                              '25 anggota • Kam',
                              Icons.music_note,
                              'Band',
                              null,
                            ),
                            _buildEkskulItem(
                              context,
                              'Robotik',
                              '37 anggota • Sen - Jum',
                              Icons.smart_toy,
                              'Robotik',
                              null,
                            ),
                            _buildEkskulItem(
                              context,
                              'KIR MTK',
                              '50 anggota • Sel',
                              Icons.functions,
                              'KIR MTK',
                              null,
                            ),
                            _buildEkskulItem(
                              context,
                              'KIR IPA',
                              '30 anggota • Sel',
                              Icons.science,
                              'KIR IPA',
                              null,
                            ),
                            // Add more space at the bottom for nav bar
                            SizedBox(height: 90),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      extendBody: true,
      bottomNavigationBar: const CommonNavBar(currentIndex: 0),
    );
  }

  // Builder method for each extracurricular item
  Widget _buildEkskulItem(BuildContext context, String title, String subtitle, IconData icon, String ekskulName, String? imagePath) {
    return Hero(
      tag: 'ekskul-$title',
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) => 
                  EkskulDetailPage(
                    ekskulName: ekskulName, 
                    imagePath: imagePath ?? 'assets/logo/images/prestasi1.png',
                  ),
                transitionsBuilder: (context, animation, secondaryAnimation, child) {
                  var begin = const Offset(1.0, 0.0);
                  var end = Offset.zero;
                  var curve = Curves.easeInOutCubic;
                  var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                  return SlideTransition(
                    position: animation.drive(tween),
                    child: child,
                  );
                },
              ),
            );
          },
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.grey.shade200,
                  width: 1.0,
                ),
              ),
            ),
            child: Row(
              children: [
                // Icon or Image
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(icon, color: Colors.blueGrey),
                ),
                const SizedBox(width: 16),
                // Title and subtitle
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        subtitle,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ],
                  ),
                ),
                // Arrow icon
                Icon(
                  Icons.chevron_right,
                  color: Colors.grey.shade400,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}