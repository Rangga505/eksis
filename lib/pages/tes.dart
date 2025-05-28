import 'package:flutter/material.dart';
import '../widgets/common_header.dart';
import '../widgets/common_navbar.dart';

class PrestasiPage extends StatefulWidget {
  const PrestasiPage({super.key});

  @override
  State<PrestasiPage> createState() => _PrestasiPageState();
}

class _PrestasiPageState extends State<PrestasiPage> {
  String _selectedCategory = 'Semua';
  String _searchQuery = '';
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  // List of all prestasi with complete data
  final List<Map<String, dynamic>> _allPrestasi = [
    {
      'title': 'Juara 1 Lomba Pramuka Tingkat Provinsi',
      'ekskul': 'Pramuka INTI',
      'level': 'Provinsi',
      'date': '15 April 2025',
      'image': 'assets/logo/images/prestasi1.png',
      'ekskul_image': 'assets/logo/images/Pramuka.png',
      'color': Colors.green,
      'icon': Icons.flare,
      'description': 'Tim Pramuka INTI berhasil meraih juara 1 dalam Lomba Keterampilan Pramuka tingkat Provinsi yang diselenggarakan di Gedung Balai Kota.',
      'participants': ['Ahmad Rizki', 'Siti Nurhaliza', 'Budi Santoso', 'Anisa Rahma'],
      'category': 'Non-Akademik',
    },
    {
      'title': 'Juara 2 Kompetisi Robotik Nasional',
      'ekskul': 'Robotik',
      'level': 'Nasional',
      'date': '23 Maret 2025',
      'image': 'assets/logo/images/prestasi1.png',
      'ekskul_image': 'assets/logo/images/robotik.jpg',
      'color': Colors.indigo,
      'icon': Icons.smart_toy,
      'description': 'Tim Robotik sekolah berhasil meraih peringkat 2 dalam Kompetisi Robotik Nasional yang diselenggarakan oleh Kementerian Pendidikan.',
      'participants': ['Dian Sastro', 'Reza Rahadian', 'Maudy Ayunda'],
      'category': 'Akademik',
    },
    {
      'title': 'Juara 1 Turnamen Basket Antar Sekolah',
      'ekskul': 'Basket',
      'level': 'Kota',
      'date': '10 Februari 2025',
      'image': 'assets/logo/images/prestasi1.png',
      'ekskul_image': 'assets/logo/images/Basket.png',
      'color': Colors.orange,
      'icon': Icons.sports_basketball,
      'description': 'Tim Basket putra berhasil menjadi juara 1 dalam turnamen basket antar SMA se-Kota yang diselenggarakan di GOR Kota.',
      'participants': ['Arif Wijaya', 'Bima Sakti', 'Candra Wijaya', 'Dodi Sudrajat', 'Eko Prasetyo'],
      'category': 'Olahraga',
    },
    {
      'title': 'Penampil Terbaik Festival Karawitan',
      'ekskul': 'Karawitan',
      'level': 'Provinsi',
      'date': '5 Mei 2025',
      'image': 'assets/logo/images/prestasi1.png',
      'ekskul_image': 'assets/logo/images/karawitan.jpg',
      'color': Colors.deepPurple,
      'icon': Icons.music_note,
      'description': 'Grup Karawitan sekolah mendapatkan penghargaan sebagai Penampil Terbaik dalam Festival Seni Karawitan tingkat Provinsi.',
      'participants': ['Ratna Sari', 'Bambang Pamungkas', 'Citra Kirana', 'Dewi Persik', 'Eko Patrio'],
      'category': 'Seni',
    },
    {
      'title': 'Medali Emas Karate Kelas Menengah',
      'ekskul': 'Karate',
      'level': 'Nasional',
      'date': '12 Januari 2025',
      'image': 'assets/logo/images/prestasi1.png',
      'ekskul_image': 'assets/logo/images/karate.png',
      'color': Colors.blueGrey,
      'icon': Icons.sports_martial_arts,
      'description': 'Atlet karate sekolah berhasil meraih medali emas dalam Kejuaraan Nasional Karate kelas menengah.',
      'participants': ['Maya Indah'],
      'category': 'Olahraga',
    },
    {
      'title': 'Juara 1 Kompetisi KIR IPA',
      'ekskul': 'KIR IPA',
      'level': 'Nasional',
      'date': '28 Maret 2025',
      'image': 'assets/logo/images/prestasi1.png',
      'ekskul_image': 'assets/logo/images/KIRIPA.jpg',
      'color': Colors.teal,
      'icon': Icons.science,
      'description': 'Tim KIR IPA meraih juara 1 dalam Kompetisi Karya Ilmiah Remaja tingkat Nasional dengan penelitian tentang energi terbarukan.',
      'participants': ['Farel Rizky', 'Gita Nirmala', 'Hana Zahra'],
      'category': 'Akademik',
    },
    {
      'title': 'Juara 2 Olimpiade Matematika',
      'ekskul': 'KIR MTK',
      'level': 'Internasional',
      'date': '17 April 2025',
      'image': 'assets/logo/images/prestasi1.png',
      'ekskul_image': 'assets/logo/images/KIRMTK.jpg',
      'color': Colors.blue,
      'icon': Icons.functions,
      'description': 'Perwakilan KIR MTK berhasil meraih juara 2 dalam Olimpiade Matematika tingkat Internasional di Singapura.',
      'participants': ['Ilham Ramadhan'],
      'category': 'Akademik',
    },
    {
      'title': 'Best Performance Festival Al-Banjari',
      'ekskul': 'Al-Banjari',
      'level': 'Provinsi',
      'date': '8 Mei 2025',
      'image': 'assets/logo/images/prestasi1.png',
      'ekskul_image': 'assets/logo/images/al_banjari.png',
      'color': Colors.green,
      'icon': Icons.music_note,
      'description': 'Grup Al-Banjari sekolah mendapatkan penghargaan Best Performance dalam Festival Musik Islami tingkat Provinsi.',
      'participants': ['Joko Susilo', 'Kiki Amalia', 'Lukman Hakim', 'Mega Wati', 'Naufal Zaki'],
      'category': 'Religi',
    },
    {
      'title': 'Juara 1 Lomba Jurnalistik',
      'ekskul': 'Jurnalistik',
      'level': 'Kota',
      'date': '25 Februari 2025',
      'image': 'assets/logo/images/prestasi1.png',
      'ekskul_image': 'assets/logo/images/jurnal.jpg',
      'color': Colors.indigo,
      'icon': Icons.book,
      'description': 'Tim Jurnalistik berhasil meraih juara 1 dalam Lomba Penulisan Artikel Ilmiah tingkat Kota.',
      'participants': ['Olivia Putri', 'Putra Andika', 'Qori Aina'],
      'category': 'Akademik',
    },
    {
      'title': 'Juara 3 Lomba Paduan Suara',
      'ekskul': 'Paduan Suara',
      'level': 'Kota',
      'date': '3 Maret 2025',
      'image': 'assets/logo/images/prestasi1.png',
      'ekskul_image': 'assets/logo/images/padus.jpg',
      'color': Colors.pink,
      'icon': Icons.mic,
      'description': 'Tim Paduan Suara berhasil meraih juara 3 dalam Lomba Paduan Suara antar SMA se-Kota yang diselenggarakan oleh Dinas Pendidikan.',
      'participants': ['Rahma Putri', 'Sinta Bella', 'Taufik Ismail', 'Umar Zein', 'Vina Mulya'],
      'category': 'Seni',
    },
    {
      'title': 'Juara 1 Kejuaraan Sepak Bola',
      'ekskul': 'Sepak Bola',
      'level': 'Provinsi',
      'date': '15 Januari 2025',
      'image': 'assets/logo/images/prestasi1.png',
      'ekskul_image': 'assets/logo/images/SepakBola1.png',
      'color': Colors.blue,
      'icon': Icons.sports_soccer,
      'description': 'Tim Sepak Bola putra berhasil menjadi juara 1 dalam kejuaraan sepak bola antar SMA se-Provinsi.',
      'participants': ['Wahyu Agung', 'Xaverius Rio', 'Yanto Basuki', 'Zaenal Abidin', 'Agus Setiawan'],
      'category': 'Olahraga',
    },
    {
      'title': 'Juara 2 Lomba Desain Grafis',
      'ekskul': 'Desain Grafis',
      'level': 'Nasional',
      'date': '7 April 2025',
      'image': 'assets/logo/images/prestasi1.png',
      'ekskul_image': 'assets/logo/images/desaingrafis.jpg',
      'color': Colors.amber,
      'icon': Icons.palette,
      'description': 'Tim Desain Grafis berhasil meraih juara 2 dalam Lomba Desain Poster tingkat Nasional yang diselenggarakan oleh Kementerian Pendidikan.',
      'participants': ['Bella Safira', 'Cakra Wijaya'],
      'category': 'Seni',
    },
  ];

  // Get filtered prestasi based on search and category
  List<Map<String, dynamic>> get _filteredPrestasi {
    return _allPrestasi.where((prestasi) {
      final matchesCategory = _selectedCategory == 'Semua' || 
                            prestasi['category'] == _selectedCategory ||
                            prestasi['ekskul'] == _selectedCategory;
      final matchesSearch = _searchQuery.isEmpty || 
                          prestasi['title'].toLowerCase().contains(_searchQuery.toLowerCase()) ||
                          prestasi['ekskul'].toLowerCase().contains(_searchQuery.toLowerCase());
      return matchesCategory && matchesSearch;
    }).toList();
  }

  // Get all achievement levels for statistics
  Map<String, int> get _achievementLevels {
    final Map<String, int> levels = {
      'Kota': 0,
      'Provinsi': 0,
      'Nasional': 0,
      'Internasional': 0,
    };
    
    for (var prestasi in _allPrestasi) {
      final level = prestasi['level'] as String;
      if (levels.containsKey(level)) {
        levels[level] = (levels[level] ?? 0) + 1;
      }
    }
    
    return levels;
  }

  // Get rank counts for statistics
  Map<String, int> get _rankCounts {
    final Map<String, int> ranks = {
      'Juara 1': 0,
      'Juara 2': 0,
      'Juara 3': 0,
      'Lainnya': 0,
    };
    
    for (var prestasi in _allPrestasi) {
      final title = prestasi['title'] as String;
      if (title.contains('Juara 1')) {
        ranks['Juara 1'] = (ranks['Juara 1'] ?? 0) + 1;
      } else if (title.contains('Juara 2')) {
        ranks['Juara 2'] = (ranks['Juara 2'] ?? 0) + 1;
      } else if (title.contains('Juara 3')) {
        ranks['Juara 3'] = (ranks['Juara 3'] ?? 0) + 1;
      } else {
        ranks['Lainnya'] = (ranks['Lainnya'] ?? 0) + 1;
      }
    }
    
    return ranks;
  }

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
                  color: Color(0xFFF5F6FA), // Light gray background
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
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Title Section
                        _buildTitleSection(),
                        
                        // Stats Section
                        _buildStatsSection(),
                        
                        // Categories
                        _buildCategorySection(),
                        
                        // Divider
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Divider(color: Colors.grey.withOpacity(0.3)),
                        ),
                        
                        // All Prestasi
                        _buildAllPrestasiSection(),
                        
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
      bottomNavigationBar: const CommonNavBar(currentIndex: 1),
    );
  }

  Widget _buildTitleSection() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.emoji_events,
                size: 24,
                color: Colors.amber[700],
              ),
              const SizedBox(width: 10),
              const Text(
                'Prestasi Ekstrakurikuler',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2C3A47),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            'Daftar prestasi dan penghargaan yang telah diraih oleh tim ekstrakurikuler sekolah kita.',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[600],
              height: 1.5,
            ),
          ),
          
          const SizedBox(height: 20),
          Container(
            height: 50,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: TextField(
              controller: _searchController,
              onChanged: (value) {
                setState(() {
                  _searchQuery = value;
                });
              },
              decoration: InputDecoration(
                hintText: 'Cari prestasi...',
                hintStyle: TextStyle(color: Colors.grey[400], fontSize: 14),
                prefixIcon: const Icon(Icons.search, color: Colors.grey, size: 20),
                suffixIcon: _searchQuery.isNotEmpty 
                  ? IconButton(
                      icon: const Icon(Icons.clear, color: Colors.grey, size: 20),
                      onPressed: () {
                        setState(() {
                          _searchController.clear();
                          _searchQuery = '';
                        });
                      },
                    )
                  : null,
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(vertical: 15),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatsSection() {
    if (_searchQuery.isNotEmpty) return const SizedBox.shrink();
    
    final levelStats = _achievementLevels;
    final rankStats = _rankCounts;
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Row(
            children: [
              const Icon(Icons.analytics, color: Colors.blue, size: 20),
              const SizedBox(width: 8),
              const Text(
                'Statistik Prestasi',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2C3A47),
                ),
              ),
            ],
          ),
        ),
        
        // Stats cards
        SizedBox(
          height: 125,
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            children: [
              // Total Achievements
              _buildStatCard(
                'Total Prestasi',
                _allPrestasi.length.toString(),
                Icons.emoji_events,
                Colors.amber,
              ),
              
              // By Level
              _buildStatCard(
                'Tingkat Kota',
                levelStats['Kota'].toString(),
                Icons.location_city,
                Colors.green,
              ),
              _buildStatCard(
                'Tingkat Provinsi',
                levelStats['Provinsi'].toString(),
                Icons.account_balance,
                Colors.purple,
              ),
              _buildStatCard(
                'Tingkat Nasional',
                levelStats['Nasional'].toString(),
                Icons.flag,
                Colors.red,
              ),
              _buildStatCard(
                'Internasional',
                levelStats['Internasional'].toString(),
                Icons.public,
                Colors.blue,
              ),
              
              // By Rank
              _buildStatCard(
                'Juara 1',
                rankStats['Juara 1'].toString(),
                Icons.looks_one,
                Colors.red,
              ),
              _buildStatCard(
                'Juara 2',
                rankStats['Juara 2'].toString(),
                Icons.looks_two,
                Colors.blue,
              ),
              _buildStatCard(
                'Juara 3',
                rankStats['Juara 3'].toString(),
                Icons.looks_3,
                Colors.green,
              ),
            ],
          ),
        ),
        
        const SizedBox(height: 10),
      ],
    );
  }

  Widget _buildStatCard(String title, String value, IconData icon, Color color) {
    return Container(
      width: 110,
      margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: color,
              size: 24,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            title,
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey[600],
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildCategorySection() {
    // Get unique categories
    final Set<String> categories = {'Semua'};
    for (var ekskul in _allPrestasi) {
      categories.add(ekskul['category'] as String);
      categories.add(ekskul['ekskul'] as String);
    }
    
    // Map of categories to their icons and colors
    final Map<String, Map<String, dynamic>> categoryData = {
      'Semua': {'icon': Icons.grid_view, 'color': Colors.blue},
      'Olahraga': {'icon': Icons.sports_basketball, 'color': Colors.orange},
      'Seni': {'icon': Icons.palette, 'color': Colors.purple},
      'Akademik': {'icon': Icons.school, 'color': Colors.green},
      'Religi': {'icon': Icons.auto_stories, 'color': Colors.amber},
      'Non-Akademik': {'icon': Icons.history_edu, 'color': Colors.brown},
      'Pramuka INTI': {'icon': Icons.flare, 'color': Colors.green},
      'Robotik': {'icon': Icons.smart_toy, 'color': Colors.indigo},
      'Basket': {'icon': Icons.sports_basketball, 'color': Colors.orange},
      'Karawitan': {'icon': Icons.music_note, 'color': Colors.deepPurple},
      'Karate': {'icon': Icons.sports_martial_arts, 'color': Colors.blueGrey},
      'KIR IPA': {'icon': Icons.science, 'color': Colors.teal},
      'KIR MTK': {'icon': Icons.functions, 'color': Colors.blue},
      'Al-Banjari': {'icon': Icons.music_note, 'color': Colors.green},
      'Jurnalistik': {'icon': Icons.book, 'color': Colors.indigo},
      'Paduan Suara': {'icon': Icons.mic, 'color': Colors.pink},
      'Sepak Bola': {'icon': Icons.sports_soccer, 'color': Colors.blue},
      'Desain Grafis': {'icon': Icons.palette, 'color': Colors.amber},
    };
    
    // Filter to important categories only to avoid clutter
    final List<String> mainCategories = [
      'Semua',
      'Olahraga',
      'Seni',
      'Akademik',
      'Religi',
      'Non-Akademik',
    ];

    return Container(
      height: 90,
      margin: const EdgeInsets.only(bottom: 10),
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        scrollDirection: Axis.horizontal,
        itemCount: mainCategories.length,
        itemBuilder: (context, index) {
          final category = mainCategories[index];
          final bool isSelected = _selectedCategory == category;
          final iconData = categoryData[category]?['icon'] ?? Icons.category;
          final color = categoryData[category]?['color'] ?? Colors.grey;
          
          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedCategory = category;
              });
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 5),
              child: Column(
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    margin: const EdgeInsets.only(bottom: 8),
                    decoration: BoxDecoration(
                      color: isSelected 
                        ? color 
                        : color.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(15),
                      border: isSelected
                        ? Border.all(color: color, width: 2)
                        : null,
                      boxShadow: isSelected
                        ? [
                            BoxShadow(
                              color: color.withOpacity(0.3),
                              blurRadius: 8,
                              offset: const Offset(0, 4),
                            ),
                          ]
                        : null,
                    ),
                    child: Icon(
                      iconData,
                      size: 28,
                      color: isSelected ? Colors.white : color,
                    ),
                  ),
                  Text(
                    category,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                      color: isSelected ? color : const Color(0xFF2C3A47),
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

  Widget _buildAllPrestasiSection() {
    if (_filteredPrestasi.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 50),
          child: Column(
            children: [
              Icon(
                Icons.search_off,
                size: 80,
                color: Colors.grey[400],
              ),
              const SizedBox(height: 16),
              Text(
                'Tidak ada prestasi yang ditemukan',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[600],
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Coba ubah kata kunci pencarian atau kategori',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[500],
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 15, top: 10),
            child: Row(
              children: [
                Text(
                  _selectedCategory == 'Semua' 
                      ? 'Semua Prestasi' 
                      : 'Prestasi $_selectedCategory',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2C3A47),
                  ),
                ),
                const Spacer(),
                Text(
                  '${_filteredPrestasi.length} ditemukan',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: _filteredPrestasi.length,
            itemBuilder: (context, index) {
              final prestasi = _filteredPrestasi[index];
              return _buildPrestasiCard(
                context,
                prestasi['title'],
                prestasi['ekskul'],
                prestasi['level'],
                prestasi['date'],
                prestasi['image'],
                prestasi['ekskul_image'],
                prestasi['color'],
                prestasi['icon'],
                prestasi['description'],
                prestasi['participants'],
                prestasi['category'],
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildPrestasiCard(
    BuildContext context,
    String title,
    String ekskul,
    String level,
    String date,
    String imagePath,
    String ekskulImagePath,
    Color color,
    IconData icon,
    String description,
    List<dynamic> participants,
    String category,
  ) {
    // Determine badge color based on level
    Color levelColor;
    switch (level) {
      case 'Kota':
        levelColor = Colors.green;
        break;
      case 'Provinsi':
        levelColor = Colors.purple;
        break;
      case 'Nasional':
        levelColor = Colors.red;
        break;
      case 'Internasional':
        levelColor = Colors.blue;
        break;
      default:
        levelColor = Colors.grey;
    }
    
    // Badge text based on title
    String badgeText = '';
    if (title.contains('Juara 1')) {
      badgeText = 'Gold';
    } else if (title.contains('Juara 2')) {
      badgeText = 'Silver';
    } else if (title.contains('Juara 3')) {
      badgeText = 'Bronze';
    } else {
      badgeText = 'Achievement';
    }
    
    // Badge color based on title
// Badge color based on title
    Color badgeColor;
    if (title.contains('Juara 1')) {
      badgeColor = Colors.amber;
    } else if (title.contains('Juara 2')) {
      badgeColor = Colors.blueGrey;
    } else if (title.contains('Juara 3')) {
      badgeColor = Colors.brown;
    } else {
      badgeColor = Colors.purple;
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: InkWell(
        onTap: () {
          _showPrestasiDetail(
            context,
            title,
            ekskul,
            level,
            date,
            imagePath,
            ekskulImagePath,
            color,
            icon,
            description,
            participants,
            category,
          );
        },
        borderRadius: BorderRadius.circular(15),
        child: Column(
          children: [
            // Header section with image
            Stack(
              alignment: Alignment.bottomLeft,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.asset(
                    imagePath,
                    height: 180,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                // Overlay gradient
                Container(
                  height: 180,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        Colors.black.withOpacity(0.7),
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),
                
                // Title and badges
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Badges row
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: badgeColor,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Colors.white,
                                  size: 12,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  badgeText,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: levelColor,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              level,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      // Title
                      Text(
                        title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            
            // Content section
            Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                children: [
                  // Ekskul Image
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: color.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Image.asset(
                        ekskulImagePath,
                        width: 30,
                        height: 30,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  const SizedBox(width: 15),
                  // Ekskul Details
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          ekskul,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF2C3A47),
                          ),
                        ),
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            Icon(
                              Icons.calendar_today,
                              size: 14,
                              color: Colors.grey[600],
                            ),
                            const SizedBox(width: 5),
                            Text(
                              date,
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey[600],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            Icon(
                              Icons.people,
                              size: 14,
                              color: Colors.grey[600],
                            ),
                            const SizedBox(width: 5),
                            Text(
                              '${participants.length} Peserta',
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
                  // Read more button
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: color.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.arrow_forward_ios,
                        size: 16,
                        color: color,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showPrestasiDetail(
    BuildContext context,
    String title,
    String ekskul,
    String level,
    String date,
    String imagePath,
    String ekskulImagePath,
    Color color,
    IconData icon,
    String description,
    List<dynamic> participants,
    String category,
  ) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height * 0.85,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
        ),
        child: Column(
          children: [
            // Handle
            Container(
              margin: const EdgeInsets.only(top: 10),
              width: 50,
              height: 5,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            
            // Content
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header with image
                    Stack(
                      alignment: Alignment.bottomLeft,
                      children: [
                        // Image
                        Image.asset(
                          imagePath,
                          height: 200,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                        // Gradient overlay
                        Container(
                          height: 200,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              colors: [
                                Colors.black.withOpacity(0.7),
                                Colors.transparent,
                              ],
                            ),
                          ),
                        ),
                        // Back button
                        Positioned(
                          top: 20,
                          left: 20,
                          child: InkWell(
                            onTap: () => Navigator.pop(context),
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.5),
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                                size: 20,
                              ),
                            ),
                          ),
                        ),
                        // Title and category
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Level badge
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                decoration: BoxDecoration(
                                  color: color,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Text(
                                  level,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),
                              // Title
                              Text(
                                title,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 5),
                              // Category and date
                              Row(
                                children: [
                                  Icon(
                                    Icons.category,
                                    color: Colors.white.withOpacity(0.8),
                                    size: 16,
                                  ),
                                  const SizedBox(width: 5),
                                  Text(
                                    category,
                                    style: TextStyle(
                                      color: Colors.white.withOpacity(0.8),
                                      fontSize: 14,
                                    ),
                                  ),
                                  const SizedBox(width: 15),
                                  Icon(
                                    Icons.calendar_today,
                                    color: Colors.white.withOpacity(0.8),
                                    size: 16,
                                  ),
                                  const SizedBox(width: 5),
                                  Text(
                                    date,
                                    style: TextStyle(
                                      color: Colors.white.withOpacity(0.8),
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    
                    // Ekskul info
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              color: color.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Center(
                              child: Image.asset(
                                ekskulImagePath,
                                width: 40,
                                height: 40,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          const SizedBox(width: 15),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                ekskul,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF2C3A47),
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                'Ekstrakurikuler',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey[600],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    
                    // Description
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Deskripsi',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF2C3A47),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            description,
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.grey[700],
                              height: 1.5,
                            ),
                          ),
                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                    
                    // Participants
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Text(
                                'Peserta',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF2C3A47),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                decoration: BoxDecoration(
                                  color: Colors.blue.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Text(
                                  '${participants.length} Orang',
                                  style: const TextStyle(
                                    color: Colors.blue,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 15),
                          
                          // List of participants
                          Container(
                            padding: const EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              color: Colors.grey[100],
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Column(
                              children: [
                                for (int i = 0; i < participants.length; i++)
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 10),
                                    child: Row(
                                      children: [
                                        Container(
                                          width: 35,
                                          height: 35,
                                          decoration: BoxDecoration(
                                            color: color.withOpacity(0.2),
                                            shape: BoxShape.circle,
                                          ),
                                          child: Center(
                                            child: Text(
                                              (i + 1).toString(),
                                              style: TextStyle(
                                                color: color,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 15),
                                        Text(
                                          participants[i],
                                          style: const TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500,
                                            color: Color(0xFF2C3A47),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    
                    // Share button
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: ElevatedButton(
                        onPressed: () {
                          // Share functionality would go here
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Berbagi prestasi ini'),
                              duration: Duration(seconds: 2),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(Icons.share, color: Colors.white),
                            SizedBox(width: 10),
                            Text(
                              'Bagikan Prestasi',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}