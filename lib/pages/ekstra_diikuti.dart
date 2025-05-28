import 'package:flutter/material.dart';
import '../widgets/common_header.dart';
import '../widgets/common_navbar.dart';
import '../pages/ekskul_selection_page.dart';
import '../pages/diskusi_page.dart';

class JoinedExtracurricularPage extends StatefulWidget {
  const JoinedExtracurricularPage({super.key});

  @override
  State<JoinedExtracurricularPage> createState() => _JoinedExtracurricularPageState();
}

class _JoinedExtracurricularPageState extends State<JoinedExtracurricularPage> {
  // Sample extracurricular activities joined
  final List<Map<String, dynamic>> joinedEkskul = [
    {
      'name': 'Basket',
      'role': 'Anggota',
      'imageAsset': 'assets/logo/images/Basket.png',
      'color': Colors.orange,
      'schedule': 'Senin & Rabu, 15:00 - 17:00',
      'location': 'Lapangan Basket Sekolah',
      'pembina': 'Bapak Rudi Santoso',
      'description': 'Ekstrakurikuler basket untuk mengembangkan bakat dan minat siswa dalam olahraga basket.',
      'members': 20,
      'achievements': [
        'Juara 1 Kompetisi Basket Antar SMP Kota 2024',
        'Juara 2 Turnamen Basket Regional 2023'
      ],
      'announcements': [
        {
          'title': 'Latihan Tambahan',
          'date': '14 Mei 2025',
          'content': 'Akan diadakan latihan tambahan untuk persiapan kompetisi mendatang.'
        }
      ]
    },
    {
      'name': 'Pramuka',
      'role': 'Ketua',
      'imageAsset': 'assets/logo/images/Pramuka.png',
      'color': Colors.green,
      'schedule': 'Jumat, 14:00 - 16:30',
      'location': 'Lapangan Utama Sekolah',
      'pembina': 'Ibu Siti Aminah',
      'description': 'Kegiatan kepramukaan untuk membentuk karakter, kedisiplinan, dan jiwa kepemimpinan siswa.',
      'members': 45,
      'achievements': [
        'Juara Umum Jambore Nasional 2024',
        'Penghargaan Satuan Tergiat 2023'
      ],
      'announcements': [
        {
          'title': 'Persiapan Perkemahan',
          'date': '17 Mei 2025',
          'content': 'Semua anggota diharapkan hadir dalam rapat persiapan perkemahan akhir semester.'
        },
        {
          'title': 'Pengumpulan Iuran',
          'date': '10 Mei 2025',
          'content': 'Batas waktu pengumpulan iuran bulanan paling lambat tanggal 20 Mei 2025.'
        }
      ]
    },
    {
      'name': 'Sepak Bola',
      'role': 'Anggota',
      'imageAsset': 'assets/logo/images/SepakBola1.png',
      'color': Colors.blue,
      'schedule': 'Selasa & Kamis, 15:30 - 17:30',
      'location': 'Lapangan Sepak Bola Sekolah',
      'pembina': 'Bapak Eko Prasetyo',
      'description': 'Latihan intensif sepak bola untuk mengembangkan kemampuan bermain bola dan kerja sama tim.',
      'members': 25,
      'achievements': [
        'Juara 1 Liga Pelajar 2024',
        'Pemain Terbaik Turnamen Antar Sekolah 2023'
      ],
      'announcements': [
        {
          'title': 'Jadwal Pertandingan',
          'date': '13 Mei 2025',
          'content': 'Pertandingan persahabatan dengan SMP Harapan akan dilaksanakan pada tanggal 25 Mei 2025.'
        }
      ]
    },
    {
      'name': 'Paduan Suara',
      'role': 'Anggota',
      'imageAsset': 'assets/logo/images/Basket.png', // placeholder image
      'color': Colors.purple,
      'schedule': 'Rabu & Jumat, 14:00 - 16:00',
      'location': 'Ruang Musik',
      'pembina': 'Ibu Diana Putri',
      'description': 'Ekstrakurikuler yang mengembangkan bakat dan kemampuan bernyanyi siswa dalam format paduan suara.',
      'members': 30,
      'achievements': [
        'Juara 1 Lomba Paduan Suara Tingkat Provinsi 2024',
        'Penampil Terbaik Festival Seni Pelajar 2023'
      ],
      'announcements': [
        {
          'title': 'Latihan Khusus',
          'date': '16 Mei 2025',
          'content': 'Persiapan penampilan untuk acara perpisahan kelas 9.'
        }
      ]
    },
    {
      'name': 'Robotika',
      'role': 'Wakil Ketua',
      'imageAsset': 'assets/logo/images/Pramuka.png', // placeholder image
      'color': Colors.red,
      'schedule': 'Senin & Kamis, 15:00 - 17:00',
      'location': 'Lab. Komputer',
      'pembina': 'Bapak Agus Widodo',
      'description': 'Belajar tentang teknologi robotika, pemrograman, dan berpartisipasi dalam kompetisi robotika.',
      'members': 18,
      'achievements': [
        'Juara 2 Kompetisi Robotika Nasional 2024',
        'Finalis International Robotic Challenge 2023'
      ],
      'announcements': [
        {
          'title': 'Workshop Robotika',
          'date': '18 Mei 2025',
          'content': 'Workshop dari alumni tentang teknologi terbaru dalam robotika.'
        }
      ]
    }
  ];

  // Filter options
  String _selectedFilter = 'Semua';
  final List<String> _filterOptions = ['Semua', 'Ketua', 'Wakil Ketua', 'Anggota'];
  
  // Search controller
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  // Selected index for viewing details
  int? _selectedEkskulIndex;

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  // Filtered list based on role and search query
  List<Map<String, dynamic>> get _filteredEkskul {
    return joinedEkskul.where((ekskul) {
      // Apply role filter
      bool roleMatch = _selectedFilter == 'Semua' || ekskul['role'] == _selectedFilter;
      
      // Apply search filter
      bool searchMatch = _searchQuery.isEmpty || 
          ekskul['name'].toLowerCase().contains(_searchQuery.toLowerCase());
      
      return roleMatch && searchMatch;
    }).toList();
  }

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
              child: Column(
                children: [
                  _buildPageHeader(),
                  _buildSearchAndFilter(),
                  Expanded(
                    child: _selectedEkskulIndex != null
                        ? _buildEkskulDetail(_filteredEkskul[_selectedEkskulIndex!])
                        : _buildEkskulList(),
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
  bottomNavigationBar: const CommonNavBar(currentIndex: 4),
  floatingActionButton: _selectedEkskulIndex == null
      ? FloatingActionButton(
          onPressed: () {
            // Show dialog to join new ekstrakurikuler
            _showJoinEkskulDialog();
          },
          backgroundColor: const Color(0xFF435059),
          child: const Icon(Icons.add, color: Colors.white),
        )
      : null,
);
  }

  Widget _buildPageHeader() {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 25, 20, 15),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          if (_selectedEkskulIndex != null)
            GestureDetector(
              onTap: () {
                setState(() {
                  _selectedEkskulIndex = null;
                });
              },
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.arrow_back,
                  color: Color(0xFF435059),
                  size: 20,
                ),
              ),
            ),
          if (_selectedEkskulIndex != null) const SizedBox(width: 15),
          const Icon(
            Icons.group_outlined,
            color: Color(0xFF435059),
            size: 24,
          ),
          const SizedBox(width: 10),
          Text(
            _selectedEkskulIndex != null
                ? _filteredEkskul[_selectedEkskulIndex!]['name']
                : 'Ekstrakurikuler Diikuti',
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2C3A47),
            ),
          ),
          const Spacer(),
          if (_selectedEkskulIndex == null)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                '${_filteredEkskul.length}',
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildSearchAndFilter() {
    if (_selectedEkskulIndex != null) return const SizedBox.shrink();
    
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
      color: Colors.white,
      child: Column(
        children: [
          // Search bar
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
              color: const Color(0xFFF5F6FA),
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Colors.grey.withOpacity(0.2)),
            ),
            child: TextField(
              controller: _searchController,
              onChanged: (value) {
                setState(() {
                  _searchQuery = value;
                });
              },
              decoration: const InputDecoration(
                icon: Icon(Icons.search, color: Color(0xFF435059)),
                hintText: 'Cari ekstrakurikuler...',
                hintStyle: TextStyle(color: Colors.grey),
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(vertical: 15),
              ),
            ),
          ),
          const SizedBox(height: 15),
          // Filter chips
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            child: Row(
              children: _filterOptions.map((filter) {
                bool isSelected = _selectedFilter == filter;
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedFilter = filter;
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.only(right: 10),
                    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                    decoration: BoxDecoration(
                      color: isSelected ? const Color(0xFF435059) : Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: isSelected ? const Color(0xFF435059) : Colors.grey.withOpacity(0.3),
                      ),
                    ),
                    child: Text(
                      filter,
                      style: TextStyle(
                        color: isSelected ? Colors.white : Colors.grey[700],
                        fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

Widget _buildEkskulList() {
  if (_filteredEkskul.isEmpty) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.search_off,
            size: 60,
            color: Colors.grey[400],
          ),
          const SizedBox(height: 15),
          Text(
            'Tidak ada ekstrakurikuler ditemukan',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[600],
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            'Coba ubah filter atau kata kunci pencarian',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[500],
            ),
          ),
        ],
      ),
    );
  }

  return ListView.builder(
    padding: const EdgeInsets.fromLTRB(20, 20, 20, 80), // Tambahkan padding bottom yang lebih besar
    itemCount: _filteredEkskul.length,
    itemBuilder: (context, index) {
      final ekskul = _filteredEkskul[index];
      return _buildEkskulCard(ekskul, index);
    },
  );
}

  Widget _buildEkskulCard(Map<String, dynamic> ekskul, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedEkskulIndex = index;
        });
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 15),
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
          children: [
            // Header with image background
            Container(
              height: 120,
              decoration: BoxDecoration(
                color: ekskul['color'].withOpacity(0.8),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                image: const DecorationImage(
                  image: AssetImage('assets/logo/images/pattern_bg.png'),
                  fit: BoxFit.cover,
                  opacity: 0.1,
                ),
              ),
              child: Stack(
                children: [
                  // Image and Name
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Row(
                      children: [
                        Container(
                          width: 70,
                          height: 70,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                              image: AssetImage(ekskul['imageAsset']),
                              fit: BoxFit.cover,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 10,
                                offset: const Offset(0, 5),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 15),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                ekskul['name'],
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.3),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Text(
                                  ekskul['role'],
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Role badge
                  Positioned(
                    top: 15,
                    right: 15,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.people,
                            size: 16,
                            color: Color(0xFF435059),
                          ),
                          const SizedBox(width: 5),
                          Text(
                            '${ekskul['members']} Anggota',
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF435059),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Content
            Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Schedule
                  Row(
                    children: [
                      const Icon(
                        Icons.calendar_today,
                        size: 16,
                        color: Color(0xFF435059),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          ekskul['schedule'],
                          style: const TextStyle(
                            fontSize: 14,
                            color: Color(0xFF435059),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  // Location
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on_outlined,
                        size: 16,
                        color: Color(0xFF435059),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        ekskul['location'],
                        style: const TextStyle(
                          fontSize: 14,
                          color: Color(0xFF435059),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  // Pembina
                  Row(
                    children: [
                      const Icon(
                        Icons.person_outline,
                        size: 16,
                        color: Color(0xFF435059),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        ekskul['pembina'],
                        style: const TextStyle(
                          fontSize: 14,
                          color: Color(0xFF435059),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  // Latest announcement if exists
                  if (ekskul['announcements'] != null && ekskul['announcements'].isNotEmpty)
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.amber.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: Colors.amber.withOpacity(0.3),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.campaign_outlined,
                                size: 16,
                                color: Colors.amber,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                ekskul['announcements'][0]['title'],
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.amber,
                                ),
                              ),
                              const Spacer(),
                              Text(
                                ekskul['announcements'][0]['date'],
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey[600],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 5),
                          Text(
                            ekskul['announcements'][0]['content'],
                            style: const TextStyle(
                              fontSize: 13,
                              color: Color(0xFF2C3A47),
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
            // Action button
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              decoration: BoxDecoration(
                color: const Color(0xFFF5F6FA),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton.icon(
                    onPressed: () {
                      // Open chat or messaging feature
                      _navigateToDiscussion(ekskul);();
                    },
                    icon: const Icon(
                      Icons.chat_outlined,
                      size: 18,
                    ),
                    label: const Text('Diskusi'),
                    style: TextButton.styleFrom(
                      foregroundColor: const Color(0xFF435059),
                    ),
                  ),
                  TextButton.icon(
                    onPressed: () {
                      setState(() {
                        _selectedEkskulIndex = index;
                      });
                    },
                    icon: const Icon(
                      Icons.visibility_outlined,
                      size: 18,
                    ),
                    label: const Text('Lihat Detail'),
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.blue,
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

  Widget _buildEkskulDetail(Map<String, dynamic> ekskul) {
    return ListView(
      padding: const EdgeInsets.only(bottom: 100),
      children: [
        // Hero image
        Container(
          height: 180,
          decoration: BoxDecoration(
            color: ekskul['color'],
            image: const DecorationImage(
              image: AssetImage('assets/logo/images/pattern_bg.png'),
              fit: BoxFit.cover,
              opacity: 0.1,
            ),
          ),
          child: Stack(
            children: [
Positioned.fill(
  child: Container(
    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage(ekskul['imageAsset']),
        fit: BoxFit.cover,
        opacity: 0.8,
      ),
    ),
  ),
),

              // Action buttons
              Positioned(
                top: 15,
                right: 15,
                child: Row(
                  children: [
                    _buildIconButton(
                      icon: Icons.chat_outlined,
                      onTap: () {
                        _navigateToDiscussion();
                      },
                    ),
                    const SizedBox(width: 10),
                    _buildIconButton(
                      icon: Icons.calendar_today_outlined,
                      onTap: () {
                        _showScheduleDialog(ekskul);
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        
        // Info section
        Container(
          padding: const EdgeInsets.all(20),
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Informasi Ekstrakurikuler',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2C3A47),
                ),
              ),
              const SizedBox(height: 15),
              _buildInfoItem(
                icon: Icons.calendar_today,
                title: 'Jadwal',
                content: ekskul['schedule'],
              ),
              _buildInfoItem(
                icon: Icons.location_on_outlined,
                title: 'Lokasi',
                content: ekskul['location'],
              ),
              _buildInfoItem(
                icon: Icons.person_outline,
                title: 'Pembina',
                content: ekskul['pembina'],
              ),
              _buildInfoItem(
                icon: Icons.people_outline,
                title: 'Jumlah Anggota',
                content: ekskul['members'].toString(),
              ),
              const SizedBox(height: 15),
              Text(
                ekskul['description'],
                style: const TextStyle(
                  fontSize: 14,
                  height: 1.5,
                  color: Color(0xFF2C3A47),
                ),
              ),
            ],
          ),
        ),
        
        const SizedBox(height: 10),
        
        // Announcements section
        Container(
          padding: const EdgeInsets.all(20),
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Pengumuman',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2C3A47),
                    ),
                  ),
                  if (ekskul['role'] == 'Ketua' || ekskul['role'] == 'Wakil Ketua')
                    TextButton.icon(
                      onPressed: () {
                        _showAddAnnouncementDialog(ekskul);
                      },
                      icon: const Icon(
                        Icons.add,
                        size: 18,
                      ),
                      label: const Text('Tambah'),
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.blue,
                      ),
                    ),
                ],
              ),
const SizedBox(height: 10),
if (ekskul['announcements'] == null || ekskul['announcements'].isEmpty)
  Center(
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: Column(
        children: [
          Icon(
            Icons.campaign_outlined,
            size: 50,
            color: Colors.grey[300],
          ),
          const SizedBox(height: 15),
          Text(
            'Belum ada pengumuman',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[500],
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    ),
  )
              else
                Column(
                  children: ekskul['announcements'].map<Widget>((announcement) {
                    return Container(
                      margin: const EdgeInsets.only(bottom: 15),
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: Colors.amber.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: Colors.amber.withOpacity(0.3),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.campaign_outlined,
                                size: 16,
                                color: Colors.amber,
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  announcement['title'],
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF2C3A47),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 5),
                          Text(
                            announcement['date'],
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey[600],
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            announcement['content'],
                            style: const TextStyle(
                              fontSize: 14,
                              height: 1.5,
                              color: Color(0xFF2C3A47),
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
            ],
          ),
        ),
        
        const SizedBox(height: 10),
        
        // Achievements section
        Container(
          padding: const EdgeInsets.all(20),
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Prestasi',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2C3A47),
                    ),
                  ),
                  if (ekskul['role'] == 'Ketua' || ekskul['role'] == 'Wakil Ketua')
                    TextButton.icon(
                      onPressed: () {
                        _showAddAchievementDialog(ekskul);
                      },
                      icon: const Icon(
                        Icons.add,
                        size: 18,
                      ),
                      label: const Text('Tambah'),
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.blue,
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 10),
              if (ekskul['achievements'] == null || ekskul['achievements'].isEmpty)
                Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 30),
                    child: Column(
                      children: [
                        Icon(
                          Icons.emoji_events_outlined,
                          size: 50,
                          color: Colors.grey[300],
                        ),
                        const SizedBox(height: 15),
                        Text(
                          'Belum ada prestasi',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey[500],
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              else
                Column(
                  children: ekskul['achievements'].map<Widget>((achievement) {
                    return Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.blue.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: Colors.blue.withOpacity(0.3),
                        ),
                      ),
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.blue.withOpacity(0.2),
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.emoji_events_outlined,
                              color: Colors.blue,
                              size: 18,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              achievement,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF2C3A47),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
            ],
          ),
        ),
        
        const SizedBox(height: 10),
        
        // Action buttons section
        Container(
          padding: const EdgeInsets.all(20),
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Aksi',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2C3A47),
                ),
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  Expanded(
                    child: _buildActionButton(
                      icon: Icons.group_outlined,
                      label: 'Anggota',
                      color: Colors.blue,
                      onTap: () {
                        _showMembersDialog(ekskul);
                      },
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: _buildActionButton(
                      icon: Icons.chat_outlined,
                      label: 'Diskusi',
                      color: Colors.green,
                      onTap: () {
                        _navigateToDiscussion();
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  Expanded(
                    child: _buildActionButton(
                      icon: Icons.photo_library_outlined,
                      label: 'Galeri',
                      color: Colors.purple,
                      onTap: () {
                        _showGalleryDialog();
                      },
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: _buildActionButton(
                      icon: Icons.assignment_outlined,
                      label: 'Tugas',
                      color: Colors.orange,
                      onTap: () {
                        _showTasksDialog();
                      },
                    ),
                  ),
                ],
              ),
              if (ekskul['role'] == 'Ketua' || ekskul['role'] == 'Wakil Ketua')
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Row(
                    children: [
                      Expanded(
                        child: _buildActionButton(
                          icon: Icons.settings_outlined,
                          label: 'Pengaturan',
                          color: Colors.grey,
                          onTap: () {
                            _showSettingsDialog();
                          },
                        ),
                      ),
                      const SizedBox(width: 15),
                      Expanded(
                        child: Container(), // Placeholder for layout balance
                      ),
                    ],
                  ),
                ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () {
                    _showLeaveConfirmationDialog(ekskul);
                  },
                  icon: const Icon(Icons.exit_to_app),
                  label: const Text('Keluar dari Ekstrakurikuler'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        
        const SizedBox(height: 80),
      ],
    );
  }

  Widget _buildInfoItem({
    required IconData icon,
    required String title,
    required String content,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: const Color(0xFFF5F6FA),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              icon,
              size: 18,
              color: const Color(0xFF435059),
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey[600],
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  content,
                  style: const TextStyle(
                    fontSize: 15,
                    color: Color(0xFF2C3A47),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: color.withOpacity(0.3),
          ),
        ),
        child: Column(
          children: [
            Icon(
              icon,
              color: color,
              size: 24,
            ),
            const SizedBox(height: 8),
            Text(
              label,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIconButton({
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 5,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Icon(
          icon,
          color: const Color(0xFF435059),
          size: 20,
        ),
      ),
    );
  }

  // Dialog methods
void _showJoinEkskulDialog() async {
  final result = await showDialog<bool>(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text('Gabung Ekstrakurikuler Baru'),
      content: const Text('Fitur ini akan mengarahkan ke halaman daftar ekstrakurikuler yang tersedia.'),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context, false),
          child: const Text('Batal'),
        ),
        ElevatedButton(
          onPressed: () => Navigator.pop(context, true),
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF435059),
          ),
          child: const Text('Lanjutkan'),
        ),
      ],
    ),
  );

  if (result == true) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => EkskulSelectionPage()),
    );
  }
}


  void _showLeaveConfirmationDialog(Map<String, dynamic> ekskul) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Keluar dari ${ekskul['name']}'),
        content: const Text(
          'Apakah Anda yakin ingin keluar dari ekstrakurikuler ini? '
          'Anda perlu mendaftar ulang jika ingin bergabung kembali di kemudian hari.',
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Batal'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              // Logic to leave ekstrakurikuler
              setState(() {
                // For demo purposes only
                joinedEkskul.removeWhere((item) => item['name'] == ekskul['name']);
                _selectedEkskulIndex = null;
              });
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Anda telah keluar dari ${ekskul['name']}'),
                  backgroundColor: Colors.red,
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
            ),
            child: const Text('Keluar'),
          ),
        ],
      ),
    );
  }

void _navigateToDiscussion([Map<String, dynamic>? ekskulData]) {
  Map<String, dynamic> targetEkskul;
  
  if (ekskulData != null) {
    // Jika dipanggil dari card dengan parameter ekskulData
    targetEkskul = ekskulData;
  } else if (_selectedEkskulIndex != null) {
    // Jika dipanggil dari detail page
    targetEkskul = _filteredEkskul[_selectedEkskulIndex!];
  } else {
    // Fallback jika tidak ada data
    return;
  }
  
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => EkskulDiscussionPage(
        ekskul: targetEkskul,
      ),
    ),
  );
}

  void _showScheduleDialog(Map<String, dynamic> ekskul) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Jadwal ${ekskul['name']}'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Jadwal Reguler:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.grey[800],
              ),
            ),
            const SizedBox(height: 5),
            Text(ekskul['schedule']),
            const SizedBox(height: 15),
            Text(
              'Lokasi:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.grey[800],
              ),
            ),
            const SizedBox(height: 5),
            Text(ekskul['location']),
            const SizedBox(height: 15),
            const Text(
              'Fitur kalender kegiatan akan tersedia pada pembaruan mendatang.',
              style: TextStyle(
                fontStyle: FontStyle.italic,
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
          ],
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF435059),
            ),
            child: const Text('Tutup'),
          ),
        ],
      ),
    );
  }

  void _showAddAnnouncementDialog(Map<String, dynamic> ekskul) {
    final titleController = TextEditingController();
    final contentController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Tambah Pengumuman Baru'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                labelText: 'Judul Pengumuman',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: contentController,
              decoration: const InputDecoration(
                labelText: 'Isi Pengumuman',
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Batal'),
          ),
          ElevatedButton(
            onPressed: () {
              if (titleController.text.isNotEmpty && contentController.text.isNotEmpty) {
                // Add new announcement
                setState(() {
                  ekskul['announcements'].insert(0, {
                    'title': titleController.text,
                    'date': '19 Mei 2025', // Current date for demo
                    'content': contentController.text,
                  });
                });
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Pengumuman berhasil ditambahkan'),
                    backgroundColor: Colors.green,
                  ),
                );
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF435059),
            ),
            child: const Text('Simpan'),
          ),
        ],
      ),
    );
  }

  void _showAddAchievementDialog(Map<String, dynamic> ekskul) {
    final achievementController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Tambah Prestasi Baru'),
        content: TextField(
          controller: achievementController,
          decoration: const InputDecoration(
            labelText: 'Deskripsi Prestasi',
            border: OutlineInputBorder(),
            hintText: 'Contoh: Juara 1 Kompetisi Basket Antar SMP 2025',
          ),
          maxLines: 2,
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Batal'),
          ),
          ElevatedButton(
            onPressed: () {
              if (achievementController.text.isNotEmpty) {
                // Add new achievement
                setState(() {
                  if (ekskul['achievements'] == null) {
                    ekskul['achievements'] = [];
                  }
                  ekskul['achievements'].insert(0, achievementController.text);
                });
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Prestasi berhasil ditambahkan'),
                    backgroundColor: Colors.green,
                  ),
                );
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF435059),
            ),
            child: const Text('Simpan'),
          ),
        ],
      ),
    );
  }

  void _showMembersDialog(Map<String, dynamic> ekskul) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Anggota ${ekskul['name']}'),
        content: const Text('Fitur daftar anggota akan tersedia pada versi mendatang.'),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF435059),
            ),
            child: const Text('Tutup'),
          ),
        ],
      ),
    );
  }

  void _showGalleryDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Galeri Kegiatan'),
        content: const Text('Fitur galeri kegiatan akan tersedia pada versi mendatang.'),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF435059),
            ),
            child: const Text('Tutup'),
          ),
        ],
      ),
    );
  }

  void _showTasksDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Tugas & Tanggung Jawab'),
        content: const Text('Fitur tugas dan tanggung jawab akan tersedia pada versi mendatang.'),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF435059),
            ),
            child: const Text('Tutup'),
          ),
        ],
      ),
    );
  }

  void _showSettingsDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Pengaturan Ekstrakurikuler'),
        content: const Text('Fitur pengaturan ekstrakurikuler akan tersedia pada versi mendatang.'),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF435059),
            ),
            child: const Text('Tutup'),
          ),
        ],
      ),
    );
  }
}