import 'package:flutter/material.dart';
import '../widgets/common_navbar.dart';

// Don't forget to add this import to your ekskul_page.dart file
// import 'form_pendaftaran.dart';

class FormPendaftaranPage extends StatefulWidget {
  final String ekskulName;

  const FormPendaftaranPage({
    super.key,
    required this.ekskulName,
  });

  @override
  State<FormPendaftaranPage> createState() => _FormPendaftaranPageState();
}

class _FormPendaftaranPageState extends State<FormPendaftaranPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _nomorAbsenController = TextEditingController();
  final TextEditingController _kelasController = TextEditingController();
  final TextEditingController _alasanController = TextEditingController();
  
  // Dropdown options
  final List<String> _pengalamanOptions = ['Belum Pernah', 'Pemula', 'Menengah', 'Mahir'];
  String _selectedPengalaman = 'Belum Pernah';
  
  final List<String> _hariOptions = ['Senin', 'Selasa', 'Rabu', 'Kamis', 'Jumat', 'Sabtu'];
  final List<String> _selectedHari = [];
  
  bool _isSubmitting = false;

  @override
  void dispose() {
    _namaController.dispose();
    _nomorAbsenController.dispose();
    _kelasController.dispose();
    _alasanController.dispose();
    super.dispose();
  }

  void _showSuccessDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Container(
            padding: const EdgeInsets.all(24.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.teal.shade50,
                  Colors.white,
                ],
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.teal.shade100,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.check_circle,
                    size: 50,
                    color: Colors.teal.shade700,
                  ),
                ),
                const SizedBox(height: 24),
                const Text(
                  'Pendaftaran Berhasil!',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'Selamat! Pendaftaran untuk ekstrakurikuler ${widget.ekskulName} telah diterima. Mohon menunggu pengumuman selanjutnya melalui aplikasi.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey.shade700,
                  ),
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () {
                    // Navigate back to the ekstrakurikuler list page
                    Navigator.of(context).popUntil((route) => route.isFirst);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF435059),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Kembali ke Beranda',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [

            
            // Custom App Bar
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
              decoration: BoxDecoration(
                color: const Color(0xFF435059),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                children: [
                  InkWell(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Pendaftaran',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Ekstrakurikuler ${widget.ekskulName}',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white.withOpacity(0.8),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      _getEkskulIcon(),
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            
            // Form Content
            Expanded(
              child: Form(
                key: _formKey,
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  margin: const EdgeInsets.only(top: 12),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      padding: const EdgeInsets.fromLTRB(20, 30, 20, 100),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Introduction Section
                          Container(
                            padding: const EdgeInsets.all(16.0),
                            decoration: BoxDecoration(
                              color: Colors.blueGrey.shade50,
                              borderRadius: BorderRadius.circular(16.0),
                              border: Border.all(
                                color: Colors.blueGrey.shade100,
                                width: 1.0,
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.info_outline,
                                      color: Colors.blueGrey.shade700,
                                    ),
                                    const SizedBox(width: 8),
                                    Text(
                                      'Informasi Pendaftaran',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blueGrey.shade700,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 12),
                                Text(
                                  'Silakan lengkapi formulir pendaftaran ekstrakurikuler ${widget.ekskulName} dengan benar. Data yang Anda masukkan akan diverifikasi oleh pembimbing ekstrakurikuler.',
                                  style: TextStyle(
                                    color: Colors.blueGrey.shade700,
                                    height: 1.5,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          
                          const SizedBox(height: 30),

                          // Data Diri Section
                          Text(
                            'Data Diri',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xFF435059),
                            ),
                          ),
                          
                          const SizedBox(height: 20),
                          
                          // Nama Lengkap
                          _buildLabel('Nama Lengkap'),
                          const SizedBox(height: 8),
                          TextFormField(
                            controller: _namaController,
                            decoration: _buildInputDecoration('Masukkan nama lengkap', Icons.person),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Nama lengkap tidak boleh kosong';
                              }
                              return null;
                            },
                          ),
                          
                          const SizedBox(height: 20),
                          
                          // No Absen
                          _buildLabel('Nomor Absen'),
                          const SizedBox(height: 8),
                          TextFormField(
                            controller: _nomorAbsenController,
                            keyboardType: TextInputType.number,
                            decoration: _buildInputDecoration('Masukkan nomor absen', Icons.tag),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Nomor absen tidak boleh kosong';
                              }
                              if (int.tryParse(value) == null) {
                                return 'Nomor absen harus berupa angka';
                              }
                              return null;
                            },
                          ),
                          
                          const SizedBox(height: 20),
                          
                          // Kelas
                          _buildLabel('Kelas'),
                          const SizedBox(height: 8),
                          TextFormField(
                            controller: _kelasController,
                            decoration: _buildInputDecoration('Contoh: 10 IPA 1', Icons.class_),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Kelas tidak boleh kosong';
                              }
                              return null;
                            },
                          ),
                          
                          const SizedBox(height: 30),
                          
                          // Preferensi Section
                          Text(
                            'Informasi Tambahan',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xFF435059),
                            ),
                          ),
                          
                          const SizedBox(height: 20),
                          
                          // Pengalaman
                          _buildLabel('Tingkat Pengalaman'),
                          const SizedBox(height: 8),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: Colors.grey.shade300),
                            ),
                            child: DropdownButtonFormField<String>(
                              value: _selectedPengalaman,
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.star, color: Colors.amber.shade600),
                                border: InputBorder.none,
                                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                              ),
                              isExpanded: true,
                              style: TextStyle(color: Colors.grey.shade800, fontSize: 16),
                              items: _pengalamanOptions.map((String item) {
                                return DropdownMenuItem<String>(
                                  value: item,
                                  child: Text(item),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                if (newValue != null) {
                                  setState(() {
                                    _selectedPengalaman = newValue;
                                  });
                                }
                              },
                            ),
                          ),
                          
                          const SizedBox(height: 20),
                          
                          // Hari yang disukai
                          _buildLabel('Hari yang Disukai (Opsional)'),
                          const SizedBox(height: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: Colors.grey.shade300),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.calendar_today, color: Colors.deepPurple.shade400),
                                    const SizedBox(width: 12),
                                    Text(
                                      'Pilih hari yang disukai',
                                      style: TextStyle(
                                        color: Colors.grey.shade600,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 12),
                                Wrap(
                                  spacing: 8,
                                  runSpacing: 8,
                                  children: _hariOptions.map((hari) {
                                    final isSelected = _selectedHari.contains(hari);
                                    return InkWell(
                                      onTap: () {
                                        setState(() {
                                          if (isSelected) {
                                            _selectedHari.remove(hari);
                                          } else {
                                            _selectedHari.add(hari);
                                          }
                                        });
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                                        decoration: BoxDecoration(
                                          color: isSelected ? Colors.deepPurple.shade100 : Colors.grey.shade100,
                                          borderRadius: BorderRadius.circular(20),
                                          border: Border.all(
                                            color: isSelected ? Colors.deepPurple.shade400 : Colors.grey.shade300,
                                            width: 1.0,
                                          ),
                                        ),
                                        child: Text(
                                          hari,
                                          style: TextStyle(
                                            color: isSelected ? Colors.deepPurple.shade700 : Colors.grey.shade700,
                                            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                                          ),
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ],
                            ),
                          ),
                          
                          const SizedBox(height: 20),
                          
                          // Alasan
                          _buildLabel('Alasan Bergabung'),
                          const SizedBox(height: 8),
                          TextFormField(
                            controller: _alasanController,
                            maxLines: 4,
                            decoration: InputDecoration(
                              hintText: 'Ceritakan alasan kamu ingin bergabung dengan ekstrakurikuler ini...',
                              hintStyle: TextStyle(color: Colors.grey.shade400),
                              filled: true,
                              fillColor: Colors.grey.shade50,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(color: Colors.grey.shade300),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(color: Colors.grey.shade300),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(color: const Color(0xFF435059), width: 2),
                              ),
                              contentPadding: const EdgeInsets.all(16),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Alasan tidak boleh kosong';
                              }
                              return null;
                            },
                          ),
                          
                          const SizedBox(height: 40),
                          
                          // Submit Button
                          SizedBox(
                            width: double.infinity,
                            height: 56,
                            child: ElevatedButton(
                              onPressed: _isSubmitting
                                  ? null
                                  : () async {
                                      if (_formKey.currentState!.validate()) {
                                        setState(() {
                                          _isSubmitting = true;
                                        });
                                        
                                        // Simulate network request
                                        await Future.delayed(const Duration(seconds: 2));
                                        
                                        setState(() {
                                          _isSubmitting = false;
                                        });
                                        
                                        // Show success dialog
                                        _showSuccessDialog();
                                      }
                                    },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF435059),
                                foregroundColor: Colors.white,
                                elevation: 2,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                              ),
                              child: _isSubmitting
                                  ? Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          width: 24,
                                          height: 24,
                                          child: CircularProgressIndicator(
                                            color: Colors.white,
                                            strokeWidth: 3,
                                          ),
                                        ),
                                        const SizedBox(width: 12),
                                        const Text(
                                          'Sedang Mengirim...',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    )
                                  : Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        const Icon(Icons.send),
                                        const SizedBox(width: 8),
                                        const Text(
                                          'Kirim Pendaftaran',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
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
              ),
            ),
          ],
        ),
      ),
      extendBody: true,
      bottomNavigationBar: const CommonNavBar(currentIndex: 0),
    );
  }
  
  Widget _buildLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(left: 4.0),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: Colors.grey.shade800,
        ),
      ),
    );
  }
  
  InputDecoration _buildInputDecoration(String hint, IconData icon) {
    return InputDecoration(
      hintText: hint,
      hintStyle: TextStyle(color: Colors.grey.shade400),
      prefixIcon: Icon(icon, color: Colors.grey.shade600),
      filled: true,
      fillColor: Colors.grey.shade50,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Colors.grey.shade300),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Colors.grey.shade300),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: const Color(0xFF435059), width: 2),
      ),
      contentPadding: const EdgeInsets.symmetric(vertical: 16),
    );
  }
  
  IconData _getEkskulIcon() {
    switch (widget.ekskulName) {
      case 'Band':
        return Icons.music_note;
      case 'Basket':
        return Icons.sports_basketball;
      case 'Sepak Bola':
        return Icons.sports_soccer;
      case 'Voli':
        return Icons.sports_volleyball;
      case 'Pramuka':
        return Icons.flare;
      case 'Jurnalistik':
        return Icons.book;
      case 'Desain Grafis':
        return Icons.palette;
      case 'Karate':
        return Icons.sports_martial_arts;
      case 'PMR':
        return Icons.medical_services;
      case 'Al-Banjari':
        return Icons.music_note;
      case 'Tari':
        return Icons.attractions;
      case 'Paduan Suara':
        return Icons.mic;
      case 'BTQ':
        return Icons.menu_book;
      case 'Perisai Diri':
        return Icons.shield;
      case 'Karawitan':
        return Icons.music_note;
      case 'Robotik':
        return Icons.smart_toy;
      case 'KIR MTK':
        return Icons.functions;
      case 'KIR IPA':
        return Icons.science;
      default:
        return Icons.star;
    }
  }
}