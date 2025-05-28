import 'package:flutter/material.dart';

class EkskulDiscussionPage extends StatefulWidget {
  final Map<String, dynamic> ekskul;

  const EkskulDiscussionPage({
    super.key,
    required this.ekskul,
  });

  @override
  State<EkskulDiscussionPage> createState() => _EkskulDiscussionPageState();
}

class _EkskulDiscussionPageState extends State<EkskulDiscussionPage> {
  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final FocusNode _messageFocusNode = FocusNode();

  List<Map<String, dynamic>> messages = [];
  bool _isTyping = false;

  // Sample members data
  final List<Map<String, String>> members = [
    {'name': 'Anda', 'avatar': 'A', 'status': 'online'},
    {'name': 'Raka Pratama', 'avatar': 'R', 'status': 'online'},
    {'name': 'Sari Dewi', 'avatar': 'S', 'status': 'offline'},
    {'name': 'Budi Santoso', 'avatar': 'B', 'status': 'online'},
    {'name': 'Maya Putri', 'avatar': 'M', 'status': 'offline'},
    {'name': 'Eko Wijaya', 'avatar': 'E', 'status': 'online'},
  ];

  // Enhanced keyword-based auto responses with more detailed information
  late Map<String, List<String>> keywordResponses;

  @override
  void initState() {
    super.initState();
    _initializeKeywordResponses();
    _initializeChat();
  }

  void _initializeKeywordResponses() {
    keywordResponses = {
      'jadwal': [
        'Jadwal latihan rutin Ekstrakurikuler ${widget.ekskul['name']}:\n\n📅 Senin & Rabu: 15:00-17:00\n📍 Lokasi: Lapangan Basket Sekolah\n⏰ Wajib hadir 15 menit sebelum latihan\n\n💡 Tips: Bawa botol minum dan handuk ya!',
        'Untuk jadwal lengkap bulan ini:\n\n🗓️ Senin (4, 11, 18, 25): Latihan Teknik Dasar\n🗓️ Rabu (6, 13, 20, 27): Latihan Permainan\n🗓️ Sabtu (16): Friendly Match\n\nJangan lupa cek kalender ekstrakurikuler di aplikasi sekolah untuk update terbaru!'
      ],
      'lokasi': [
        'Informasi Lokasi Kegiatan:\n\n📍 Lokasi Utama: Lapangan Basket Indoor Sekolah\n🏢 Gedung: Fasilitas Olahraga Lt. 1\n🚪 Pintu Masuk: Sebelah Kantin\n🅿️ Parkir: Area parkir siswa\n\n⚠️ Catatan: Bila hujan, latihan tetap berjalan karena lapangan indoor.\n\n👟 Wajib: Sepatu olahraga dengan sol karet!',
        '🗺️ Panduan Lokasi:\n\nDari gerbang utama → belok kiri → lurus hingga kantin → gedung olahraga di sebelah kanan.\n\nLandmark: Dekat dengan perpustakaan dan lab komputer.'
      ],
      'pembina': [
        '👨‍🏫 Informasi Pembina:\n\n📝 Nama: Bapak Rudi Santoso, S.Pd\n🏀 Pengalaman: 8 tahun melatih basket\n🏆 Prestasi: Pelatih terbaik tingkat kota 2023\n📱 Kontak: 0812-3456-7890\n⏰ Jam konsultasi: Senin-Jumat 13:00-14:00\n\n💬 "Basket bukan hanya olahraga, tapi membangun karakter dan kerjasama tim" - Pak Rudi',
        'Profil Lengkap Pembina:\n\n🎓 Pendidikan: S1 Pendidikan Olahraga UNNES\n🏀 Sertifikat: Pelatih Basket Berlisensi PERBASI\n📈 Track Record: Membawa 3 sekolah meraih juara regional\n\n✨ Fun Fact: Pak Rudi dulu pemain basket tim daerah lho!'
      ],
      'latihan': [
        '🏀 Program Latihan Terkini:\n\n💪 Sesi 1 (15:00-15:30): Pemanasan & Stretching\n🏃 Sesi 2 (15:30-16:15): Teknik Dasar (Dribbling, Shooting, Passing)\n⚡ Sesi 3 (16:15-16:45): Permainan Mini (3v3)\n🧘 Sesi 4 (16:45-17:00): Cooling Down\n\n📋 Persiapan:\n- Datang 15 menit lebih awal\n- Bawa botol minum 1 liter\n- Handuk kecil\n- Semangat tinggi! 💪',
        '📊 Fokus Latihan Minggu Ini:\n\n🎯 Senin: Ball Handling & Footwork\n🎯 Rabu: Shooting Technique & Defense\n\n📈 Target Bulan Ini:\n✅ Peningkatan akurasi shooting 15%\n✅ Penguasaan teknik lay-up\n✅ Strategi zone defense\n\n💡 Quote: "Excellence is not a skill, it\'s an attitude!"'
      ],
      'kompetisi': [
        '🏆 Kompetisi & Turnamen Mendatang:\n\n📅 Kompetisi Antar SMP Se-Kota\n🗓️ Tanggal: 15-17 Maret 2024\n📍 Venue: GOR Kota\n💰 Hadiah: Piala + Uang Pembinaan\n\n🔥 Persiapan Tim:\n- Seleksi tim inti: 5-10 Maret\n- Latihan intensif: 3x seminggu\n- Friendly match: Setiap Sabtu\n\n🎯 Target: Masuk 4 besar! Mari berlatih lebih keras! 💪',
        '📋 Kriteria Seleksi Tim Kompetisi:\n\n⭐ Teknik Dasar (30%)\n⭐ Fisik & Stamina (25%)\n⭐ Kerjasama Tim (25%)\n⭐ Mental & Sportivitas (20%)\n\n📝 Jadwal Seleksi:\n- Tes Teknik: Senin, 5 Maret\n- Tes Fisik: Rabu, 7 Maret\n- Scrimmage: Sabtu, 10 Maret\n\nSemua anggota berhak ikut seleksi! 🌟'
      ],
      'iuran': [
        '💰 Rincian Iuran Ekstrakurikuler:\n\n📊 Iuran Bulanan: Rp 50.000\n📅 Pembayaran: Setiap awal bulan\n💳 Metode: Transfer ke rekening bendahara\n\n🔍 Penggunaan Dana:\n• Peralatan latihan (40%)\n• Konsumsi & air mineral (30%)\n• Transport kompetisi (20%)\n• Dana darurat (10%)\n\n📱 Bendahara: Maya Putri (0856-xxxx-xxxx)\n📝 Laporan keuangan: Diupdate setiap bulan di grup WhatsApp',
        '💡 Info Pembayaran Iuran:\n\n🏦 Rekening: BCA 1234567890 (Maya Putri)\n📲 E-wallet: DANA/OVO tersedia\n⏰ Deadline: Tanggal 10 setiap bulan\n\n🎁 Benefit Member:\n✅ Jersey latihan gratis\n✅ Air mineral setiap latihan\n✅ Akses fasilitas gym sekolah\n✅ Sertifikat kegiatan\n\n💸 Keringanan: Tersedia untuk yang membutuhkan, konsultasi ke pembina.'
      ],
      'seragam': [
        '👕 Informasi Seragam Ekstrakurikuler:\n\n🎨 Design: Jersey putih-biru dengan logo sekolah\n💰 Harga: Rp 85.000 (1 set lengkap)\n📦 Isi Set: Jersey + Celana + Kaos kaki\n🏪 Pembelian: Koperasi sekolah (Gedung A Lt.1)\n\n📏 Size tersedia: S, M, L, XL\n⏰ Jam buka koperasi: 07:00-15:00\n📱 Info stock: 0821-xxxx-xxxx (Bu Sari)\n\n✨ Tips: Beli setelah fitting untuk memastikan ukuran yang tepat!',
        '👔 Dress Code Latihan:\n\n🏀 Wajib: Jersey tim (putih-biru)\n👟 Sepatu: Basket shoes dengan sol karet\n🧦 Kaos kaki: Tinggi/crew socks\n🩳 Celana: Training shorts (bebas warna)\n\n❌ Tidak diperbolehkan:\n- Sandal atau sepatu casual\n- Jersey tim lain\n- Aksesoris berlebihan\n\n💡 Alternatif sementara: Kaos putih polos + celana olahraga (maksimal 2x latihan)'
      ],
      'prestasi': [
        '🏆 Prestasi Ekstrakurikuler Basket:\n\n🥇 Juara 1 Kompetisi Antar SMP Kota (2024)\n🥈 Juara 2 Turnamen Regional Jawa Tengah (2023)\n🥉 Juara 3 Festival Olahraga Pelajar (2023)\n🏅 Best Team Spirit Award (2024)\n\n📈 Statistik Bangga:\n• 15 kemenangan beruntun (rekor sekolah)\n• 85% tingkat kemenangan musim ini\n• 3 pemain masuk tim kabupaten\n• 2 pemain dapat beasiswa olahraga\n\n🌟 "Prestasi adalah hasil kerja keras dan kekompakan tim!"',
        '👥 Hall of Fame Alumni:\n\n⭐ Dimas Prasetyo (2022) - Tim PON Jateng\n⭐ Rina Sari (2021) - Beasiswa UNY\n⭐ Ahmad Fauzi (2020) - Pemain profesional IBL\n\n📰 Liputan Media:\n• Kompas: "SMP Terbaik Basket Se-Kota"\n• Radar Jogja: "Sekolah Penggembira Bakat"\n• TV Lokal: Feature ekstrakurikuler unggulan\n\n🎯 Visi: Menjadi ekstrakurikuler basket terdepan di Jawa Tengah!'
      ],
      'anggota': [
        '👥 Data Keanggotaan Terkini:\n\n📊 Total Anggota: 20 orang aktif\n👦 Putra: 12 orang (60%)\n👧 Putri: 8 orang (40%)\n📈 New Member: 5 orang semester ini\n\n🏷️ Kategori:\n• Pemain Inti: 8 orang\n• Pemain Cadangan: 7 orang\n• Member Baru: 5 orang\n\n📅 Rekrutmen Terbuka:\n• Awal semester (Januari & Juli)\n• Syarat: Siswa aktif, sehat jasmani\n• Tes masuk: Kemampuan dasar + wawancara\n\n🤝 "Kami keluarga besar basket yang solid dan saling mendukung!"',
        '📋 Struktur Organisasi:\n\n👑 Ketua: Raka Pratama (Kelas 9A)\n👥 Wakil: Sari Dewi (Kelas 8B)\n💰 Bendahara: Maya Putri (Kelas 8A)\n📝 Sekretaris: Budi Santoso (Kelas 9B)\n📢 Humas: Eko Wijaya (Kelas 8C)\n\n🗳️ Pemilihan: Setiap awal tahun ajaran\n📈 Masa jabatan: 1 tahun\n💪 Filosofi: "Leadership through sports, unity through basketball"'
      ],
      'kontak': [
        '📞 Kontak Penting Ekstrakurikuler:\n\n👨‍🏫 Pembina: Pak Rudi Santoso\n📱 HP: 0812-3456-7890\n📧 Email: rudi.basket@sekolah.ac.id\n⏰ Available: Senin-Jumat (08:00-16:00)\n\n👑 Ketua: Raka Pratama\n📱 WA: 0856-1234-5678\n\n💰 Bendahara: Maya Putri\n📱 WA: 0877-9876-5432\n\n🌐 Media Sosial:\n📷 Instagram: @basket.smpku\n💬 Grup WA: bit.ly/basket-smp-official\n📺 YouTube: SMP Basket Channel',
        '🆘 Emergency Contact:\n\n🏥 P3K: Bu Ratna (UKS)\n📱 Emergency: 0811-emergency\n🏥 RS Terdekat: RS Kota (5 menit)\n\n📋 Prosedur Darurat:\n1. Hubungi pembina/ketua\n2. Kontak keluarga siswa\n3. Koordinasi dengan UKS\n4. Dokumentasi kejadian\n\n💡 "Safety first, basketball second - tapi keduanya penting!"'
      ],
      'halo': [
        'Halo! 👋 Selamat datang di grup diskusi basket! 🏀\n\nSaya AI Assistant yang siap membantu kalian dengan berbagai informasi tentang ekstrakurikuler basket. Kalian bisa tanya tentang:\n\n🗓️ Jadwal latihan\n📍 Lokasi kegiatan  \n👨‍🏫 Info pembina\n🏆 Kompetisi\n💰 Iuran\n👕 Seragam\n🏅 Prestasi\n👥 Keanggotaan\n📞 Kontak\n\nAtau kalian bisa ngobrol santai juga! Ada yang mau ditanyakan? 😊'
      ],
      'hai': [
        'Hai juga! 😄 Gimana kabarnya hari ini?\n\nLagi ada yang mau ditanyakan tentang ekstrakurikuler basket? Atau mau sharing cerita tentang latihan kemarin? \n\nSaya di sini siap bantu kapan saja! 🏀✨'
      ],
      'bagaimana': [
        'Hmmm, pertanyaan yang menarik! 🤔\n\nKalau boleh tau, kamu mau tanya tentang apa ya? Contohnya:\n\n❓ Bagaimana cara bergabung?\n❓ Bagaimana latihan biasanya?\n❓ Bagaimana sistem kompetisi?\n❓ Bagaimana cara bayar iuran?\n\nCoba spesifik dikit biar saya bisa jawab dengan tepat! 😊'
      ],
      'terima kasih': [
        'Sama-sama! 😊 Senang bisa membantu!\n\nKalau ada pertanyaan lain, jangan sungkan untuk bertanya ya. Saya di sini 24/7 siap membantu teman-teman basket! 🏀\n\nSemangat berlatih dan keep shooting! 🌟'
      ],
      'thanks': [
        'You\'re welcome! 😄\n\nAlways happy to help our basketball family! Kalau butuh info lagi, tinggal mention saya aja ya! \n\nKeep dribbling, keep dreaming! 🏀💫'
      ]
    };
  }

  void _initializeChat() {
    // Initialize with some sample messages
    messages = [
      {
        'id': '1',
        'sender': 'System',
        'message':
            'Selamat datang di grup diskusi ${widget.ekskul['name']}! 🏀',
        'timestamp': DateTime.now().subtract(const Duration(hours: 2)),
        'isSystem': true,
      },
      {
        'id': '2',
        'sender': 'Raka Pratama',
        'message': 'Halo semua! Siap untuk latihan hari ini?',
        'timestamp': DateTime.now().subtract(const Duration(minutes: 30)),
        'isSystem': false,
      },
      {
        'id': '3',
        'sender': 'Budi Santoso',
        'message': 'Siap! Sudah tidak sabar latihan shooting.',
        'timestamp': DateTime.now().subtract(const Duration(minutes: 25)),
        'isSystem': false,
      },
      {
        'id': '4',
        'sender': 'AI Assistant',
        'message':
            'Halo semuanya! 👋 Saya AI Assistant untuk grup ini.\n\nKalian bisa bertanya tentang berbagai hal seperti: jadwal, lokasi, pembina, latihan, kompetisi, iuran, seragam, prestasi, anggota, atau kontak.\n\nAtau kalian juga bisa ngobrol santai dengan saya! Ketik keyword atau langsung chat aja ya! 🤖🏀',
        'timestamp': DateTime.now().subtract(const Duration(minutes: 20)),
        'isSystem': true,
      },
    ];
  }

  @override
  void dispose() {
    _messageController.dispose();
    _scrollController.dispose();
    _messageFocusNode.dispose();
    super.dispose();
  }

  void _sendMessage() {
    if (_messageController.text.trim().isEmpty) return;

    final message = _messageController.text.trim();
    final newMessage = {
      'id': DateTime.now().millisecondsSinceEpoch.toString(),
      'sender': 'Anda',
      'message': message,
      'timestamp': DateTime.now(),
      'isSystem': false,
    };

    setState(() {
      messages.add(newMessage);
      _isTyping = true;
    });

    _messageController.clear();
    _scrollToBottom();

    // Check for keywords and auto-respond
    _checkForKeywordResponse(message);
  }

  void _checkForKeywordResponse(String message) {
    final lowerMessage = message.toLowerCase();
    String? matchedKeyword;

    // Find matching keyword with more flexible matching
    for (String keyword in keywordResponses.keys) {
      if (lowerMessage.contains(keyword) ||
          _fuzzyMatch(lowerMessage, keyword)) {
        matchedKeyword = keyword;
        break;
      }
    }

    // Enhanced response logic
    if (matchedKeyword != null) {
      // Simulate realistic typing delay based on message length
      final typingDelay = _calculateTypingDelay(matchedKeyword);

      Future.delayed(Duration(milliseconds: typingDelay), () {
        final responses = keywordResponses[matchedKeyword]!;
        final randomResponse =
            responses[DateTime.now().millisecond % responses.length];

        final aiResponse = {
          'id': DateTime.now().millisecondsSinceEpoch.toString(),
          'sender': 'AI Assistant',
          'message': randomResponse,
          'timestamp': DateTime.now(),
          'isSystem': true,
        };

        setState(() {
          messages.add(aiResponse);
          _isTyping = false;
        });

        _scrollToBottom();
      });
    } else {
      // Smart contextual responses for unknown messages
      Future.delayed(const Duration(seconds: 2), () {
        final contextualResponse = _getContextualResponse(lowerMessage);

        final aiResponse = {
          'id': DateTime.now().millisecondsSinceEpoch.toString(),
          'sender': 'AI Assistant',
          'message': contextualResponse,
          'timestamp': DateTime.now(),
          'isSystem': true,
        };

        setState(() {
          messages.add(aiResponse);
          _isTyping = false;
        });

        _scrollToBottom();
      });
    }
  }

  // Helper method for fuzzy matching
  bool _fuzzyMatch(String message, String keyword) {
    // Check for similar words or partial matches
    final variations = {
      'jadwal': ['schedule', 'waktu', 'jam', 'kapan'],
      'lokasi': ['tempat', 'dimana', 'place', 'location'],
      'pembina': ['pelatih', 'coach', 'guru', 'mentor'],
      'latihan': ['practice', 'training', 'drill'],
      'kompetisi': ['pertandingan', 'lomba', 'tournament', 'match'],
      'iuran': ['bayar', 'biaya', 'uang', 'fee', 'payment'],
      'seragam': ['jersey', 'baju', 'kostum', 'uniform'],
      'prestasi': ['juara', 'achievement', 'trophy', 'award'],
      'anggota': ['member', 'siswa', 'teman', 'player'],
      'kontak': ['contact', 'nomor', 'phone', 'whatsapp']
    };

    if (variations.containsKey(keyword)) {
      return variations[keyword]!
          .any((variation) => message.contains(variation));
    }

    return false;
  }

  // Calculate realistic typing delay
  int _calculateTypingDelay(String keyword) {
    final baseDelay = 1500; // Base 1.5 seconds
    final responses = keywordResponses[keyword]!;
    final avgLength =
        responses.fold(0, (sum, response) => sum + response.length) ~/
            responses.length;

    // Add delay based on response length (simulate typing time)
    return baseDelay + (avgLength * 20); // 20ms per character
  }


  
  // Smart contextual responses
  String _getContextualResponse(String message) {
    if (message.contains('?') ||
        message.contains('apa') ||
        message.contains('gimana')) {
      return '🤔 Hmm, saya belum paham pertanyaan kamu. Bisa dijelaskan lebih spesifik?\n\nAtau mungkin kamu mau tanya tentang:\n🗓️ jadwal\n📍 lokasi\n👨‍🏫 pembina\n🏀 latihan\n🏆 kompetisi\n💰 iuran\n👕 seragam\n🏅 prestasi\n👥 anggota\n📞 kontak\n\nKetik salah satu keyword di atas ya! eat my pussy daddy UGGHHH 😊';
    } else if (_isGreeting(message)) {
      return 'Halo juga! 👋 Senang bertemu dengan kamu!\n\nAda yang bisa saya bantu tentang ekstrakurikuler basket? Atau mau ngobrol santai dulu? 😄🏀';
    } else if (_isCompliment(message)) {
      return 'Wah, terima kasih! 😊 Saya senang bisa membantu teman-teman basket!\n\nKalau ada yang mau ditanyakan atau dibahas, jangan sungkan ya! Mari kita jaga semangat tim basket kita! eat my pussy daddy UGGHHH 🏀💪';
    } else {
      return '🤖 Maaf, saya belum mengerti pesan kamu. Tapi saya selalu siap belajar!\n\nCoba ketik keyword seperti: jadwal, lokasi, pembina, latihan, kompetisi, iuran, seragam, prestasi, anggota, atau kontak.\n\nAtau kalian bisa ngobrol santai dengan saya! eat my pussy daddy UGGHHH😊';
    }
  }

  bool _isGreeting(String message) {
    final greetings = ['halo', 'hai', 'hi', 'hello', 'good', 'selamat'];
    return greetings.any((greeting) => message.contains(greeting));
  }

  bool _isCompliment(String message) {
    final compliments = [
      'bagus',
      'keren',
      'mantap',
      'hebat',
      'amazing',
      'good job',
      'nice'
    ];
    return compliments.any((compliment) => message.contains(compliment));
  }

  void _scrollToBottom() {
    Future.delayed(const Duration(milliseconds: 100), () {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  String _formatTime(DateTime dateTime) {
    return '${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF435059),
      appBar: _buildAppBar(),
      body: Column(
        children: [
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Color(0xFFF5F6FA),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
              ),
              child: Column(
                children: [
                  _buildOnlineMembers(),
                  Expanded(
                    child: _buildMessagesList(),
                  ),
                  _buildMessageInput(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: const Color(0xFF435059),
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.white),
        onPressed: () => Navigator.pop(context),
      ),
      title: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: widget.ekskul['color'],
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                image: AssetImage(widget.ekskul['imageAsset']),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Diskusi ${widget.ekskul['name']}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '${members.where((m) => m['status'] == 'online').length} online',
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.info_outline, color: Colors.white),
          onPressed: () => _showGroupInfo(),
        ),
        IconButton(
          icon: const Icon(Icons.more_vert, color: Colors.white),
          onPressed: () => _showMoreOptions(),
        ),
      ],
    );
  }

  Widget _buildOnlineMembers() {
    final onlineMembers =
        members.where((m) => m['status'] == 'online').toList();

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'Online Sekarang (${onlineMembers.length})',
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Color(0xFF2C3A47),
              ),
            ),
          ),
          const SizedBox(height: 8),
          SizedBox(
            height: 60,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: onlineMembers.length,
              itemBuilder: (context, index) {
                final member = onlineMembers[index];
                return Container(
                  margin: const EdgeInsets.only(right: 12),
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          CircleAvatar(
                            radius: 20,
                            backgroundColor: widget.ekskul['color'],
                            child: Text(
                              member['avatar'] ?? 'U',
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              width: 12,
                              height: 12,
                              decoration: BoxDecoration(
                                color: Colors.green,
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.white,
                                  width: 2,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        member['name']?.split(' ')[0] ?? 'User',
                        style: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF2C3A47),
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMessagesList() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ListView.builder(
        controller: _scrollController,
        itemCount: messages.length + (_isTyping ? 1 : 0),
        itemBuilder: (context, index) {
          if (index == messages.length && _isTyping) {
            return _buildTypingIndicator();
          }

          final message = messages[index];
          final isMe = message['sender'] == 'Anda';
          final isSystem = message['isSystem'] ?? false;

          return _buildMessageBubble(message, isMe, isSystem);
        },
      ),
    );
  }

  Widget _buildMessageBubble(
      Map<String, dynamic> message, bool isMe, bool isSystem) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment:
            isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (!isMe && !isSystem) ...[
            CircleAvatar(
              radius: 16,
              backgroundColor: widget.ekskul['color'],
              child: Text(
                message['sender']?.substring(0, 1).toUpperCase() ?? 'U',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(width: 8),
          ],
          if (isSystem) ...[
            Icon(
              Icons.android,
              color: Colors.blue[600],
              size: 20,
            ),
            const SizedBox(width: 8),
          ],
          Flexible(
            child: Column(
              crossAxisAlignment:
                  isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
              children: [
                if (!isMe && !isSystem)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 4),
                    child: Text(
                      message['sender'] ?? 'Unknown',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: widget.ekskul['color'],
                      ),
                    ),
                  ),
                if (isSystem)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 4),
                    child: Text(
                      message['sender'] ?? 'System',
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  decoration: BoxDecoration(
                    color: isMe
                        ? widget.ekskul['color']
                        : isSystem
                            ? Colors.blue[50]
                            : Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: const Radius.circular(16),
                      topRight: const Radius.circular(16),
                      bottomLeft: isMe
                          ? const Radius.circular(16)
                          : const Radius.circular(4),
                      bottomRight: isMe
                          ? const Radius.circular(4)
                          : const Radius.circular(16),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        blurRadius: 3,
                        offset: const Offset(0, 1),
                      ),
                    ],
                  ),
                  child: Text(
                    message['message'] ?? '',
                    style: TextStyle(
                      fontSize: 14,
                      color: isMe
                          ? Colors.white
                          : isSystem
                              ? Colors.blue[800]
                              : const Color(0xFF2C3A47),
                      height: 1.4,
                    ),
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  _formatTime(message['timestamp'] ?? DateTime.now()),
                  style: const TextStyle(
                    fontSize: 11,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTypingIndicator() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          CircleAvatar(
            radius: 16,
            backgroundColor: Colors.grey[300],
            child: const Icon(
              Icons.android,
              size: 16,
              color: Colors.grey,
            ),
          ),
          const SizedBox(width: 8),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 12,
            ),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
                bottomRight: Radius.circular(16),
                bottomLeft: Radius.circular(4),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildTypingDot(0),
                const SizedBox(width: 4),
                _buildTypingDot(1),
                const SizedBox(width: 4),
                _buildTypingDot(2),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTypingDot(int index) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 600 + (index * 200)),
      curve: Curves.easeInOut,
      width: 8,
      height: 8,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.grey[400],
      ),
    );
  }

  Widget _buildMessageInput() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 5,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        children: [
          IconButton(
            icon: Icon(
              Icons.attach_file,
              color: widget.ekskul['color'],
            ),
            onPressed: () => _showAttachmentOptions(),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xFFF5F6FA),
                borderRadius: BorderRadius.circular(25),
              ),
              child: TextField(
                controller: _messageController,
                focusNode: _messageFocusNode,
                decoration: const InputDecoration(
                  hintText: 'Ketik pesan...',
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 12,
                  ),
                ),
                maxLines: null,
                textInputAction: TextInputAction.send,
                onSubmitted: (_) => _sendMessage(),
              ),
            ),
          ),
          const SizedBox(width: 8),
          Container(
            decoration: BoxDecoration(
              color: widget.ekskul['color'],
              shape: BoxShape.circle,
            ),
            child: IconButton(
              icon: const Icon(
                Icons.send,
                color: Colors.white,
                size: 20,
              ),
              onPressed: _sendMessage,
            ),
          ),
        ],
      ),
    );
  }

  void _showGroupInfo() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height * 0.8,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: widget.ekskul['color'],
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Column(
                children: [
                  Container(
                    width: 40,
                    height: 4,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                            image: AssetImage(widget.ekskul['imageAsset']),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.ekskul['name'] ?? 'Ekstrakurikuler',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '${members.length} anggota',
                              style: const TextStyle(
                                color: Colors.white70,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(20),
                children: [
                  _buildInfoSection('Deskripsi',
                      widget.ekskul['description'] ?? 'Tidak ada deskripsi'),
                  const SizedBox(height: 20),
                  _buildInfoSection('Anggota Aktif', '${members.length} orang'),
                  const SizedBox(height: 20),
                  const Text(
                    'Daftar Anggota',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2C3A47),
                    ),
                  ),
                  const SizedBox(height: 12),
                  ...members.map((member) => _buildMemberTile(member)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoSection(String title, String content) {
    return Column(
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
        const SizedBox(height: 8),
        Text(
          content,
          style: const TextStyle(
            fontSize: 14,
            color: Color(0xFF57606F),
            height: 1.5,
          ),
        ),
      ],
    );
  }

  Widget _buildMemberTile(Map<String, String> member) {
    final isOnline = member['status'] == 'online';

    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFF5F6FA),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Stack(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundColor: widget.ekskul['color'],
                child: Text(
                  member['avatar'] ?? 'U',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              if (isOnline)
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    width: 12,
                    height: 12,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white,
                        width: 2,
                      ),
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  member['name'] ?? 'Unknown User',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF2C3A47),
                  ),
                ),
                Text(
                  isOnline ? 'Online' : 'Terakhir dilihat baru-baru ini',
                  style: TextStyle(
                    fontSize: 12,
                    color: isOnline ? Colors.green : Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showMoreOptions() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 12),
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: 20),
            _buildMenuOption(
              icon: Icons.notifications,
              title: 'Notifikasi',
              subtitle: 'Atur notifikasi grup',
              onTap: () {
                Navigator.pop(context);
                _showNotificationSettings();
              },
            ),
            _buildMenuOption(
              icon: Icons.search,
              title: 'Cari Pesan',
              subtitle: 'Cari dalam percakapan',
              onTap: () {
                Navigator.pop(context);
                _showSearchMessages();
              },
            ),
            _buildMenuOption(
              icon: Icons.wallpaper,
              title: 'Wallpaper Chat',
              subtitle: 'Ubah latar belakang',
              onTap: () {
                Navigator.pop(context);
                _showWallpaperOptions();
              },
            ),
            _buildMenuOption(
              icon: Icons.report,
              title: 'Laporkan Grup',
              subtitle: 'Laporkan masalah',
              onTap: () {
                Navigator.pop(context);
                _showReportOptions();
              },
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuOption({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: widget.ekskul['color'].withOpacity(0.1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(
          icon,
          color: widget.ekskul['color'],
          size: 20,
        ),
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: Color(0xFF2C3A47),
        ),
      ),
      subtitle: Text(
        subtitle,
        style: const TextStyle(
          fontSize: 12,
          color: Color(0xFF8395A7),
        ),
      ),
      onTap: onTap,
    );
  }

  void _showAttachmentOptions() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 12),
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Pilih Lampiran',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF2C3A47),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildAttachmentOption(
                  icon: Icons.photo,
                  label: 'Galeri',
                  color: Colors.purple,
                  onTap: () {
                    Navigator.pop(context);
                    _handleGalleryAttachment();
                  },
                ),
                _buildAttachmentOption(
                  icon: Icons.camera_alt,
                  label: 'Kamera',
                  color: Colors.blue,
                  onTap: () {
                    Navigator.pop(context);
                    _handleCameraAttachment();
                  },
                ),
                _buildAttachmentOption(
                  icon: Icons.insert_drive_file,
                  label: 'Dokumen',
                  color: Colors.orange,
                  onTap: () {
                    Navigator.pop(context);
                    _handleDocumentAttachment();
                  },
                ),
                _buildAttachmentOption(
                  icon: Icons.location_on,
                  label: 'Lokasi',
                  color: Colors.green,
                  onTap: () {
                    Navigator.pop(context);
                    _handleLocationAttachment();
                  },
                ),
              ],
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildAttachmentOption({
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Icon(
              icon,
              color: color,
              size: 24,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: const TextStyle(
              fontSize: 12,
              color: Color(0xFF2C3A47),
            ),
          ),
        ],
      ),
    );
  }

  void _handleGalleryAttachment() {
    // Implement gallery selection
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Fitur galeri akan segera tersedia')),
    );
  }

  void _handleCameraAttachment() {
    // Implement camera capture
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Fitur kamera akan segera tersedia')),
    );
  }

  void _handleDocumentAttachment() {
    // Implement document selection
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Fitur dokumen akan segera tersedia')),
    );
  }

  void _handleLocationAttachment() {
    // Implement location sharing
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Fitur lokasi akan segera tersedia')),
    );
  }

  void _showNotificationSettings() {
    // Implement notification settings
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
          content: Text('Pengaturan notifikasi akan segera tersedia')),
    );
  }

  void _showSearchMessages() {
    // Implement message search
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Fitur pencarian akan segera tersedia')),
    );
  }

  void _showWallpaperOptions() {
    // Implement wallpaper selection
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Pilihan wallpaper akan segera tersedia')),
    );
  }

  void _showReportOptions() {
    // Implement report functionality
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Fitur laporan akan segera tersedia')),
    );
  }
}
