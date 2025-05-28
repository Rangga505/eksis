import 'package:flutter/material.dart';
import '../widgets/common_header.dart';
import '../widgets/common_navbar.dart';

class HelpCenterPage extends StatefulWidget {
  const HelpCenterPage({super.key});

  @override
  State<HelpCenterPage> createState() => _HelpCenterPageState();
}

class _HelpCenterPageState extends State<HelpCenterPage> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';
  int _selectedFaqIndex = -1;
  
  // FAQ Data
  final List<Map<String, String>> _faqs = [
    {
      'question': 'Bagaimana cara mendaftar ekstrakurikuler?',
      'answer': 'Untuk mendaftar ekstrakurikuler, buka halaman "Ekstrakurikuler", pilih kegiatan yang diminati, lalu klik tombol "Daftar". Pastikan Anda telah melengkapi profil terlebih dahulu.',
    },
    {
      'question': 'Apakah bisa mendaftar lebih dari satu ekstrakurikuler?',
      'answer': 'Ya, Anda dapat mendaftar hingga 3 ekstrakurikuler sekaligus. Namun pastikan jadwal kegiatan tidak bertabrakan satu sama lain.',
    },
    {
      'question': 'Bagaimana cara melihat jadwal kegiatan?',
      'answer': 'Jadwal kegiatan dapat dilihat di halaman "Jadwal" atau pada detail setiap ekstrakurikuler yang telah Anda ikuti. Notifikasi akan dikirim sebelum kegiatan dimulai.',
    },
    {
      'question': 'Bagaimana cara mengajukan izin tidak hadir?',
      'answer': 'Buka halaman kegiatan ekstrakurikuler Anda, pilih jadwal yang akan dilewatkan, lalu klik "Ajukan Izin". Isi alasan dan upload surat keterangan jika diperlukan.',
    },
    {
      'question': 'Dimana saya bisa melihat prestasi dan sertifikat?',
      'answer': 'Prestasi dan sertifikat dapat dilihat di halaman "Profil" pada bagian "Prestasi Saya". Anda juga dapat mengunduh sertifikat dalam format PDF.',
    },
    {
      'question': 'Bagaimana cara keluar dari ekstrakurikuler?',
      'answer': 'Untuk keluar dari ekstrakurikuler, buka detail kegiatan, lalu pilih "Keluar dari Kegiatan". Konfirmasi keputusan Anda dengan mengisi alasan.',
    },
    {
      'question': 'Apakah ada biaya untuk mengikuti ekstrakurikuler?',
      'answer': 'Sebagian besar ekstrakurikuler gratis. Namun beberapa kegiatan seperti olahraga tertentu mungkin memerlukan biaya untuk peralatan atau seragam.',
    },
    {
      'question': 'Bagaimana cara menghubungi pembina ekstrakurikuler?',
      'answer': 'Anda dapat menghubungi pembina melalui fitur chat yang tersedia di detail setiap ekstrakurikuler, atau melalui kontak yang tertera di profil pembina.',
    },
  ];

  // Tutorial/Guide Data
  final List<Map<String, dynamic>> _guides = [
    {
      'title': 'Memulai dengan Aplikasi',
      'description': 'Panduan lengkap untuk pengguna baru',
      'icon': Icons.play_circle_outline,
      'color': Colors.blue,
      'steps': [
        'Lengkapi profil Anda terlebih dahulu',
        'Jelajahi ekstrakurikuler yang tersedia',
        'Daftar ekstrakurikuler yang diminati',
        'Pantau jadwal dan kegiatan Anda',
      ],
    },
    {
      'title': 'Mengelola Ekstrakurikuler',
      'description': 'Cara mengelola kegiatan ekstrakurikuler Anda',
      'icon': Icons.sports,
      'color': Colors.green,
      'steps': [
        'Lihat jadwal kegiatan di halaman Jadwal',
        'Atur notifikasi untuk setiap kegiatan',
        'Ajukan izin jika tidak bisa hadir',
        'Pantau kehadiran dan nilai Anda',
      ],
    },
    {
      'title': 'Fitur Komunikasi',
      'description': 'Berkomunikasi dengan pembina dan anggota',
      'icon': Icons.chat_bubble_outline,
      'color': Colors.purple,
      'steps': [
        'Gunakan fitur chat untuk berkomunikasi',
        'Ikuti pengumuman dari pembina',
        'Bagikan pengalaman di forum',
        'Laporkan masalah jika ada',
      ],
    },
    {
      'title': 'Sertifikat dan Prestasi',
      'description': 'Mengelola pencapaian Anda',
      'icon': Icons.military_tech,
      'color': Colors.orange,
      'steps': [
        'Lihat prestasi di halaman Profil',
        'Download sertifikat yang tersedia',
        'Bagikan pencapaian Anda',
        'Lacak perkembangan skill',
      ],
    },
  ];

  List<Map<String, String>> get _filteredFaqs {
    if (_searchQuery.isEmpty) {
      return _faqs;
    }
    return _faqs.where((faq) =>
        faq['question']!.toLowerCase().contains(_searchQuery.toLowerCase()) ||
        faq['answer']!.toLowerCase().contains(_searchQuery.toLowerCase())).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF435059),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            const CommonHeader(),
            
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
                    padding: const EdgeInsets.only(bottom: 100),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildHeader(),
                        const SizedBox(height: 20),
                        _buildSearchBar(),
                        const SizedBox(height: 25),
                        _buildQuickActions(),
                        const SizedBox(height: 25),
                        _buildUserGuides(),
                        const SizedBox(height: 25),
                        _buildFAQSection(),
                        const SizedBox(height: 25),
                        _buildSupportSection(),
                        const SizedBox(height: 40),
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

  Widget _buildHeader() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(20, 30, 20, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.blue.shade400, Colors.blue.shade600],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blue.withOpacity(0.3),
                      blurRadius: 8,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.help_center,
                  size: 28,
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 15),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Pusat Bantuan',
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF2C3A47),
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Temukan jawaban dan panduan lengkap',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
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
      child: TextField(
        controller: _searchController,
        onChanged: (value) {
          setState(() {
            _searchQuery = value;
          });
        },
        decoration: InputDecoration(
          hintText: 'Cari bantuan atau FAQ...',
          hintStyle: TextStyle(color: Colors.grey[500]),
          prefixIcon: Icon(Icons.search, color: Colors.grey[500]),
          suffixIcon: _searchQuery.isNotEmpty
              ? IconButton(
                  icon: Icon(Icons.clear, color: Colors.grey[500]),
                  onPressed: () {
                    _searchController.clear();
                    setState(() {
                      _searchQuery = '';
                    });
                  },
                )
              : null,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        ),
      ),
    );
  }

  Widget _buildQuickActions() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            'Aksi Cepat',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2C3A47),
            ),
          ),
        ),
        const SizedBox(height: 15),
        Container(
          height: 120,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            children: [
              _buildQuickActionCard(
                'Hubungi Support',
                Icons.headset_mic,
                Colors.green,
                () => _showContactDialog(),
              ),
              _buildQuickActionCard(
                'Laporkan Bug',
                Icons.bug_report,
                Colors.red,
                () => _showBugReportDialog(),
              ),
              _buildQuickActionCard(
                'Saran Fitur',
                Icons.lightbulb_outline,
                Colors.amber,
                () => _showFeatureRequestDialog(),
              ),
              _buildQuickActionCard(
                'Tutorial Video',
                Icons.play_circle_filled,
                Colors.purple,
                () => _showVideoTutorials(),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildQuickActionCard(String title, IconData icon, Color color, VoidCallback onTap) {
    return Container(
      width: 100,
      margin: const EdgeInsets.only(right: 15),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(15),
        child: Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                blurRadius: 8,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
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
              const SizedBox(height: 10),
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF2C3A47),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildUserGuides() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            'Panduan Pengguna',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2C3A47),
            ),
          ),
        ),
        const SizedBox(height: 15),
        ...List.generate(_guides.length, (index) {
          final guide = _guides[index];
          return _buildGuideCard(guide);
        }),
      ],
    );
  }

  Widget _buildGuideCard(Map<String, dynamic> guide) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: ExpansionTile(
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: guide['color'].withOpacity(0.1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(
            guide['icon'],
            color: guide['color'],
            size: 24,
          ),
        ),
        title: Text(
          guide['title'],
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Color(0xFF2C3A47),
          ),
        ),
        subtitle: Text(
          guide['description'],
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey[600],
          ),
        ),
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Divider(),
                const SizedBox(height: 10),
                ...List.generate(guide['steps'].length, (index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 20,
                          height: 20,
                          margin: const EdgeInsets.only(top: 2),
                          decoration: BoxDecoration(
                            color: guide['color'],
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Text(
                              '${index + 1}',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            guide['steps'][index],
                            style: const TextStyle(
                              fontSize: 14,
                              color: Color(0xFF2C3A47),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFAQSection() {
    final faqs = _filteredFaqs;
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              const Text(
                'Pertanyaan Umum (FAQ)',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2C3A47),
                ),
              ),
              const Spacer(),
              Text(
                '${faqs.length} pertanyaan',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 15),
        
        if (faqs.isEmpty)
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            padding: const EdgeInsets.all(30),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              children: [
                Icon(
                  Icons.search_off,
                  size: 50,
                  color: Colors.grey[400],
                ),
                const SizedBox(height: 15),
                Text(
                  'Tidak ada FAQ yang cocok dengan pencarian Anda',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          )
        else
          ...List.generate(faqs.length, (index) {
            final faq = faqs[index];
            final isExpanded = _selectedFaqIndex == index;
            
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    blurRadius: 8,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: ExpansionTile(
                onExpansionChanged: (expanded) {
                  setState(() {
                    _selectedFaqIndex = expanded ? index : -1;
                  });
                },
                leading: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.blue.withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    isExpanded ? Icons.help : Icons.help_outline,
                    color: Colors.blue,
                    size: 20,
                  ),
                ),
                title: Text(
                  faq['question']!,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF2C3A47),
                  ),
                ),
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Divider(),
                        const SizedBox(height: 10),
                        Text(
                          faq['answer']!,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[700],
                            height: 1.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }),
      ],
    );
  }

  Widget _buildSupportSection() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.indigo.shade400, Colors.indigo.shade600],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.indigo.withOpacity(0.3),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(
                    Icons.support_agent,
                    color: Colors.white,
                    size: 24,
                  ),
                ),
                const SizedBox(width: 15),
                const Expanded(
                  child: Text(
                    'Butuh Bantuan Lebih?',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            const Text(
              'Tim support kami siap membantu Anda 24/7. Hubungi kami melalui berbagai cara di bawah ini.',
              style: TextStyle(
                fontSize: 14,
                color: Colors.white,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: _buildSupportButton(
                    'Chat Live',
                    Icons.chat,
                    () => _showContactDialog(),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: _buildSupportButton(
                    'Email',
                    Icons.email,
                    () => _showEmailDialog(),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSupportButton(String title, IconData icon, VoidCallback onTap) {
    return ElevatedButton.icon(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: Colors.indigo,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.symmetric(vertical: 12),
      ),
      icon: Icon(icon, size: 18),
      label: Text(
        title,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  // Dialog methods
  void _showContactDialog() {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.green.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.headset_mic, color: Colors.green, size: 30),
              ),
              const SizedBox(height: 15),
              const Text(
                'Hubungi Support',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Text(
                'Pilih cara untuk menghubungi tim support kami:',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 20),
              Column(
                children: [
                  ListTile(
                    leading: const Icon(Icons.phone, color: Colors.green),
                    title: const Text('Telepon'),
                    subtitle: const Text('+62 811-2345-6789'),
                    onTap: () {
                      Navigator.pop(context);
                      _showSnackBar('Membuka aplikasi telepon...');
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.message, color: Colors.blue),
                    title: const Text('WhatsApp'),
                    subtitle: const Text('+62 811-2345-6789'),
                    onTap: () {
                      Navigator.pop(context);
                      _showSnackBar('Membuka WhatsApp...');
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.chat, color: Colors.purple),
                    title: const Text('Live Chat'),
                    subtitle: const Text('Chat langsung dengan support'),
                    onTap: () {
                      Navigator.pop(context);
                      _showSnackBar('Memulai live chat...');
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showEmailDialog() {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.blue.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.email, color: Colors.blue, size: 30),
              ),
              const SizedBox(height: 15),
              const Text(
                'Kirim Email',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Text(
                'support@ekstrakurikuler.app',
                style: TextStyle(fontSize: 16, color: Colors.blue),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  _showSnackBar('Membuka aplikasi email...');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text('Buka Email'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showBugReportDialog() {
    final TextEditingController bugController = TextEditingController();
    
    showDialog(
      context: context,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.red.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.bug_report, color: Colors.red, size: 30),
              ),
              const SizedBox(height: 15),
              const Text(
                'Laporkan Bug',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Text(
                'Deskripsikan masalah yang Anda temukan:',
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 15),
              TextField(
                controller: bugController,
                maxLines: 4,
                decoration: InputDecoration(
                  hintText: 'Jelaskan bug yang Anda temukan...',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Batal'),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                        _showSnackBar('Laporan bug berhasil dikirim');},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text('Kirim'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showFeatureRequestDialog() {
    final TextEditingController featureController = TextEditingController();
    
    showDialog(
      context: context,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.amber.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.lightbulb_outline, color: Colors.amber, size: 30),
              ),
              const SizedBox(height: 15),
              const Text(
                'Saran Fitur',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Text(
                'Bagikan ide fitur baru yang Anda inginkan:',
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 15),
              TextField(
                controller: featureController,
                maxLines: 4,
                decoration: InputDecoration(
                  hintText: 'Deskripsikan fitur yang Anda inginkan...',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Batal'),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                        _showSnackBar('Saran fitur berhasil dikirim');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.amber,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text('Kirim'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showVideoTutorials() {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.purple.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.play_circle_filled, color: Colors.purple, size: 30),
              ),
              const SizedBox(height: 15),
              const Text(
                'Tutorial Video',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Text(
                'Pilih video tutorial yang ingin Anda tonton:',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 20),
              Column(
                children: [
                  ListTile(
                    leading: const Icon(Icons.play_arrow, color: Colors.purple),
                    title: const Text('Cara Mendaftar Ekstrakurikuler'),
                    subtitle: const Text('3 menit • Pemula'),
                    onTap: () {
                      Navigator.pop(context);
                      _showSnackBar('Membuka video tutorial...');
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.play_arrow, color: Colors.purple),
                    title: const Text('Mengelola Jadwal Kegiatan'),
                    subtitle: const Text('5 menit • Menengah'),
                    onTap: () {
                      Navigator.pop(context);
                      _showSnackBar('Membuka video tutorial...');
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.play_arrow, color: Colors.purple),
                    title: const Text('Fitur Chat dan Komunikasi'),
                    subtitle: const Text('4 menit • Pemula'),
                    onTap: () {
                      Navigator.pop(context);
                      _showSnackBar('Membuka video tutorial...');
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            const Icon(Icons.check_circle, color: Colors.white),
            const SizedBox(width: 10),
            Text(message),
          ],
        ),
        backgroundColor: Colors.green,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        margin: const EdgeInsets.all(20),
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}