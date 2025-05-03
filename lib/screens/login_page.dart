import 'package:flutter/material.dart';
import 'forgot_password_page.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

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
                  tag: 'logo',
                  child: Image.asset(
                    'assets/logo/splash.png',
                    width: 150,
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
                    const Text('Login',
                        style:
                            TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 10),
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
                    const SizedBox(height: 10),
                    const Text('Password'),
                    const SizedBox(height: 5),
                    TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white24,
                        hintText: 'Masukkan Password Disini',
                        suffixIcon:
                            Icon(Icons.visibility, color: Colors.white70),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          Get.to(
                            () => const ForgotPasswordPage(),
                            transition: Transition.fadeIn,
                            duration: const Duration(milliseconds: 600),
                          );
                        },
                        child: Text(
                          'Lupa Password?',
                          style: TextStyle(
                            color: Colors.blueAccent,
                            decoration: TextDecoration.underline,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF43515D),
                          padding: const EdgeInsets.symmetric(vertical: 12),
                        ),
                        onPressed: () {},
                        child: const Text('Masuk',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Center(
                      child: RichText(
                        text: TextSpan(
                          style: const TextStyle(color: Colors.black87),
                          children: [
                            const TextSpan(text: 'Kamu Belum Punya Akun?, '),
                            TextSpan(
                              text: 'Buat disini',
                              style: const TextStyle(color: Colors.blue),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Dengan menyetujui akun kamu menyetujui Syarat & Ketentuan dan Kebijakan Privasi EKSIS',
                      style: TextStyle(fontSize: 10, color: Colors.white60),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}