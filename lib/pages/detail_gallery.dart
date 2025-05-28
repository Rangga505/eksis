import 'package:flutter/material.dart';

class DetailGalleryPage extends StatefulWidget {
  final String ekskulName;
  final String imagePath;
  final String category;

  const DetailGalleryPage({
    super.key,
    required this.ekskulName,
    required this.imagePath,
    required this.category,
  });

  @override
  State<DetailGalleryPage> createState() => _DetailGalleryPageState();
}

class _DetailGalleryPageState extends State<DetailGalleryPage> with SingleTickerProviderStateMixin {
  
  // Map gambar berdasarkan nama ekstrakurikuler
  Map<String, List<String>> getGalleryImages() {
    return {
      'Pramuka INTI': [
        'assets/logo/images/prestasipramuka.jpeg',
        'assets/logo/images/kegiatanpramuka.jpg',
      ],
      'Jurnalistik': [
        'assets/logo/images/prestasijurnalistik.png',
        'assets/logo/images/kegiatanjurnalistik.jpeg',
      ],
      'Sepak Bola': [
        'assets/logo/images/prestasisepakbola.jpg',
        'assets/logo/images/kegiatanbola.jpg',
      ],
      'Basket': [
        'assets/logo/images/prestasibasket.jpeg',
        'assets/logo/images/kegiatanbasket.jpg',
      ],
      'Voli': [
        'assets/logo/images/prestasi_voli.jpg',
        'assets/logo/images/kegiatan_voli.jpg',
      ],
      'Desain Grafis': [
        'assets/logo/images/prestasi_desaingrafis.jpg',
        'assets/logo/images/kegiatan_desaingrafis.jpg',
      ],
      'Karate': [
        'assets/logo/images/prestasi_karate.jpg',
        'assets/logo/images/kegiatan_karate.jpg',
      ],
      'Palang Merah Remaja': [
        'assets/logo/images/prestasi_pmr.jpg',
        'assets/logo/images/kegiatan_pmr.jpg',
      ],
      'Al - Banjari': [
        'assets/logo/images/prestasi_albanjari.jpg',
        'assets/logo/images/kegiatan_albanjari.jpg',
      ],
      'Tari': [
        'assets/logo/images/prestasi_tari.jpg',
        'assets/logo/images/kegiatan_tari.jpg',
      ],
      'Paduan Suara': [
        'assets/logo/images/prestasi_paduansuara.jpg',
        'assets/logo/images/kegiatan_paduansuara.jpg',
      ],
      'BTQ': [
        'assets/logo/images/prestasi_btq.jpg',
        'assets/logo/images/kegiatan_btq.jpg',
      ],
      'Perisai Diri': [
        'assets/logo/images/prestasi_perisaidiri.jpg',
        'assets/logo/images/kegiatan_perisaidiri.jpg',
      ],
      'Karawitan': [
        'assets/logo/images/prestasi_karawitan.jpg',
        'assets/logo/images/kegiatan_karawitan.jpg',
      ],
      'Robotik': [
        'assets/logo/images/prestasi_robotik.jpg',
        'assets/logo/images/kegiatan_robotik.jpg',
      ],
      'KIR MTK': [
        'assets/logo/images/prestasi_kirmtk.jpg',
        'assets/logo/images/kegiatan_kirmtk.jpg',
      ],
      'KIR IPA': [
        'assets/logo/images/prestasi_kiripa.jpg',
        'assets/logo/images/kegiatan_kiripa.jpg',
      ],
      'Futsal': [
        'assets/logo/images/prestasi_futsal.jpg',
        'assets/logo/images/kegiatan_futsal.jpg',
      ],
      'Paskibra': [
        'assets/logo/images/prestasi_paskibra.jpg',
        'assets/logo/images/kegiatan_paskibra.jpg',
      ],
    };
  }

  // Generate gallery photos with different images for each activity
  List<Map<String, dynamic>> generatePhotos() {
    final galleryImages = getGalleryImages();
    final ekskulImages = galleryImages[widget.ekskulName] ?? [widget.imagePath, widget.imagePath];
    
    return [
      {
        'image': ekskulImages[0], // Gambar pertama
        'title': 'Prestasi Terbaik',
        'description': _getPrestasiDescription(),
        'date': '15 Januari 2024',
        'location': _getPrestasiLocation(),
      },
      {
        'image': ekskulImages[1], // Gambar kedua
        'title': 'Kegiatan Rutin',
        'description': _getKegiatanDescription(),
        'date': '2 Februari 2024',
        'location': _getKegiatanLocation(),
      },
    ];
  }

  // Deskripsi prestasi berdasarkan ekstrakurikuler
  String _getPrestasiDescription() {
    switch (widget.ekskulName) {
      case 'Pramuka INTI':
        return 'Juara 1 Lomba Pramuka Penggalang tingkat Provinsi Jawa Timur dengan menunjukkan kemampuan terbaik dalam berbagai kegiatan kepramukaan';
      case 'Jurnalistik':
        return 'Juara 1 Lomba Karya Jurnalistik Siswa tingkat Nasional dengan artikel terbaik tentang lingkungan sekolah';
      case 'Sepak Bola':
        return 'Juara 1 Sepak Bola tingkat Provinsi Jawa Timur dalam kompetisi antar sekolah menengah atas';
      case 'Basket':
        return 'Juara 2 Basket Putra tingkat Kota Surabaya dalam turnamen antar sekolah dengan permainan yang sangat kompetitif';
      case 'Voli':
        return 'Juara 1 Bola Voli Putri tingkat Provinsi dengan tim yang solid dan kerjasama yang baik';
      case 'Desain Grafis':
        return 'Juara 1 Lomba Desain Poster Digital tingkat Nasional dengan karya yang sangat kreatif dan inovatif';
      case 'Karate':
        return 'Medali Emas Karate Kata Individual tingkat Provinsi dengan teknik dan gerakan yang sempurna';
      case 'Palang Merah Remaja':
        return 'Penghargaan Tim Terbaik PMR tingkat Provinsi dalam simulasi kebencanaan dan pertolongan pertama';
      case 'Al - Banjari':
        return 'Juara 1 Festival Al-Banjari tingkat Kota dengan harmonisasi musik yang memukau dan syair yang indah';
      case 'Tari':
        return 'Penampilan terbaik Tari Tradisional di Festival Seni Budaya tingkat Provinsi dengan koreografi yang memesona';
      case 'Paduan Suara':
        return 'Juara 1 Paduan Suara tingkat Kota dengan harmoni suara yang sangat indah dan penyajian yang memukau';
      case 'BTQ':
        return 'Juara 1 Musabaqah Tilawatil Quran tingkat Provinsi dengan bacaan yang fasih dan tartil';
      case 'Perisai Diri':
        return 'Juara 1 Pencak Silat Perisai Diri tingkat Provinsi dengan teknik beladiri yang sangat baik';
      case 'Karawitan':
        return 'Penampilan terbaik Karawitan di Festival Seni Tradisional dengan alunan gamelan yang memukau';
      case 'Robotik':
        return 'Juara 1 Kompetisi Robotik tingkat Nasional dengan robot yang inovatif dan teknologi canggih';
      case 'KIR MTK':
        return 'Medali Emas Karya Ilmiah Matematika tingkat Nasional dengan penelitian yang sangat mendalam';
      case 'KIR IPA':
        return 'Juara 1 Karya Ilmiah IPA tingkat Provinsi dengan eksperimen yang inovatif dan hasil yang luar biasa';
      case 'Futsal':
        return 'Juara 1 Futsal Putra tingkat Kota dengan permainan cepat dan strategi yang matang';
      case 'Paskibra':
        return 'Tim Paskibra Terbaik tingkat Provinsi dengan kedisiplinan dan kekompakan yang luar biasa';
      default:
        return 'Prestasi terbaik ${widget.ekskulName} dalam kompetisi tingkat regional';
    }
  }

  String _getPrestasiLocation() {
    switch (widget.category) {
      case 'Olahraga':
        return 'Stadion Gelora Bung Tomo';
      case 'Seni':
        return 'Gedung Kesenian Surabaya';
      case 'Akademik':
        return 'Universitas Airlangga';
      case 'Organisasi':
        return 'Balai Pemuda Surabaya';
      default:
        return 'Gedung Serbaguna';
    }
  }

  // Deskripsi kegiatan berdasarkan ekstrakurikuler
  String _getKegiatanDescription() {
    switch (widget.ekskulName) {
      case 'Pramuka INTI':
        return 'Kegiatan rutin Pramuka setiap hari Sabtu dengan berbagai latihan kepemimpinan, survival, dan kegiatan alam terbuka';
      case 'Jurnalistik':
        return 'Latihan menulis artikel, wawancara, dan peliputan berita sekolah untuk majalah dan website sekolah';
      case 'Sepak Bola':
        return 'Latihan rutin sepak bola setiap Selasa dan Kamis untuk meningkatkan teknik individu dan kerjasama tim';
      case 'Basket':
        return 'Latihan basket intensif dengan fokus pada shooting, dribbling, dan strategi permainan tim';
      case 'Voli':
        return 'Latihan bola voli dengan teknik passing, smash, dan blocking untuk persiapan kompetisi';
      case 'Desain Grafis':
        return 'Workshop desain menggunakan software profesional dan latihan kreativitas visual setiap minggu';
      case 'Karate':
        return 'Latihan karate dengan teknik kata, kumite, dan pembentukan karakter melalui seni beladiri';
      case 'Palang Merah Remaja':
        return 'Pelatihan pertolongan pertama, donor darah, dan simulasi kebencanaan untuk membantu masyarakat';
      case 'Al - Banjari':
        return 'Latihan Al-Banjari dengan harmonisasi musik tradisional dan syair-syair islami yang indah';
      case 'Tari':
        return 'Latihan tari tradisional dan modern dengan koreografi yang indah dan penuh makna budaya';
      case 'Paduan Suara':
        return 'Latihan paduan suara dengan berbagai genre musik dan teknik vokal yang profesional';
      case 'BTQ':
        return 'Pembelajaran Al-Quran dengan focus pada tajwid, tartil, dan pemahaman makna ayat-ayat suci';
      case 'Perisai Diri':
        return 'Latihan pencak silat Perisai Diri dengan teknik beladiri dan pembentukan mental yang kuat';
      case 'Karawitan':
        return 'Latihan gamelan dan karawitan dengan instrumen tradisional Jawa yang autentik';
      case 'Robotik':
        return 'Workshop pemrograman robot, elektronika, dan teknologi terkini untuk kompetisi robotik';
      case 'KIR MTK':
        return 'Penelitian matematika tingkat lanjut dan pembahasan soal-soal olimpiade matematika';
      case 'KIR IPA':
        return 'Eksperimen sains, penelitian ilmiah, dan persiapan kompetisi sains tingkat nasional';
      case 'Futsal':
        return 'Latihan futsal dengan strategi permainan cepat dan teknik kontrol bola yang baik';
      case 'Paskibra':
        return 'Latihan baris-berbaris, upacara bendera, dan pembentukan karakter disiplin siswa';
      default:
        return 'Kegiatan rutin ${widget.ekskulName} yang dilaksanakan secara berkala';
    }
  }

  String _getKegiatanLocation() {
    switch (widget.category) {
      case 'Olahraga':
        return 'Lapangan Sekolah';
      case 'Seni':
        return 'Studio Seni Sekolah';
      case 'Akademik':
        return 'Laboratorium IPA';
      case 'Organisasi':
        return 'Ruang OSIS';
      default:
        return 'Aula Sekolah';
    }
  }

  // Animation controller for page transitions
  late AnimationController _animationController;
  late Animation<double> _opacityAnimation;
  
  final ScrollController _scrollController = ScrollController();
  bool _showTitle = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    
    _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeIn,
      ),
    );
    
    _animationController.forward();
    
    _scrollController.addListener(() {
      setState(() {
        _showTitle = _scrollController.offset > 220;
      });
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final photos = generatePhotos();
    
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: _showTitle ? 2 : 0,
        backgroundColor: _showTitle ? const Color(0xFF435059) : Colors.transparent,
        flexibleSpace: _showTitle 
          ? Center(
              child: Text(
                widget.ekskulName,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            )
          : null,
        leading: Container(
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: _showTitle ? Colors.transparent : Colors.black.withOpacity(0.3),
            shape: BoxShape.circle,
          ),
          child: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 16),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: _getCategoryColor(widget.category),
                borderRadius: BorderRadius.circular(20),
              ),
              alignment: Alignment.center,
              child: Text(
                widget.category,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
            ),
          ),
        ],
      ),
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          // Header Image with Animation
          SliverToBoxAdapter(
            child: Hero(
              tag: 'gallery-${widget.ekskulName}',
              child: Stack(
                children: [
                  Container(
                    height: 300,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(widget.imagePath),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    height: 300,
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
                  Positioned(
                    bottom: 24,
                    left: 16,
                    right: 16,
                    child: FadeTransition(
                      opacity: _opacityAnimation,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.ekskulName,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 28,
                              shadows: [
                                Shadow(
                                  offset: Offset(1, 1),
                                  blurRadius: 3,
                                  color: Colors.black45,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              Icon(
                                _getCategoryIcon(widget.category),
                                color: Colors.white,
                                size: 18,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                'Dokumentasi kegiatan ${widget.ekskulName}',
                                style: TextStyle(
                                  color: Colors.white.withOpacity(0.9),
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          
          // Gallery Title Section
          SliverToBoxAdapter(
            child: FadeTransition(
              opacity: _opacityAnimation,
              child: Container(
                padding: const EdgeInsets.fromLTRB(16, 24, 16, 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: _getCategoryColor(widget.category).withOpacity(0.1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Icon(
                            Icons.photo_library,
                            color: _getCategoryColor(widget.category),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Galeri Kegiatan',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF435059),
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'Dokumentasi kegiatan dan prestasi ${widget.ekskulName}',
                                style: TextStyle(
                                  color: Colors.grey[600],
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const Divider(height: 32),
                  ],
                ),
              ),
            ),
          ),
          
          // Gallery Grid with Animation - Hanya 2 foto
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.75,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final photo = photos[index];
                  return FadeTransition(
                    opacity: _opacityAnimation,
                    child: SlideTransition(
                      position: Tween<Offset>(
                        begin: Offset(0, 0.2),
                        end: Offset.zero,
                      ).animate(CurvedAnimation(
                        parent: _animationController,
                        curve: Interval(
                          0.4 + (index * 0.1),
                          1.0,
                          curve: Curves.easeOut,
                        ),
                      )),
                      child: GestureDetector(
                        onTap: () {
                          _showDetailModal(context, photo);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                spreadRadius: 1,
                                blurRadius: 4,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Stack(
                              fit: StackFit.expand,
                              children: [
                                // Image
                                Image.asset(
                                  photo['image'],
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) {
                                    // Fallback jika gambar tidak ditemukan
                                    return Container(
                                      color: Colors.grey[300],
                                      child: Icon(
                                        Icons.image_not_supported,
                                        size: 50,
                                        color: Colors.grey[600],
                                      ),
                                    );
                                  },
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
                                
                                // Caption
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
                                          photo['title'],
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        const SizedBox(height: 4),
                                        Text(
                                          photo['date'],
                                          style: TextStyle(
                                            color: Colors.white.withOpacity(0.9),
                                            fontSize: 12,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                
                                // Touch indicator
                                Positioned(
                                  top: 8,
                                  right: 8,
                                  child: Container(
                                    padding: const EdgeInsets.all(4),
                                    decoration: BoxDecoration(
                                      color: Colors.black.withOpacity(0.3),
                                      shape: BoxShape.circle,
                                    ),
                                    child: const Icon(
                                      Icons.touch_app,
                                      color: Colors.white,
                                      size: 16,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
                childCount: photos.length, // Hanya 2 foto
              ),
            ),
          ),
          
          // Upcoming Events Section
          SliverToBoxAdapter(
            child: FadeTransition(
              opacity: _opacityAnimation,
              child: Container(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Divider(),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: _getCategoryColor(widget.category).withOpacity(0.1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        const SizedBox(width: 12),
                      ],
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      // Floating action button with ripple effect
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Bergabung dengan ${widget.ekskulName}'),
              behavior: SnackBarBehavior.floating,
              backgroundColor: const Color(0xFF435059),
              action: SnackBarAction(
                label: 'Info',
                textColor: Colors.white,
                onPressed: () {},
              ),
            ),
          );
        },
        backgroundColor: _getCategoryColor(widget.category),
        icon: const Icon(Icons.add),
        label: const Text('Gabung'),
        elevation: 4,
      ),
    );
  }

  String _getUpcomingEventTitle() {
    switch (widget.category) {
      case 'Olahraga':
        return 'Turnamen ${widget.ekskulName} Antar Sekolah';
      case 'Seni':
        return 'Pertunjukan ${widget.ekskulName} Akhir Semester';
      case 'Akademik':
        return 'Seleksi ${widget.ekskulName} Tingkat Nasional';
      case 'Organisasi':
        return 'Rapat Besar ${widget.ekskulName}';
      default:
        return 'Kegiatan ${widget.ekskulName} Mendatang';
    }
  }

  String _getUpcomingEventLocation() {
    switch (widget.category) {
      case 'Olahraga':
        return 'Lapangan Olahraga Kota';
      case 'Seni':
        return 'Auditorium Sekolah';
      case 'Akademik':
        return 'Ruang Ujian Utama';
      case 'Organisasi':
        return 'Aula Besar';
      default:
        return 'Gedung Serbaguna';
    }
  }

  // Event Card builder
  Widget _buildEventCard({
    required String date,
    required String month,
    required String title,
    required String location,
    required String time,
  }) {
    return Card(
      elevation: 3,
      shadowColor: Colors.black26,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Detail acara: $title'),
              behavior: SnackBarBehavior.floating,
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              // Date container with gradient
              Container(
                width: 60,
                height: 70,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      _getCategoryColor(widget.category),
                      _getCategoryColor(widget.category).withOpacity(0.7),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: _getCategoryColor(widget.category).withOpacity(0.3),
                      spreadRadius: 1,
                      blurRadius: 3,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      date,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                    Text(
                      month,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              // Event details
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Color(0xFF435059),
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Icon(
                          Icons.access_time,
                          size: 16,
                          color: Colors.grey[600],
                        ),
                        const SizedBox(width: 4),
                        Text(
                          time,
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          size: 16,
                          color: Colors.grey[600],
                        ),
                        const SizedBox(width: 4),
                        Expanded(
                          child: Text(
                            location,
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 14,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              // Arrow icon
              Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: Colors.grey[400],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Show detail modal for photo
  void _showDetailModal(BuildContext context, Map<String, dynamic> photo) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height * 0.85,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          children: [
            // Handle bar
            Container(
              margin: const EdgeInsets.only(top: 12, bottom: 8),
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            
            // Modal content
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Large image
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Container(
                        height: 250,
                        width: double.infinity,
                        child: Image.asset(
                          photo['image'],
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              color: Colors.grey[300],
                              child: Icon(
                                Icons.image_not_supported,
                                size: 60,
                                color: Colors.grey[600],
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    
                    const SizedBox(height: 20),
                    
                    // Title
                    Text(
                      photo['title'],
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF435059),
                      ),
                    ),
                    
                    const SizedBox(height: 12),
                    
                    // Date and location info
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: _getCategoryColor(widget.category).withOpacity(0.1),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.calendar_today,
                                size: 14,
                                color: _getCategoryColor(widget.category),
                              ),
                              const SizedBox(width: 4),
                              Text(
                                photo['date'],
                                style: TextStyle(
                                  color: _getCategoryColor(widget.category),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: Colors.grey[100],
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.location_on,
                                size: 14,
                                color: Colors.grey[600],
                              ),
                              const SizedBox(width: 4),
                              Text(
                                photo['location'],
                                style: TextStyle(
                                  color: Colors.grey[600],
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    
                    const SizedBox(height: 20),
                    
                    // Description
                    const Text(
                      'Deskripsi',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF435059),
                      ),
                    ),
                    
                    const SizedBox(height: 8),
                    
                    Text(
                      photo['description'],
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[700],
                        height: 1.5,
                      ),
                    ),
                    
                    const SizedBox(height: 24),
                    
                    // Action buttons
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton.icon(
                            onPressed: () {
                              Navigator.pop(context);
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Foto disimpan ke galeri'),
                                  behavior: SnackBarBehavior.floating,
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: _getCategoryColor(widget.category),
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            icon: const Icon(Icons.download),
                            label: const Text('Simpan'),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: OutlinedButton.icon(
                            onPressed: () {
                              Navigator.pop(context);
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Foto dibagikan'),
                                  behavior: SnackBarBehavior.floating,
                                ),
                              );
                            },
                            style: OutlinedButton.styleFrom(
                              foregroundColor: _getCategoryColor(widget.category),
                              side: BorderSide(color: _getCategoryColor(widget.category)),
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            icon: const Icon(Icons.share),
                            label: const Text('Bagikan'),
                          ),
                        ),
                      ],
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

  // Get category color
  Color _getCategoryColor(String category) {
    switch (category) {
      case 'Olahraga':
        return const Color(0xFF4CAF50);
      case 'Seni':
        return const Color(0xFF9C27B0);
      case 'Akademik':
        return const Color(0xFF2196F3);
      case 'Organisasi':
        return const Color(0xFFFF9800);
      default:
        return const Color(0xFF435059);
    }
  }

  // Get category icon
  IconData _getCategoryIcon(String category) {
    switch (category) {
      case 'Olahraga':
        return Icons.sports;
      case 'Seni':
        return Icons.palette;
      case 'Akademik':
        return Icons.school;
      case 'Organisasi':
        return Icons.group;
      default:
        return Icons.extension;
    }
  }
}