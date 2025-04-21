import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

// Aplikasi Utama
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}

// Halaman Splash Screen
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _bgColorController;
  late AnimationController _logoController;
  late Animation<Offset> _logoOffset;

  Color _backgroundColor = Colors.grey;

  @override
  void initState() {
    super.initState();

    // Animasi perubahan warna background
    _bgColorController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    // Animasi logo masuk dari samping
    _logoController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );

    _logoOffset = Tween<Offset>(
      begin: const Offset(-2.0, 0.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _logoController,
      curve: Curves.easeOut,
    ));

    // Mulai animasi warna background
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        _backgroundColor = const Color(0xFF43515D);
      });
      _bgColorController.forward();
      _logoController.forward();
    });

    // Navigasi ke Login setelah 3 detik
    Future.delayed(const Duration(seconds: 3), () {
      Get.off(() => const LoginPage(), transition: Transition.fadeIn);
    });
  }

  @override
  void dispose() {
    _bgColorController.dispose();
    _logoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 800),
      color: _backgroundColor,
      child: Center(
        child: SlideTransition(
          position: _logoOffset,
          child: Hero(
            tag: 'logo',
            child: Image.asset(
              'assets/logo/splash.png',
              width: 150,
            ),
          ),
        ),
      ),
    );
  }
}

// Halaman Login
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF43515D),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 80),
            Hero(
              tag: 'logo',
              child: Image.asset(
                'assets/logo/splash.png',
                width: 150,
              ),
            ),
            const SizedBox(height: 20),
            const SizedBox(height: 40),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: Color(0xFF9FA4AA),
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
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
                      suffixIcon: Icon(Icons.visibility, color: Colors.white70),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Center(
                    child: Text(
                      'Lupa Password?',
                      style: TextStyle(color: Colors.grey[800]),
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
            )
          ],
        ),
      ),
    );
  }
}
