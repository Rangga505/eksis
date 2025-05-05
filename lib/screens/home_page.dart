import 'package:flutter/material.dart';
import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final NotchBottomBarController _controller = NotchBottomBarController(index: 2);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF435059),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            // App Bar with Logo
Padding(
  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
  child: Stack(
    alignment: Alignment.center,
    children: [
      Align(
        alignment: Alignment.centerLeft,
        child: SizedBox(
          height: 60,
          child: Image.asset('assets/logo/LOGOMIRING.png'),
        ),
      ),
      Align(
        alignment: Alignment.centerRight,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(Icons.notifications_outlined, color: Colors.white, size: 26),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.settings, color: Colors.white, size: 26),
              onPressed: () {},
            ),
          ],
        ),
      ),
    ],
  ),
),

            
            // Profile Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
              child: Row(
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 3),
                      image: const DecorationImage(
                        image: AssetImage('assets/logo/images/profile_photo.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Selamat Datang',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'Herdiansyah Rangga Prasetyo',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
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
            
            // Main content
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Navigation Options
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            _buildNavOption('Ekstrakurikuler', Icons.sports_basketball),
                            _buildNavOption('Pendaftaran', Icons.edit_document),
                            _buildNavOption('Galeri', Icons.photo_library),
                            _buildNavOption('Prestasi', Icons.emoji_events),
                          ],
                        ),
                      ),
                      
                      const SizedBox(height: 10),
                      
                      // Terpopuler Section with Horizontal Scroll
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Terpopuler',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 15),
                            SizedBox(
                              height: 150,
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: [
                                  _buildHorizontalCard('assets/images/pramuka.jpg'),
                                  _buildHorizontalCard('assets/images/basket.jpg'),
                                  _buildHorizontalCard('assets/images/pramuka.jpg'),
                                  _buildHorizontalCard('assets/images/basket.jpg'),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      
                      // Prestasi Section with Horizontal Scroll
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Prestasi',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 15),
                            SizedBox(
                              height: 180,
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: [
                                  _buildHorizontalCard('assets/images/prestasi1.jpg'),
                                  _buildHorizontalCard('assets/images/prestasi2.jpg'),
                                  _buildHorizontalCard('assets/images/prestasi1.jpg'),
                                  _buildHorizontalCard('assets/images/prestasi2.jpg'),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      
                      const SizedBox(height: 90), // Space for bottom bar
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      extendBody: true,
      bottomNavigationBar: AnimatedNotchBottomBar(
        notchBottomBarController: _controller,
        color: const Color(0xFF435059),
        showLabel: true,
        notchColor: const Color(0xFF435059),
        removeMargins: false,
        bottomBarWidth: MediaQuery.of(context).size.width,
        kBottomRadius: 28.0,
        kIconSize: 24.0,
        durationInMilliSeconds: 300,
        bottomBarItems: [
          BottomBarItem(
            inActiveItem: const Icon(Icons.sports_basketball, color: Colors.white70),
            activeItem: const Icon(Icons.sports_basketball, color: Colors.white),
            itemLabel: 'Ekskul',
          ),
          BottomBarItem(
            inActiveItem: const Icon(Icons.emoji_events, color: Colors.white70),
            activeItem: const Icon(Icons.emoji_events, color: Colors.white),
            itemLabel: 'Prestasi',
          ),
          BottomBarItem(
            inActiveItem: Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              padding: const EdgeInsets.all(10),
              child: const Icon(Icons.home, color: Color(0xFF435059)),
            ),
            activeItem: Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              padding: const EdgeInsets.all(10),
              child: const Icon(Icons.home, color: Color(0xFF435059)),
            ),
            itemLabel: 'Beranda',
          ),
          BottomBarItem(
            inActiveItem: const Icon(Icons.photo_library, color: Colors.white70),
            activeItem: const Icon(Icons.photo_library, color: Colors.white),
            itemLabel: 'Galeri',
          ),
          BottomBarItem(
            inActiveItem: const Icon(Icons.person, color: Colors.white70),
            activeItem: const Icon(Icons.person, color: Colors.white),
            itemLabel: 'Profil',
          ),
        ],
        onTap: (index) {
          setState(() {
            _controller.index = index;
          });
        },
      ),
    );
  }

  Widget _buildNavOption(String title, IconData icon) {
    return Column(
      children: [
        Container(
          width: 65,
          height: 65,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, size: 30, color: Colors.black54),
        ),
        const SizedBox(height: 8),
        Text(
          title,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
  
  Widget _buildHorizontalCard(String imageAsset) {
    return Container(
      width: 200,
      margin: const EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: AssetImage(imageAsset),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}