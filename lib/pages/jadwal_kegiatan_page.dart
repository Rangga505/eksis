import 'package:flutter/material.dart';
import '../widgets/common_header.dart';
import '../widgets/common_navbar.dart';

class JadwalKegiatanPage extends StatefulWidget {
  const JadwalKegiatanPage({super.key});

  @override
  State<JadwalKegiatanPage> createState() => _JadwalKegiatanPageState();
}

class _JadwalKegiatanPageState extends State<JadwalKegiatanPage> with TickerProviderStateMixin {
  late TabController _tabController;
  DateTime _selectedDate = DateTime.now();
  String _selectedMonth = _getCurrentMonthName();
  String _selectedFilter = 'Semua';
  final List<String> _filters = ['Semua',];
  
  // Data jadwal - dalam aplikasi nyata ini akan berasal dari database/API
  final List<Map<String, dynamic>> _jadwalKegiatan = [
    {
      'id': 1,
      'nama': 'Latihan Rutin Pramuka',
      'ekskul': 'Pramuka',
      'tanggal': '22 Mei 2025',
      'waktu': '15:30 - 17:00',
      'tempat': 'Lapangan Utama',
      'deskripsi': 'Latihan rutin mingguan untuk anggota Pramuka',
      'jenis': 'Rutin',
      'color': Colors.green,
      'icon': Icons.forest
    },
    {
      'id': 2,
      'nama': 'Pertandingan Persahabatan Basket',
      'ekskul': 'Basket',
      'tanggal': '23 Mei 2025',
      'waktu': '14:00 - 16:30',
      'tempat': 'GOR Sekolah',
      'deskripsi': 'Pertandingan persahabatan dengan SMA Negeri 5',
      'jenis': 'Kompetisi',
      'color': Colors.orange,
      'icon': Icons.sports_basketball
    },
    {
      'id': 3,
      'nama': 'Latihan Taktik Sepak Bola',
      'ekskul': 'Sepak Bola',
      'tanggal': '24 Mei 2025',
      'waktu': '15:00 - 17:30',
      'tempat': 'Lapangan Sepak Bola',
      'deskripsi': 'Latihan formasi dan taktik untuk persiapan turnamen',
      'jenis': 'Rutin',
      'color': Colors.blue,
      'icon': Icons.sports_soccer
    },
    {
      'id': 4,
      'nama': 'Latihan Voli',
      'ekskul': 'Bola Voli',
      'tanggal': '25 Mei 2025',
      'waktu': '15:30 - 17:00',
      'tempat': 'Lapangan Voli',
      'deskripsi': 'Latihan rutin dan pengembangan teknik smash',
      'jenis': 'Rutin',
      'color': Colors.purple,
      'icon': Icons.sports_volleyball
    },
    {
      'id': 5,
      'nama': 'Pelatihan Pertolongan Pertama',
      'ekskul': 'PMR',
      'tanggal': '26 Mei 2025',
      'waktu': '14:00 - 16:00',
      'tempat': 'Ruang UKS',
      'deskripsi': 'Pelatihan pertolongan pertama untuk anggota baru',
      'jenis': 'Pelatihan',
      'color': Colors.red,
      'icon': Icons.medical_services
    },
    {
      'id': 6,
      'nama': 'Rapat Koordinasi Pramuka',
      'ekskul': 'Pramuka',
      'tanggal': '27 Mei 2025',
      'waktu': '13:30 - 15:00',
      'tempat': 'Ruang Rapat',
      'deskripsi': 'Rapat koordinasi untuk persiapan perkemahan',
      'jenis': 'Rapat',
      'color': Colors.green,
      'icon': Icons.forest
    },
    {
      'id': 7,
      'nama': 'Seleksi Tim Basket',
      'ekskul': 'Basket',
      'tanggal': '28 Mei 2025',
      'waktu': '15:00 - 17:00',
      'tempat': 'GOR Sekolah',
      'deskripsi': 'Seleksi pemain untuk tim inti turnamen',
      'jenis': 'Seleksi',
      'color': Colors.orange,
      'icon': Icons.sports_basketball
    },
    {
      'id': 8,
      'nama': 'Pertandingan Final Sepak Bola',
      'ekskul': 'Sepak Bola',
      'tanggal': '30 Mei 2025',
      'waktu': '14:30 - 16:30',
      'tempat': 'Stadion Sekolah',
      'deskripsi': 'Final turnamen sepak bola antar sekolah',
      'jenis': 'Kompetisi',
      'color': Colors.blue,
      'icon': Icons.sports_soccer
    },
  ];

  List<Map<String, dynamic>> get filteredJadwal {
    return _jadwalKegiatan.where((jadwal) {
      // Filter berdasarkan ekskul
      if (_selectedFilter != 'Semua' && jadwal['ekskul'] != _selectedFilter) {
        return false;
      }
      
      // Implementasi filter lebih lanjut berdasarkan bulan/minggu dapat ditambahkan di sini
      
      return true;
    }).toList();
  }

  static String _getCurrentMonthName() {
    final now = DateTime.now();
    final months = [
      'Januari', 'Februari', 'Maret', 'April', 'Mei', 'Juni',
      'Juli', 'Agustus', 'September', 'Oktober', 'November', 'Desember'
    ];
    return months[now.month - 1];
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
@override
Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: const Color(0xFF2C3A47),
    body: SafeArea(
      bottom: false,
      child: Column(
        children: [
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
                    // Page Title and Filter
                    _buildPageHeader(),
                    
                    // Tab Bar for Different Views
                    _buildTabBar(),
                    
                    // Tab content - Calendar, List, Weekly views
                    Expanded(
                      child: Container(
                        // Tambahkan padding bottom untuk navbar
                        padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom + 80),
                        child: TabBarView(
                          controller: _tabController,
                          children: [
                            // Tampilan Kalender
                            _buildCalendarView(),
                            
                            // Tampilan Daftar
                            _buildListView(),
                            
                            // Tampilan Mingguan
                            _buildWeeklyView(),
                          ],
                        ),
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
    floatingActionButton: FloatingActionButton(
      backgroundColor: const Color(0xFF2C3A47),
      child: const Icon(Icons.add, color: Colors.white),
      onPressed: () {
        _showTambahJadwalDialog(context);
      },
    ),
  );
}

  Widget _buildPageHeader() {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: const [
                  Icon(Icons.calendar_month, size: 24, color: Color(0xFF2C3A47)),
                  SizedBox(width: 8),
                  Text(
                    'Jadwal Kegiatan',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2C3A47),
                    ),
                  ),
                ],
              ),
              IconButton(
                icon: const Icon(Icons.filter_list, color: Color(0xFF2C3A47)),
                onPressed: () {
                  _showFilterDialog(context);
                },
              ),
            ],
          ),
          const SizedBox(height: 5),
          
          // Filter chips
          SizedBox(
            height: 40,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: _filters.map((filter) {
                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: FilterChip(
                    label: Text(filter),
                    selected: _selectedFilter == filter,
                    selectedColor: const Color(0xFF4E92DF).withOpacity(0.2),
                    checkmarkColor: const Color(0xFF4E92DF),
                    labelStyle: TextStyle(
                      color: _selectedFilter == filter
                          ? const Color(0xFF4E92DF)
                          : Colors.grey[700],
                      fontWeight: _selectedFilter == filter
                          ? FontWeight.bold
                          : FontWeight.normal,
                    ),
                    onSelected: (selected) {
                      setState(() {
                        _selectedFilter = filter;
                      });
                    },
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabBar() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: TabBar(
        controller: _tabController,
        labelColor: const Color(0xFF4E92DF),
        unselectedLabelColor: Colors.grey[600],
        indicatorColor: const Color(0xFF4E92DF),
        tabs: const [
          Tab(
            icon: Icon(Icons.calendar_month),
            text: 'Kalender',
          ),
          Tab(
            icon: Icon(Icons.list),
            text: 'Daftar',
          ),
          Tab(
            icon: Icon(Icons.view_week),
            text: 'Mingguan',
          ),
        ],
      ),
    );
  }

  Widget _buildCalendarView() {
    // Simplified calendar implementation
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Month selector
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.chevron_left),
                  onPressed: () {
                    // Navigate to previous month
                    setState(() {
                      final months = [
                        'Januari', 'Februari', 'Maret', 'April', 'Mei', 'Juni',
                        'Juli', 'Agustus', 'September', 'Oktober', 'November', 'Desember'
                      ];
                      final currentIndex = months.indexOf(_selectedMonth);
                      if (currentIndex > 0) {
                        _selectedMonth = months[currentIndex - 1];
                      } else {
                        _selectedMonth = months[11]; // December
                      }
                    });
                  },
                ),
                Text(
                  '$_selectedMonth 2025',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.chevron_right),
                  onPressed: () {
                    // Navigate to next month
                    setState(() {
                      final months = [
                        'Januari', 'Februari', 'Maret', 'April', 'Mei', 'Juni',
                        'Juli', 'Agustus', 'September', 'Oktober', 'November', 'Desember'
                      ];
                      final currentIndex = months.indexOf(_selectedMonth);
                      if (currentIndex < months.length - 1) {
                        _selectedMonth = months[currentIndex + 1];
                      } else {
                        _selectedMonth = months[0]; // January
                      }
                    });
                  },
                ),
              ],
            ),
          ),
          
          // Simple calendar grid (just as a visual example)
          GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 7,
              childAspectRatio: 1,
            ),
            itemCount: 35, // 5 weeks * 7 days
            itemBuilder: (context, index) {
              // First row shows day names
              if (index < 7) {
                final days = ['M', 'S', 'S', 'R', 'K', 'J', 'S'];
                return Center(
                  child: Text(
                    days[index],
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[700],
                    ),
                  ),
                );
              }
              
              // Days of the month
              final dayNum = index - 6;
              bool hasEvent = false;
              
              // Check if there's an event on this day (simplified)
              // In a real app, you would check actual dates
              if (_selectedMonth == 'Mei' && (dayNum == 16 || dayNum == 20 || dayNum == 22 || dayNum == 25)) {
                hasEvent = true;
              }
              
              return GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedDate = DateTime(2025, 5, dayNum);
                  });
                  
                  if (hasEvent) {
                    // Show events for this day
                    _showEventsForDay(context, dayNum);
                  }
                },
                child: Container(
                  margin: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: _selectedDate.day == dayNum
                        ? const Color(0xFF4E92DF)
                        : hasEvent
                            ? const Color(0xFF4E92DF).withOpacity(0.1)
                            : Colors.transparent,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          dayNum.toString(),
                          style: TextStyle(
                            color: _selectedDate.day == dayNum
                                ? Colors.white
                                : hasEvent
                                    ? const Color(0xFF4E92DF)
                                    : Colors.black,
                            fontWeight: hasEvent ? FontWeight.bold : FontWeight.normal,
                          ),
                        ),
                        if (hasEvent)
                          Container(
                            width: 5,
                            height: 5,
                            decoration: BoxDecoration(
                              color: _selectedDate.day == dayNum
                                  ? Colors.white
                                  : const Color(0xFF4E92DF),
                              shape: BoxShape.circle,
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
          
          const SizedBox(height: 20),
          const Text(
            'Acara Hari Ini',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          
          // Events for selected date
          Column(
            children: [
              _buildEventTile(filteredJadwal[0]),
              _buildEventTile(filteredJadwal[1]),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildListView() {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: filteredJadwal.length,
      itemBuilder: (context, index) {
        final jadwal = filteredJadwal[index];
        return _buildEventCard(jadwal);
      },
    );
  }

  Widget _buildWeeklyView() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Week selector
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.chevron_left),
                  onPressed: () {
                    // Navigate to previous week
                  },
                ),
                const Text(
                  'Minggu 20 - 26 Mei 2025',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.chevron_right),
                  onPressed: () {
                    // Navigate to next week
                  },
                ),
              ],
            ),
          ),
          
          // Week day selector
          SizedBox(
            height: 90,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 7,
              itemBuilder: (context, index) {
                final day = DateTime.now().add(Duration(days: index - 3));
                final dayNum = day.day;
                final isToday = index == 3;
                
                final dayNames = ['Min', 'Sen', 'Sel', 'Rab', 'Kam', 'Jum', 'Sab'];
                final dayName = dayNames[day.weekday % 7];
                
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedDate = day;
                    });
                  },
                  child: Container(
                    width: 60,
                    margin: const EdgeInsets.only(right: 8),
                    decoration: BoxDecoration(
                      color: isToday
                          ? const Color(0xFF4E92DF)
                          : Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          blurRadius: 5,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          dayName,
                          style: TextStyle(
                            color: isToday ? Colors.white : Colors.grey[600],
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: isToday
                                ? Colors.white
                                : const Color(0xFF4E92DF).withOpacity(0.1),
                          ),
                          child: Text(
                            dayNum.toString(),
                            style: TextStyle(
                              color: isToday
                                  ? const Color(0xFF4E92DF)
                                  : const Color(0xFF2C3A47),
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          
          const SizedBox(height: 16),
          
          // Timeline events
          Column(
            children: [
              _buildTimelineItem('08:00', 'Apel Pagi', Colors.grey),
              _buildTimelineItem('15:30', filteredJadwal[0]['nama'], filteredJadwal[0]['color']),
              _buildTimelineItem('16:00', filteredJadwal[3]['nama'], filteredJadwal[3]['color']),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildEventCard(Map<String, dynamic> jadwal) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(15),
        onTap: () {
          _showEventDetailDialog(context, jadwal);
        },
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Left date column
              Container(
                width: 50,
                height: 60,
                decoration: BoxDecoration(
                  color: jadwal['color'].withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      jadwal['tanggal'].split(' ')[0],
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: jadwal['color'],
                      ),
                    ),
                    Text(
                      jadwal['tanggal'].split(' ')[1],
                      style: TextStyle(
                        fontSize: 12,
                        color: jadwal['color'],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 15),
              // Event details
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: jadwal['color'].withOpacity(0.1),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                jadwal['icon'],
                                size: 12,
                                color: jadwal['color'],
                              ),
                              const SizedBox(width: 4),
                              Text(
                                jadwal['ekskul'],
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: jadwal['color'],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Spacer(),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: _getJenisColor(jadwal['jenis']).withOpacity(0.1),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            jadwal['jenis'],
                            style: TextStyle(
                              fontSize: 12,
                              color: _getJenisColor(jadwal['jenis']),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      jadwal['nama'],
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
                          Icons.access_time,
                          size: 14,
                          color: Colors.grey[600],
                        ),
                        const SizedBox(width: 4),
                        Text(
                          jadwal['waktu'],
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[600],
                          ),
                        ),
                        const SizedBox(width: 16),
                        Icon(
                          Icons.location_on,
                          size: 14,
                          color: Colors.grey[600],
                        ),
                        const SizedBox(width: 4),
                        Text(
                          jadwal['tempat'],
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
      ),
    );
  }

  Widget _buildEventTile(Map<String, dynamic> jadwal) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: jadwal['color'].withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              jadwal['icon'],
              color: jadwal['color'],
              size: 20,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  jadwal['nama'],
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2C3A47),
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Icon(
                      Icons.access_time,
                      size: 12,
                      color: Colors.grey[600],
                    ),
                    const SizedBox(width: 4),
                    Text(
                      jadwal['waktu'],
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
          const Icon(
            Icons.chevron_right,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }

  Widget _buildTimelineItem(String time, String eventName, Color color) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Time column
        SizedBox(
          width: 70,
          child: Text(
            time,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.grey[700],
            ),
          ),
        ),
        // Timeline indicator
        Column(
          children: [
            Container(
              width: 15,
              height: 15,
              decoration: BoxDecoration(
                color: color.withOpacity(0.2),
                shape: BoxShape.circle,
                border: Border.all(
                  color: color,
                  width: 2,
                ),
              ),
            ),
            Container(
              width: 2,
              height: 50,
              color: Colors.grey.withOpacity(0.3),
            ),
          ],
        ),
        const SizedBox(width: 10),
        // Event details
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(bottom: 20),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  blurRadius: 5,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  eventName,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2C3A47),
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Icon(
                      Icons.location_on,
                      size: 12,
                      color: Colors.grey[600],
                    ),
                    const SizedBox(width: 4),
                    Text(
                      'Lapangan Utama',
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
        ),
      ],
    );
  }

  Color _getJenisColor(String jenis) {
    switch (jenis) {
      case 'Rutin':
        return Colors.blue;
      case 'Kompetisi':
        return Colors.orange;
      case 'Pelatihan':
        return Colors.purple;
      case 'Rapat':
        return Colors.teal;
      case 'Seleksi':
        return Colors.deepOrange;
      default:
        return Colors.grey;
    }
  }

  void _showFilterDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Filter Jadwal'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Ekskul', style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8.0,
                  runSpacing: 8.0,
                  children: _filters.map((filter) {
                    return FilterChip(
                      label: Text(filter),
                      selected: _selectedFilter == filter,
                      onSelected: (selected) {
                        setState(() {
                          _selectedFilter = filter;
                          Navigator.pop(context);
                        });
                      },
                    );
                  }).toList(),
                ),
                const SizedBox(height: 16),
                const Text('Jenis Kegiatan', style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8.0,
                  runSpacing: 8.0,
                  children: ['Semua', 'Rutin', 'Kompetisi', 'Pelatihan', 'Rapat', 'Seleksi']
                      .map((jenis) {
                    return FilterChip(
                      label: Text(jenis),
                      selected: false, // Add state variable for this if needed
                      onSelected: (selected) {
                        // Implement filtering by jenis kegiatan
                        Navigator.pop(context);
                      },
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              child: const Text('Reset Filter'),
              onPressed: () {
                setState(() {
                  _selectedFilter = 'Semua';
                });
                Navigator.pop(context);
              },
            ),
            TextButton(
              child: const Text('Tutup'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  void _showEventsForDay(BuildContext context, int day) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return DraggableScrollableSheet(
          initialChildSize: 0.6,
          minChildSize: 0.4,
          maxChildSize: 0.9,
          expand: false,
          builder: (context, scrollController) {
            return Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      width: 50,
                      height: 5,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    '$day Mei 2025',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    '${filteredJadwal.length} kegiatan',
                    style: TextStyle(
                      color: Colors.grey[600],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: ListView.builder(
                      controller: scrollController,
                      itemCount: filteredJadwal.length,
                      itemBuilder: (context, index) {
                        return _buildEventTile(filteredJadwal[index]);
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  void _showEventDetailDialog(BuildContext context, Map<String, dynamic> jadwal) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: jadwal['color'].withOpacity(0.1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(
                        jadwal['icon'],
                        color: jadwal['color'],
                        size: 24,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            jadwal['nama'],
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            jadwal['ekskul'],
                            style: TextStyle(
                              color: jadwal['color'],
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.edit, color: Colors.grey),
                      onPressed: () {
                        Navigator.pop(context);
                        // Show edit dialog
                        _showEditJadwalDialog(context, jadwal);
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const Divider(),
                const SizedBox(height: 10),
                _buildDetailItem(Icons.calendar_today, 'Tanggal', jadwal['tanggal']),
                _buildDetailItem(Icons.access_time, 'Waktu', jadwal['waktu']),
                _buildDetailItem(Icons.location_on, 'Tempat', jadwal['tempat']),
                _buildDetailItem(Icons.category, 'Jenis', jadwal['jenis']),
                const SizedBox(height: 10),
                const Text(
                  'Deskripsi',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  jadwal['deskripsi'],
                  style: TextStyle(
                    color: Colors.grey[700],
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        // Show delete confirmation
                        _showDeleteConfirmation(context, jadwal);
                      },
                      child: Text(
                        'Hapus',
                        style: TextStyle(color: Colors.red[700]),
                      ),
                    ),
                    const SizedBox(width: 10),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF4E92DF),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Tutup'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildDetailItem(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Row(
        children: [
          Icon(icon, size: 16, color: Colors.grey[600]),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey[600],
                ),
              ),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _showDeleteConfirmation(BuildContext context, Map<String, dynamic> jadwal) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Konfirmasi Hapus'),
          content: Text('Apakah Anda yakin ingin menghapus kegiatan "${jadwal['nama']}"?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Batal'),
            ),
            TextButton(
              onPressed: () {
                // Delete the item
                setState(() {
                  _jadwalKegiatan.removeWhere((item) => item['id'] == jadwal['id']);
                });
                Navigator.pop(context); // Close confirmation dialog
                Navigator.pop(context); // Close detail dialog
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Kegiatan "${jadwal['nama']}" telah dihapus'),
                    backgroundColor: Colors.red,
                  ),
                );
              },
              child: Text(
                'Hapus',
                style: TextStyle(color: Colors.red[700]),
              ),
            ),
          ],
        );
      },
    );
  }

  void _showEditJadwalDialog(BuildContext context, Map<String, dynamic> jadwal) {
    // Implement edit dialog (similar to add dialog but pre-filled)
    // This would be similar to _showTambahJadwalDialog but with pre-filled values
  }

  void _showTambahJadwalDialog(BuildContext context) {
    final namaController = TextEditingController();
    final tempatController = TextEditingController();
    final deskripsiController = TextEditingController();
    String selectedEkskul = 'Pramuka';
    String selectedJenis = 'Rutin';
    DateTime selectedDate = DateTime.now();
    TimeOfDay startTime = TimeOfDay.now();
    TimeOfDay endTime = TimeOfDay(hour: TimeOfDay.now().hour + 1, minute: TimeOfDay.now().minute);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Dialog(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              child: Container(
                padding: const EdgeInsets.all(20),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Tambah Jadwal Kegiatan',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextField(
                        controller: namaController,
                        decoration: const InputDecoration(
                          labelText: 'Nama Kegiatan',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 15),
                      DropdownButtonFormField<String>(
                        decoration: const InputDecoration(
                          labelText: 'Ekskul',
                          border: OutlineInputBorder(),
                        ),
                        value: selectedEkskul,
                        items: _filters
                            .where((filter) => filter != 'Semua')
                            .map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          setState(() {
                            selectedEkskul = newValue!;
                          });
                        },
                      ),
                      const SizedBox(height: 15),
                      Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () async {
                                final date = await showDatePicker(
                                  context: context,
                                  initialDate: selectedDate,
                                  firstDate: DateTime.now(),
                                  lastDate: DateTime.now().add(const Duration(days: 365)),
                                );
                                if (date != null) {
                                  setState(() {
                                    selectedDate = date;
                                  });
                                }
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '${selectedDate.day}/${selectedDate.month}/${selectedDate.year}',
                                      style: const TextStyle(fontSize: 16),
                                    ),
                                    const Icon(Icons.calendar_today, size: 18),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () async {
                                final time = await showTimePicker(
                                  context: context,
                                  initialTime: startTime,
                                );
                                if (time != null) {
                                  setState(() {
                                    startTime = time;
                                  });
                                }
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Mulai: ${startTime.format(context)}',
                                      style: const TextStyle(fontSize: 14),
                                    ),
                                    
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: GestureDetector(
                              onTap: () async {
                                final time = await showTimePicker(
                                  context: context,
                                  initialTime: endTime,
                                );
                                if (time != null) {
                                  setState(() {
                                    endTime = time;
                                  });
                                }
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Selesai: ${endTime.format(context)}',
                                      style: const TextStyle(fontSize: 14),
                                    ),
                                    
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      TextField(
                        controller: tempatController,
                        decoration: const InputDecoration(
                          labelText: 'Tempat',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 15),
                      DropdownButtonFormField<String>(
                        decoration: const InputDecoration(
                          labelText: 'Jenis Kegiatan',
                          border: OutlineInputBorder(),
                        ),
                        value: selectedJenis,
                        items: ['Rutin', 'Kompetisi', 'Pelatihan', 'Rapat', 'Seleksi']
                            .map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          setState(() {
                            selectedJenis = newValue!;
                          });
                        },
                      ),
                      const SizedBox(height: 15),
                      TextField(
                        controller: deskripsiController,
                        maxLines: 3,
                        decoration: const InputDecoration(
                          labelText: 'Deskripsi',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('Batal'),
                          ),
                          const SizedBox(width: 10),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF4E92DF),
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            onPressed: () {
                              // Add new schedule
                              final newJadwal = {
                                'id': _jadwalKegiatan.length + 1,
                                'nama': namaController.text,
                                'ekskul': selectedEkskul,
                                'tanggal': '${selectedDate.day} Mei 2025',
                                'waktu': '${startTime.format(context)} - ${endTime.format(context)}',
                                'tempat': tempatController.text,
                                'deskripsi': deskripsiController.text,
                                'jenis': selectedJenis,
                                'color': _getEkskulColor(selectedEkskul),
                                'icon': _getEkskulIcon(selectedEkskul),
                              };
                              
                              setState(() {
                                _jadwalKegiatan.add(newJadwal);
                              });
                              
                              Navigator.pop(context);
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Jadwal berhasil ditambahkan'),
                                  backgroundColor: Color(0xFF4E92DF),
                                ),
                              );
                            },
                            child: const Text('Simpan'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  Color _getEkskulColor(String ekskul) {
    switch (ekskul) {
      case 'Pramuka':
        return Colors.green;
      case 'Basket':
        return Colors.orange;
      case 'Sepak Bola':
        return Colors.blue;
      case 'Bola Voli':
        return Colors.purple;
      case 'PMR':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  IconData _getEkskulIcon(String ekskul) {
    switch (ekskul) {
      case 'Pramuka':
        return Icons.forest;
      case 'Basket':
        return Icons.sports_basketball;
      case 'Sepak Bola':
        return Icons.sports_soccer;
      case 'Bola Voli':
        return Icons.sports_volleyball;
      case 'PMR':
        return Icons.medical_services;
      default:
        return Icons.star;
    }
  }
}