import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'login_page.dart';

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

    _bgColorController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

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

    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        _backgroundColor = const Color(0xFF43515D);
      });
      _bgColorController.forward();
      _logoController.forward();
    });

    Future.delayed(const Duration(seconds: 3), () {
      Get.to(() => const LoginPage(),
          transition: Transition.rightToLeftWithFade,
          duration: const Duration(milliseconds: 800));
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
