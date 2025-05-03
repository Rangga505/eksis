import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF43515D),
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                Hero(
                  tag: 'logo', // Must match exactly with login page
                  child: Image.asset(
                    'assets/logo/splash.png',
                    width: 150, // Match login page width
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
          Expanded(
            flex: 7,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: Color(0xFF9FA4AA),
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Back button with title
                    GestureDetector(
                      onTap: () => Get.back(),
                      child: const Row(
                        children: [
                          Icon(Icons.arrow_back, color: Colors.black87),
                          SizedBox(width: 8),
                          Text(
                            'Lupa Password',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    
                    const SizedBox(height: 20), // Konsisten dengan login page
                    
                    // Email Field
                    const Text('Email'),
                    const SizedBox(height: 5),
                    TextField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white24,
                        hintText: 'Masukkan Email Disini',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    
                    const SizedBox(height: 10), // Konsisten dengan login page
                    
                    // Username Field
                    const Text('Username'),
                    const SizedBox(height: 5),
                    TextField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white24,
                        hintText: 'Masukkan Username Disini',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    
                    const SizedBox(height: 20), // Konsisten dengan login page
                    
                    // Verify Button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF43515D),
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        onPressed: () {},
                        child: const Text(
                          'Verifikasi',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    
                    const SizedBox(height: 20),
                    
                    // Footer Text
                    const Text(
                      'Dengan menyetujui akun kamu menyetujui Syarat & Ketentuan dan Kebijakan Privasi EKSIS',
                      style: TextStyle(fontSize: 10, color: Colors.white60),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}