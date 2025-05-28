import 'package:flutter/material.dart';
import '../widgets/common_header.dart';
import '../widgets/common_navbar.dart';
import '../pages/detail_ekskul.dart';
import '../pages/ekskul_selection_page.dart';
import '../pages/galeri_page.dart';
import '../pages/prestasi_page.dart';
import '../pages/jadwal_kegiatan_page.dart';
import '../pages/ekstra_diikuti.dart';
import 'help_center.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2C3A47),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            // Use CommonHeader widget
            const CommonHeader(),
            
            // Main content
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Color(0xFFF5F6FA),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Welcome Banner
                        _buildWelcomeBanner(context),
                        
                        // Featured Services Section (replacing Quick Access)
                        _buildFeaturedServicesSection(context),
                        
                        // Horizontal Divider
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Divider(
                            color: Colors.grey.shade300,
                            thickness: 1,
                          ),
                        ),
                        
                        // Terpopuler Section
                        _buildSectionTitle('Ekstrakurikuler Populer', Icons.trending_up),
                        _buildTerpopulerSection(context),
                        
                        // Prestasi Section
                        _buildSectionTitle('Prestasi Terbaru', Icons.emoji_events),
                        _buildPrestasiSection(context),
                        

                        
                        const SizedBox(height: 100), // Space for bottom bar
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      extendBody: true,
      bottomNavigationBar: const CommonNavBar(currentIndex: 2),
    );
  }

  Widget _buildWelcomeBanner(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF435059), Color(0xFF435059)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.blue.withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(0, 4),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              // Profile photo moved next to welcome text
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 2),
                  image: const DecorationImage(
                    image: AssetImage('assets/logo/images/profile_photo.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Selamat Datang',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white70,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Herdiansyah Rangga P.',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          // Search Bar
          Container(
            height: 46,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(23),
            ),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Cari ekstrakurikuler...',
                hintStyle: TextStyle(color: Colors.grey[400], fontSize: 14),
                prefixIcon: const Icon(Icons.search, color: Colors.grey, size: 20),
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(vertical: 13),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // New Featured Services Section replacing Quick Access
  Widget _buildFeaturedServicesSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Akses Cepat',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2C3A47),
            ),
          ),
          const SizedBox(height: 16),
          
          // First row of services
          Row(
            children: [
              Expanded(
                child: _buildFeatureCard(
                  context,
                  'Jadwal Kegiatan',
                  Icons.calendar_month_rounded,
                  const Color(0xFF4E92DF),
                  () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const JadwalKegiatanPage(),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: _buildFeatureCard(
                  context,
                  'Ektrakurikuler Yang Diikuti',
                  Icons.app_registration_rounded,
                  const Color(0xFF7847E0),
                  () {
                                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const JoinedExtracurricularPage(),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          
          const SizedBox(height: 15),
          
          // Second row of services
          Row(
            children: [
              Expanded(
                child: _buildFeatureCard(
                  context,
                  'Daftar Ekstrakurikuler',
                  Icons.sports_basketball_rounded,
                  const Color(0xFF16A34A),
                  () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const EkskulSelectionPage(),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: _buildFeatureCard(
                  context,
                  'Panduan Dan Bantuan',
                  Icons.help_outline,
                  const Color(0xFFE05F35),
                  () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HelpCenterPage(),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureCard(BuildContext context, String title, IconData icon, Color color, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 110,
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(
                icon,
                size: 24,
                color: color,
              ),
            ),
            Text(
              title,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Color(0xFF2C3A47),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title, IconData icon) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(icon, size: 20, color: const Color(0xFF2C3A47)),
              const SizedBox(width: 8),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2C3A47),
                ),
              ),
            ],
          ),
          Text(
            'Lihat Semua',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Colors.blue[700],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTerpopulerSection(BuildContext context) {
    // This will contain the cards for popular extracurriculars
    return SizedBox(
      height: 190,
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        scrollDirection: Axis.horizontal,
        children: [
          _buildEkskulCard(
            context,
            'Pramuka',
            '65 anggota',
            'assets/logo/images/Pramuka.png',
            Colors.green,
          ),
          _buildEkskulCard(
            context,
            'Basket',
            '50 anggota',
            'assets/logo/images/Basket.png',
            Colors.orange,
          ),
          _buildEkskulCard(
            context,
            'Sepak Bola',
            '80 anggota',
            'assets/logo/images/SepakBola1.png',
            Colors.blue,
          ),
          _buildEkskulCard(
            context,
            'Bola Voli',
            '40 anggota',
            'assets/logo/images/BolaVoli.png',
            Colors.purple,
          ),
        ],
      ),
    );
  }

  Widget _buildEkskulCard(BuildContext context, String title, String members, String imagePath, Color color) {
    return GestureDetector(
      onTap: () {
        // Navigate to the ekskul detail page with the specific data
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => EkskulDetailPage(
              ekskulName: title,
              imagePath: imagePath,
            ),
          ),
        );
      },
      child: Container(
        width: 160,
        margin: const EdgeInsets.only(right: 16, bottom: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              child: Image.asset(
                imagePath,
                height: 100,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            // Content
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2C3A47),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(
                        Icons.group,
                        size: 14,
                        color: color,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        members,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPrestasiSection(BuildContext context) {
    // This will contain horizontal scrollable cards for achievements
    return SizedBox(
      height: 190,
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        scrollDirection: Axis.horizontal,
        children: [
          _buildPrestasiCard(
            context,
            'Juara 1 Lomba Basket',
            'Tingkat Kabupaten',
            'assets/logo/images/prestasi1.png',
          ),
          _buildPrestasiCard(
            context,
            'Juara 2 Lomba Pramuka',
            'Tingkat Provinsi',
            'assets/logo/images/prestasi1.png',
          ),
          _buildPrestasiCard(
            context,
            'Juara 1 Lomba Voli',
            'Tingkat Nasional',
            'assets/logo/images/prestasi1.png',
          ),
          _buildPrestasiCard(
            context,
            'Juara 3 Lomba Sepak Bola',
            'Tingkat Kota',
            'assets/logo/images/prestasi1.png',
          ),
        ],
      ),
    );
  }

  Widget _buildPrestasiCard(BuildContext context, String title, String level, String imagePath) {
    return GestureDetector(
      onTap: () {
        // Navigate to the prestasi detail page with MaterialPageRoute
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const PrestasiPage(),
          ),
        );
      },
      child: Container(
        width: 200,
        margin: const EdgeInsets.only(right: 16, bottom: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  child: Image.asset(
                    imagePath,
                    height: 100,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 10,
                  right: 10,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(
                      Icons.emoji_events,
                      color: Colors.white,
                      size: 16,
                    ),
                  ),
                ),
              ],
            ),
            // Content
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2C3A47),
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(
                        Icons.place,
                        size: 14,
                        color: Colors.red[400],
                      ),
                      const SizedBox(width: 4),
                      Text(
                        level,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }


}