import 'package:flutter/material.dart';
import '../widgets/common_header.dart';
import '../widgets/common_navbar.dart';
import 'form_pendaftaran.dart';
import './detail_ekskul.dart';

class EkskulSelectionPage extends StatefulWidget {
  const EkskulSelectionPage({super.key});

  @override
  State<EkskulSelectionPage> createState() => _EkskulSelectionPageState();
}

class _EkskulSelectionPageState extends State<EkskulSelectionPage> {
  String _selectedCategory = 'Semua';
  String _searchQuery = '';
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  // List of all ekstrakurikuler with complete data
  final List<Map<String, dynamic>> _allEkskul = [
    {
      'name': 'Pramuka INTI',
      'fullName': 'Pramuka INTI',
      'category': 'Non-Akademik',
      'members': '65 anggota',
      'schedule': 'Sen - Sabtu',
      'image': 'assets/logo/images/Pramuka.png',
      'color': Colors.green,
      'icon': Icons.flare,
      'popular': true,
      'description': 'Kegiatan kepramukaan yang mengembangkan kepemimpinan, kemandirian, dan cinta tanah air.'
    },
    {
  'name': 'Paskibraka',
  'fullName': 'Pasukan Pengibar Bendera Pusaka',
  'category': 'Kewarganegaraan',
  'members': '80 anggota',
  'schedule': 'Sel',
  'image': 'assets/logo/images/paskibraka.png',
  'color': Colors.red,
  'icon': Icons.flag,
  'popular': true,
  'description': 'Organisasi yang melatih kedisiplinan dan kecintaan terhadap tanah air melalui latihan baris-berbaris dan upacara bendera.'
},
    {
      'name': 'Basket',
      'fullName': 'Basket',
      'category': 'Olahraga',
      'members': '50 anggota',
      'schedule': 'Sel',
      'image': 'assets/logo/images/Basket.png',
      'color': Colors.orange,
      'icon': Icons.sports_basketball,
      'popular': true,
      'description': 'Latihan dan kompetisi basket untuk pengembangan keterampilan tim dan individu.'
    },
    {
      'name': 'Sepak Bola',
      'fullName': 'Sepak Bola',
      'category': 'Olahraga',
      'members': '80 anggota',
      'schedule': 'Kam',
      'image': 'assets/logo/images/SepakBola1.png',
      'color': Colors.blue,
      'icon': Icons.sports_soccer,
      'popular': true,
      'description': 'Tim sepak bola sekolah yang berlatih teknik dan strategi permainan.'
    },
    {
      'name': 'Voli',
      'fullName': 'Bola Voli',
      'category': 'Olahraga',
      'members': '40 anggota',
      'schedule': 'Sel',
      'image': 'assets/logo/images/BolaVoli.png',
      'color': Colors.purple,
      'icon': Icons.sports_volleyball,
      'popular': false,
      'description': 'Latihan bola voli untuk meningkatkan kemampuan tim dan individu.'
    },
    {
      'name': 'Jurnalistik',
      'fullName': ' Jurnalistik',
      'category': 'Akademik',
      'members': '40 anggota',
      'schedule': 'Kam & Sab',
      'image': 'assets/logo/images/jurnalistik.png',
      'color': Colors.indigo,
      'icon': Icons.book,
      'popular': true,
      'description': 'Kelompok sastra dan jurnalistik untuk mengembangkan kemampuan menulis dan literasi.'
    },
    {
      'name': 'Paduan Suara',
      'fullName': 'Paduan Suara',
      'category': 'Seni',
      'members': '25 anggota',
      'schedule': 'Kam',
      'image': 'assets/logo/images/paduansuara.png',
      'color': Colors.pink,
      'icon': Icons.mic,
      'popular': false,
      'description': 'Grup paduan suara untuk pengembangan bakat musik dan vokal.'
    },
    {
      'name': 'Robotik',
      'fullName': 'Robotik',
      'category': 'Akademik',
      'members': '37 anggota',
      'schedule': 'Sen - Jum',
      'image': 'assets/logo/images/robotik.jpg',
      'color': Colors.indigo,
      'icon': Icons.smart_toy,
      'popular': true,
      'description': 'Pengembangan dan pemrograman robot untuk kompetisi dan eksperimen.'
    },
    {
      'name': 'PMR',
      'fullName': 'Palang Merah Remaja',
      'category': 'Non-Akademik',
      'members': '37 anggota',
      'schedule': 'Sen - Jum',
      'image': 'assets/logo/images/PMR.png',
      'color': Colors.red,
      'icon': Icons.medical_services,
      'popular': false,
      'description': 'Palang Merah Remaja untuk pendidikan kesehatan dan pertolongan pertama.'
    },
    {
      'name': 'KIR IPA',
      'fullName': 'KIR IPA',
      'category': 'Akademik',
      'members': '30 anggota',
      'schedule': 'Sel',
      'image': 'assets/logo/images/KIRIPA.jpg',
      'color': Colors.teal,
      'icon': Icons.science,
      'popular': false,
      'description': 'Kelompok ilmiah remaja fokus pada bidang sains dan eksperimen ilmiah.'
    },
    {
      'name': 'KIR MTK',
      'fullName': 'KIR MTK',
      'category': 'Akademik',
      'members': '50 anggota',
      'schedule': 'Sel',
      'image': 'assets/logo/images/KIRMTK.jpg',
      'color': Colors.blue,
      'icon': Icons.functions,
      'popular': false,
      'description': 'Kelompok ilmiah remaja fokus pada bidang matematika dan logika.'
    },
    {
      'name': 'Desain Grafis',
      'fullName': 'Desain Grafis',
      'category': 'Seni',
      'members': '25 anggota',
      'schedule': 'Jum',
      'image': 'assets/logo/images/DESAINGRAFIS.jpg',
      'color': Colors.amber,
      'icon': Icons.palette,
      'popular': false,
      'description': 'Pengembangan keterampilan desain digital dan visual.'
    },
    {
      'name': 'Karate',
      'fullName': 'Karate',
      'category': 'Olahraga',
      'members': '30 anggota',
      'schedule': 'Rab',
      'image': 'assets/logo/images/KARATE.jpg',
      'color': Colors.blueGrey,
      'icon': Icons.sports_martial_arts,
      'popular': false,
      'description': 'Latihan bela diri karate untuk disiplin dan pertahanan diri.'
    },
    {
      'name': 'Al-Banjari',
      'fullName': 'Al-Banjari',
      'category': 'Religi',
      'members': '25 anggota',
      'schedule': 'Kam',
      'image': 'assets/logo/images/ALBANJARI.jpg',
      'color': Colors.green,
      'icon': Icons.music_note,
      'popular': false,
      'description': 'Grup musik islami dengan alat musik tradisional.'
    },
    {
      'name': 'Tari',
      'fullName': 'Tari',
      'category': 'Seni',
      'members': '35 anggota',
      'schedule': 'Rab',
      'image': 'assets/logo/images/TARI.png',
      'color': Colors.deepOrange,
      'icon': Icons.attractions,
      'popular': false,
      'description': 'Kelas tari tradisional dan modern untuk pengembangan bakat seni.'
    },
    {
      'name': 'BTQ',
      'fullName': 'BTQ',
      'category': 'Religi',
      'members': '25 anggota',
      'schedule': 'Kam',
      'image': 'assets/logo/images/ALBANJARI.jpg',
      'color': Colors.green,
      'icon': Icons.menu_book,
      'popular': false,
      'description': 'Baca Tulis Quran untuk meningkatkan kemampuan membaca Al-Quran.'
    },
    {
      'name': 'Perisai Diri',
      'fullName': 'Perisai Diri',
      'category': 'Olahraga',
      'members': '30 anggota',
      'schedule': 'Rab',
      'image': 'assets/logo/images/pencaksilat.jpg',
      'color': Colors.brown,
      'icon': Icons.shield,
      'popular': false,
      'description': 'Seni bela diri tradisional Indonesia untuk membangun karakter dan fisik.'
    },
    {
      'name': 'Karawitan',
      'fullName': 'Karawitan',
      'category': 'Seni',
      'members': '25 anggota',
      'schedule': 'Kam',
      'image': 'assets/logo/images/karawitan.png',
      'color': Colors.deepPurple,
      'icon': Icons.music_note,
      'popular': false,
      'description': 'Kelompok musik tradisional Jawa dengan instrumen gamelan.'
    },
  ];

  // Get filtered ekstrakurikuler based on search and category
  List<Map<String, dynamic>> get _filteredEkskul {
    return _allEkskul.where((ekskul) {
      final matchesCategory = _selectedCategory == 'Semua' || 
                             ekskul['category'] == _selectedCategory;
      final matchesSearch = _searchQuery.isEmpty || 
                           ekskul['name'].toLowerCase().contains(_searchQuery.toLowerCase()) ||
                           ekskul['fullName'].toLowerCase().contains(_searchQuery.toLowerCase());
      return matchesCategory && matchesSearch;
    }).toList();
  }

  // Get popular ekstrakurikuler
  List<Map<String, dynamic>> get _popularEkskul {
    return _allEkskul.where((ekskul) => ekskul['popular'] == true).toList();
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
                        
                        // Popular Ekstrakurikuler Section
                        _buildPopularSection(),
                        
                        // Categories
                        _buildCategorySection(),
                        
                        // Divider
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Divider(color: Colors.grey.withOpacity(0.3)),
                        ),
                        
                        // All Ekstrakurikuler
                        _buildAllEkskulSection(),
                        
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
      bottomNavigationBar: const CommonNavBar(currentIndex: 0),
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
                Icons.app_registration,
                size: 24,
                color: Colors.blue[700],
              ),
              const SizedBox(width: 10),
              const Text(
                'Pendaftaran Ekstrakurikuler',
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
            'Pilih ekstrakurikuler yang ingin kamu ikuti. Pilihlah sesuai dengan minat dan bakatmu.',
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
                hintText: 'Cari ekstrakurikuler...',
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

  Widget _buildPopularSection() {
    if (_searchQuery.isNotEmpty) return const SizedBox.shrink();
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Row(
            children: [
              const Icon(Icons.star, color: Colors.amber, size: 20),
              const SizedBox(width: 8),
              const Text(
                'Ekstrakurikuler Terpopuler',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2C3A47),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 250,
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            scrollDirection: Axis.horizontal,
            itemCount: _popularEkskul.length,
            itemBuilder: (context, index) {
              final ekskul = _popularEkskul[index];
              return _buildPopularCard(
                context,
                ekskul['name'],
                ekskul['category'],
                '${ekskul['members']} • ${ekskul['schedule']}',
                ekskul['image'],
                ekskul['color'],
                ekskul['icon'],
              );
            },
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }

  Widget _buildPopularCard(
    BuildContext context,
    String name,
    String category,
    String details,
    String imagePath,
    Color color,
    IconData icon,
  ) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => EkskulDetailPage(
              ekskulName: name,
              imagePath: imagePath,
            ),
          ),
        );
      },
      child: Container(
        width: 160,
        margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image with category badge
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
                // Category Badge
                Positioned(
                  top: 5,
                  right: 5,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: color.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      category,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 9,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                // Popular badge
                Positioned(
                  top: 5,
                  left: 5,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.amber.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Row(
                      children: [
                        Icon(Icons.star, color: Colors.white, size: 9),
                        SizedBox(width: 2),
                        Text(
                          'Popular',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 9,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            
            // Content
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(icon, color: color, size: 16),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          name,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF2C3A47),
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(
                        Icons.group,
                        size: 12,
                        color: Colors.grey[600],
                      ),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          details,
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.grey[600],
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 28,
                          decoration: BoxDecoration(
                            color: color.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Center(
                            child: Text(
                              'Detail',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: color,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 4),
                      Container(
                        height: 28,
                        width: 28,
                        decoration: BoxDecoration(
                          color: color.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Center(
                          child: Icon(
                            Icons.arrow_forward,
                            color: color,
                            size: 16,
                          ),
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

  Widget _buildCategorySection() {
    final List<Map<String, dynamic>> categories = [
      {'name': 'Semua', 'icon': Icons.grid_view, 'color': Colors.blue},
      {'name': 'Olahraga', 'icon': Icons.sports_basketball, 'color': Colors.orange},
      {'name': 'Seni', 'icon': Icons.palette, 'color': Colors.purple},
      {'name': 'Akademik', 'icon': Icons.school, 'color': Colors.green},
      {'name': 'Religi', 'icon': Icons.auto_stories, 'color': Colors.amber},
      {'name': 'Non-Akademik', 'icon': Icons.history_edu, 'color': Colors.brown},
    ];

    return Container(
      height: 90,
      margin: const EdgeInsets.only(bottom: 10),
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          final bool isSelected = _selectedCategory == category['name'];
          
          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedCategory = category['name'];
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
                        ? category['color'] 
                        : category['color'].withOpacity(0.1),
                      borderRadius: BorderRadius.circular(15),
                      border: isSelected
                        ? Border.all(color: category['color'], width: 2)
                        : null,
                      boxShadow: isSelected
                        ? [
                            BoxShadow(
                              color: category['color'].withOpacity(0.3),
                              blurRadius: 8,
                              offset: const Offset(0, 4),
                            ),
                          ]
                        : null,
                    ),
                    child: Icon(
                      category['icon'],
                      size: 28,
                      color: isSelected ? Colors.white : category['color'],
                    ),
                  ),
                  Text(
                    category['name'],
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                      color: isSelected ? category['color'] : const Color(0xFF2C3A47),
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

  Widget _buildAllEkskulSection() {
    if (_filteredEkskul.isEmpty) {
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
                'Tidak ada ekstrakurikuler yang ditemukan',
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
                      ? 'Semua Ekstrakurikuler' 
                      : 'Ekstrakurikuler $_selectedCategory',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2C3A47),
                  ),
                ),
                const Spacer(),
                Text(
                  '${_filteredEkskul.length} ditemukan',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
GridView.builder(
  physics: const NeverScrollableScrollPhysics(),
  shrinkWrap: true,
  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 2,
    childAspectRatio: 0.65, // Changed from 0.75 to 0.65 to allow more height
    crossAxisSpacing: 15,
    mainAxisSpacing: 15,
  ),
  itemCount: _filteredEkskul.length,
  itemBuilder: (context, index) {
    final ekskul = _filteredEkskul[index];
    return _buildEkskulCard(
      context,
      ekskul['name'],
      ekskul['category'],
      '${ekskul['members']} • ${ekskul['schedule']}',
      ekskul['image'],
      ekskul['color'],
      ekskul['icon'],
      ekskul['description'],
    );
  },
),
        ],
      ),
    );
  }

  Widget _buildEkskulCard(
    BuildContext context,
    String name,
    String category,
    String details,
    String imagePath,
    Color color,
    IconData icon,
    String description,
  ) {
    return GestureDetector(
      onTap: () {
        // Show bottom sheet with options
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          builder: (context) => _buildBottomSheet(
            context,
            name,
            category,
            details,
            imagePath,
            color,
            icon,
            description,
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image with category badge
            Stack(
              children: [
ClipRRect(
  borderRadius: const BorderRadius.only(
    topLeft: Radius.circular(20),
    topRight: Radius.circular(20),
  ),
  child: Image.asset(
    imagePath,
    height: 110, // Reduced from 120 to 110
    width: double.infinity,
    fit: BoxFit.cover,
    errorBuilder: (context, error, stackTrace) {
      return Container(
        height: 110, // Reduced from 120 to 110
        color: color.withOpacity(0.2),
        child: Center(
          child: Icon(
            icon,
            size: 40,
            color: color.withOpacity(0.7),
          ),
        ),
      );
    },
  ),
),
                // Category Badge// Category Badge
                Positioned(
                  top: 10,
                  right: 10,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: color.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      category,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
 Padding(
  padding: const EdgeInsets.all(8.0), // Reduced from 12 to 8
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        children: [
          Icon(icon, color: color, size: 16), // Reduced size from 18 to 16
          const SizedBox(width: 4), // Reduced from 6 to 4
          Expanded(
            child: Text(
              name,
              style: const TextStyle(
                fontSize: 14, // Reduced from 16 to 14
                fontWeight: FontWeight.bold,
                color: Color(0xFF2C3A47),
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
      const SizedBox(height: 4), // Reduced from 6 to 4
      Row(
        children: [
          Icon(
            Icons.group,
            size: 12, // Kept small
            color: Colors.grey[600],
          ),
          const SizedBox(width: 4),
          Expanded(
            child: Text(
              details,
              style: TextStyle(
                fontSize: 10, // Kept small
                color: Colors.grey[600],
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
      const SizedBox(height: 8), // Reduced from 10 to 8
      Container(
        width: double.infinity,
        height: 28, // Kept as is
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Lihat Detail',
                style: TextStyle(
                  fontSize: 11, // Reduced from 12 to 11
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
              ),
              const SizedBox(width: 4), // Reduced from 5 to 4
              Icon(
                Icons.arrow_forward,
                color: color,
                size: 12, // Reduced from 14 to 12
              ),
            ],
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

  Widget _buildBottomSheet(
    BuildContext context,
    String name,
    String category,
    String details,
    String imagePath,
    Color color,
    IconData icon,
    String description,
  ) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.85,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Column(
        children: [
          // Handle bar
          Container(
            margin: const EdgeInsets.only(top: 12, bottom: 20),
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
                    children: [
                      Container(
                        width: double.infinity,
                        height: 200,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(imagePath),
                            fit: BoxFit.cover,
                            colorFilter: ColorFilter.mode(
                              Colors.black.withOpacity(0.2),
                              BlendMode.darken,
                            ),
                          ),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.transparent,
                                Colors.black.withOpacity(0.7),
                              ],
                            ),
                          ),
                        ),
                      ),
                      // Close button
                      Positioned(
                        top: 20,
                        right: 20,
                        child: GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.8),
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.close,
                              color: Colors.black,
                              size: 20,
                            ),
                          ),
                        ),
                      ),
                      // Title and info
                      Positioned(
                        bottom: 20,
                        left: 20,
                        right: 20,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                              decoration: BoxDecoration(
                                color: color,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Text(
                                category,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                Icon(icon, color: Colors.white, size: 24),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: Text(
                                    name,
                                    style: const TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 5),
                            Row(
                              children: [
                                const Icon(
                                  Icons.group,
                                  size: 16,
                                  color: Colors.white70,
                                ),
                                const SizedBox(width: 5),
                                Text(
                                  details,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: Colors.white70,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  
                  // Description
                  Padding(
                    padding: const EdgeInsets.all(20),
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
                            fontSize: 14,
                            color: Colors.grey[700],
                            height: 1.5,
                          ),
                        ),
                        
                        const SizedBox(height: 30),
                        
                        // Features
                        const Text(
                          'Manfaat',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF2C3A47),
                          ),
                        ),
                        const SizedBox(height: 15),
                        _buildFeatureItem(
                          Icons.lightbulb_outline,
                          'Pengembangan Bakat',
                          'Mengembangkan bakat dan keterampilan spesifik',
                          Colors.amber,
                        ),
                        _buildFeatureItem(
                          Icons.people_outline,
                          'Keterampilan Sosial',
                          'Meningkatkan kemampuan bersosialisasi dan kerja tim',
                          Colors.blue,
                        ),
                        _buildFeatureItem(
                          Icons.psychology,
                          'Pengembangan Karakter',
                          'Membangun disiplin, tanggung jawab, dan kepemimpinan',
                          Colors.green,
                        ),
                        
                        const SizedBox(height: 30),
                        
                        // Schedule
                        const Text(
                          'Jadwal Kegiatan',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF2C3A47),
                          ),
                        ),
                        const SizedBox(height: 15),
                        Container(
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            color: Colors.grey[100],
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.calendar_today, color: color),
                                  const SizedBox(width: 10),
                                  const Text(
                                    'Hari Latihan:',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(width: 5),
                                  Text(
                                    details.split('•').last.trim(),
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Row(
                                children: [
                                  Icon(Icons.access_time, color: color),
                                  const SizedBox(width: 10),
                                  const Text(
                                    'Waktu:',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(width: 5),
                                  const Text(
                                    '15:00 - 17:00 WIB',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Row(
                                children: [
                                  Icon(Icons.location_on_outlined, color: color),
                                  const SizedBox(width: 10),
                                  const Text(
                                    'Lokasi:',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(width: 5),
                                  const Expanded(
                                    child: Text(
                                      'Gedung Olahraga Sekolah',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                      ),
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
                ],
              ),
            ),
          ),
          
          // Bottom action buttons
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  offset: const Offset(0, -3),
                  blurRadius: 10,
                ),
              ],
            ),
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EkskulDetailPage(
                            ekskulName: name,
                            imagePath: imagePath,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.info_outline,
                              color: Colors.grey[800],
                              size: 20,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              'Lihat Lengkap',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey[800],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FormPendaftaranPage(
                            ekskulName: name,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: color,
                        borderRadius: BorderRadius.circular(25),
                        boxShadow: [
                          BoxShadow(
                            color: color.withOpacity(0.3),
                            blurRadius: 10,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: const Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.app_registration,
                              color: Colors.white,
                              size: 20,
                            ),
                            SizedBox(width: 8),
                            Text(
                              'Daftar Sekarang',
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
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureItem(IconData icon, String title, String subtitle, Color color) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              icon,
              color: color,
              size: 20,
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
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
                const SizedBox(height: 3),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}