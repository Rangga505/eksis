import 'package:flutter/material.dart';
import '../widgets/common_header.dart';
import '../widgets/common_navbar.dart';
import './detail_gallery.dart';

class GaleriPage extends StatefulWidget {
  const GaleriPage({super.key});

  @override
  State<GaleriPage> createState() => _GaleriPageState();
}

class _GaleriPageState extends State<GaleriPage> {
  // View mode state
  bool isGridView = true;
  
  // List of all extracurricular activities
  final List<Map<String, dynamic>> ekskulList = [
    {
      'name': 'Pramuka INTI',
      'image': 'assets/logo/images/Pramuka.png',
      'icon': Icons.flare,
      'category': 'Organisasi'
    },
    {
      'name': 'Jurnalistik',
      'image': 'assets/logo/images/jurnalistik.png',
      'icon': Icons.book,
      'category': 'Akademik'
    },
    {
      'name': 'Sepak Bola',
      'image': 'assets/logo/images/SepakBola1.png',
      'icon': Icons.sports_soccer,
      'category': 'Olahraga'
    },
    {
      'name': 'Basket',
      'image': 'assets/logo/images/Basket.png',
      'icon': Icons.sports_basketball,
      'category': 'Olahraga'
    },
    {
      'name': 'Voli',
      'image': 'assets/logo/images/BolaVoli.png',
      'icon': Icons.sports_volleyball,
      'category': 'Olahraga'
    },
    {
      'name': 'Desain Grafis',
      'image': 'assets/logo/images/DESAINGRAFIS.jpg',
      'icon': Icons.palette,
      'category': 'Seni'
    },
    {
      'name': 'Karate',
      'image': 'assets/logo/images/KARATE.jpg',
      'icon': Icons.sports_martial_arts,
      'category': 'Olahraga'
    },
    {
      'name': 'Palang Merah Remaja',
      'image': 'assets/logo/images/PMR.png',
      'icon': Icons.medical_services,
      'category': 'Organisasi'
    },
    {
      'name': 'Al - Banjari',
      'image': 'assets/logo/images/AlBANJARI.jpg',
      'icon': Icons.music_note,
      'category': 'Seni'
    },
    {
      'name': 'Tari',
      'image': 'assets/logo/images/TARI.png',
      'icon': Icons.attractions,
      'category': 'Seni'
    },
    {
      'name': 'Paduan Suara',
      'image': 'assets/logo/images/paduansuara.png',
      'icon': Icons.mic,
      'category': 'Seni'
    },
    {
      'name': 'BTQ',
      'image': 'assets/logo/images/ALBANJARI.jpg',
      'icon': Icons.menu_book,
      'category': 'Akademik'
    },
    {
      'name': 'Perisai Diri',
      'image': 'assets/logo/images/pencaksilat.jpg',
      'icon': Icons.shield,
      'category': 'Olahraga'
    },
    {
      'name': 'Karawitan',
      'image': 'assets/logo/images/karawitan.png',
      'icon': Icons.music_note,
      'category': 'Seni'
    },
    {
      'name': 'Robotik',
      'image': 'assets/logo/images/robotik.jpg',
      'icon': Icons.smart_toy,
      'category': 'Akademik'
    },
    {
      'name': 'KIR MTK',
      'image': 'assets/logo/images/KIRMTK.jpg',
      'icon': Icons.functions,
      'category': 'Akademik'
    },
    {
      'name': 'KIR IPA',
      'image': 'assets/logo/images/KIRIPA.jpg',
      'icon': Icons.science,
      'category': 'Akademik'
    },
    {
      'name': 'Futsal',
      'image': 'assets/logo/images/SepakBola1.png',
      'icon': Icons.sports_soccer,
      'category': 'Olahraga'
    },
    {
      'name': 'Paskibra',
      'image': 'assets/logo/images/paskibraka.png',
      'icon': Icons.flag,
      'category': 'Organisasi'
    },
  ];

  // Filter options
  final List<String> categories = ['Semua', 'Olahraga', 'Seni', 'Akademik', 'Organisasi'];
  String selectedCategory = 'Semua';

  // Search controller
  final TextEditingController _searchController = TextEditingController();
  String searchQuery = '';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Filter the list based on selected category and search query
    List<Map<String, dynamic>> filteredList = ekskulList.where((ekskul) {
      bool categoryMatch = selectedCategory == 'Semua' || ekskul['category'] == selectedCategory;
      bool searchMatch = searchQuery.isEmpty || 
        ekskul['name'].toString().toLowerCase().contains(searchQuery.toLowerCase());
      return categoryMatch && searchMatch;
    }).toList();

    return Scaffold(
      backgroundColor: const Color(0xFF2C3A47), // Same as PrestasiPage
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            // Common Header
            const CommonHeader(),
            
            // Main content with PrestasiPage style
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Color(0xFFF5F6FA), // Light gray background same as PrestasiPage
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
                        // Title Section (same style as PrestasiPage)
                        _buildTitleSection(),
                        
                        // Category Filter - Pills Design (same as before but adjusted)
                        _buildCategorySection(),
                        
                        // Divider
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Divider(color: Colors.grey.withOpacity(0.3)),
                        ),
                        
                        // Main Gallery Content
                        _buildGalleryContent(filteredList),
                        
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
      bottomNavigationBar: const CommonNavBar(currentIndex: 3),
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
                Icons.photo_library,
                size: 24,
                color: Colors.blue[700],
              ),
              const SizedBox(width: 10),
              const Expanded(
                child: Text(
                  'Galeri Ekstrakurikuler',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2C3A47),
                  ),
                ),
              ),
              
              // Toggle Grid/List View Button
              Container(
                decoration: BoxDecoration(
                  color: Colors.blue.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(12),
                    onTap: () {
                      setState(() {
                        isGridView = !isGridView;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        isGridView ? Icons.view_list : Icons.grid_view,
                        color: Colors.blue[700],
                        size: 24,
                      ),
                    ),
                  ),
                ), 
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            'Galeri foto dan dokumentasi kegiatan ekstrakurikuler sekolah kita.',
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
                  searchQuery = value;
                });
              },
              decoration: InputDecoration(
                hintText: 'Cari Ekstrakurikuler...',
                hintStyle: TextStyle(color: Colors.grey[400], fontSize: 14),
                prefixIcon: const Icon(Icons.search, color: Colors.grey, size: 20),
                suffixIcon: searchQuery.isNotEmpty 
                  ? IconButton(
                      icon: const Icon(Icons.clear, color: Colors.grey, size: 20),
                      onPressed: () {
                        setState(() {
                          _searchController.clear();
                          searchQuery = '';
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

  Widget _buildCategorySection() {
    // Map of categories to their icons and colors (similar to PrestasiPage)
    final Map<String, Map<String, dynamic>> categoryData = {
      'Semua': {'icon': Icons.grid_view, 'color': Colors.blue},
      'Olahraga': {'icon': Icons.sports_basketball, 'color': Colors.orange},
      'Seni': {'icon': Icons.palette, 'color': Colors.purple},
      'Akademik': {'icon': Icons.school, 'color': Colors.green},
      'Organisasi': {'icon': Icons.group, 'color': Colors.amber},
    };

    return Container(
      height: 90,
      margin: const EdgeInsets.only(bottom: 10),
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          final bool isSelected = category == selectedCategory;
          final iconData = categoryData[category]?['icon'] ?? Icons.category;
          final color = categoryData[category]?['color'] ?? Colors.grey;
          
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedCategory = category;
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

  Widget _buildGalleryContent(List<Map<String, dynamic>> filteredList) {
    if (filteredList.isEmpty) {
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
                  selectedCategory == 'Semua' 
                      ? 'Semua Ekstrakurikuler' 
                      : 'Ekstrakurikuler $selectedCategory',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2C3A47),
                  ),
                ),
                const Spacer(),
                Text(
                  '${filteredList.length} ditemukan',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
          isGridView ? _buildGridView(filteredList) : _buildListView(filteredList),
        ],
      ),
    );
  }

  // Grid View Builder
  Widget _buildGridView(List<Map<String, dynamic>> items) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.8,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemCount: items.length,
      itemBuilder: (context, index) {
        final ekskul = items[index];
        return _buildGalleryItem(context, ekskul);
      },
    );
  }
  
  // List View Builder
  Widget _buildListView(List<Map<String, dynamic>> items) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: items.length,
      itemBuilder: (context, index) {
        final ekskul = items[index];
        return _buildListItem(context, ekskul);
      },
    );
  }

  // Builder method for each gallery item (Grid View)
  Widget _buildGalleryItem(BuildContext context, Map<String, dynamic> ekskul) {
    return GestureDetector(
      onTap: () {
        _navigateToDetail(context, ekskul);
      },
      child: Hero(
        tag: 'gallery-${ekskul['name']}',
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Stack(
              fit: StackFit.expand,
              children: [
                // Show IconImage Fallback if using the default image
                ekskul['image'] == 'assets/logo/images/prestasi1.png'
                ? Container(
                    color: _getCategoryBackgroundColor(ekskul['category']),
                    child: Icon(
                      ekskul['icon'] ?? Icons.school,
                      size: 80,
                      color: Colors.white.withOpacity(0.6),
                    ),
                  )
                : Image.asset(
                    ekskul['image'],
                    fit: BoxFit.cover,
                  ),
                
                // Gradient overlay
                Container(
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
                
                // Text overlay
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          ekskul['name'],
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 4),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                          decoration: BoxDecoration(
                            color: _getCategoryColor(ekskul['category']),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            ekskul['category'],
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
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
        ),
      ),
    );
  }
  
  // Builder method for each list item (List View)
  Widget _buildListItem(BuildContext context, Map<String, dynamic> ekskul) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 2,
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () {
          _navigateToDetail(context, ekskul);
        },
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              // Left side - Image or Icon
              Hero(
                tag: 'gallery-${ekskul['name']}',
                child: Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: _getCategoryBackgroundColor(ekskul['category']),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: ekskul['image'] == 'assets/logo/images/prestasi1.png'
                      ? Icon(
                          ekskul['icon'] ?? Icons.school,
                          size: 40,
                          color: Colors.white,
                        )
                      : Image.asset(
                          ekskul['image'],
                          fit: BoxFit.cover,
                        ),
                  ),
                ),
              ),
              
              const SizedBox(width: 16),
              
              // Right side - Text information
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      ekskul['name'],
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: _getCategoryColor(ekskul['category']),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        ekskul['category'],
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              
              // Arrow icon
              const Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: Colors.grey,
              ),
            ],
          ),
        ),
      ),
    );
  }
  
  // Navigator helper
  void _navigateToDetail(BuildContext context, Map<String, dynamic> ekskul) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => 
          DetailGalleryPage(
            ekskulName: ekskul['name'],
            imagePath: ekskul['image'],
            category: ekskul['category'],
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
  }
  
  // Helper method to get color based on category
  Color _getCategoryColor(String category) {
    switch (category) {
      case 'Olahraga':
        return const Color.fromARGB(255, 247, 157, 73); // Lighter blue
      case 'Seni':
        return const Color(0xFF9333EA); // Purple
      case 'Akademik':
        return const Color(0xFF16A34A); // Green
      case 'Organisasi':
        return const Color(0xFFEA580C); // Orange
      default:
        return Colors.grey;
    }
  }
  
  // Helper method to get background color for icon display
  Color _getCategoryBackgroundColor(String category) {
    switch (category) {
      case 'Olahraga':
        return const Color.fromARGB(255, 250, 170, 96); // Lighter blue
      case 'Seni':
        return const Color(0xFFC084FC); // Lighter purple
      case 'Akademik':
        return const Color(0xFF4ADE80); // Lighter green
      case 'Organisasi':
        return const Color(0xFFFB923C); // Lighter orange
      default:
        return Colors.grey.shade300;
    }
  }
}