import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:math' as math;
import 'login_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  // Controllers untuk berbagai animasi
  late AnimationController _bgColorController;
  late AnimationController _logoController;
  late AnimationController _rotationController;
  late AnimationController _scaleController;
  late AnimationController _pulseController;

  // Animations
  late Animation<Offset> _logoOffset;
  late Animation<double> _rotationAnimation;
  late Animation<double> _scaleAnimation;
  late Animation<double> _pulseAnimation;
  late Animation<Color?> _gradientAnimation;

  // Background colors
  final Color _startColor = const Color(0xFF1A2530);
  final Color _endColor = const Color(0xFF43515D);
  Color _currentBgColor = const Color(0xFF1A2530);

  // Particles untuk efek background
  final List<Particle> _particles = [];
  final int _particleCount = 30;

  // Flag to prevent multiple navigation attempts
  bool _isNavigating = false;

  // Flag to track if animation has been started
  bool _animationStarted = false;

  @override
  void initState() {
    super.initState();

    // Inisialisasi particles
    _initParticles();

    // Background color animation
    _bgColorController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _gradientAnimation = ColorTween(
      begin: _startColor,
      end: _endColor,
    ).animate(_bgColorController)
      ..addListener(() {
        if (mounted) {
          setState(() {
            _currentBgColor = _gradientAnimation.value ?? _startColor;
          });
        }
      });

    // Logo slide animation
    _logoController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    _logoOffset = Tween<Offset>(
      begin: const Offset(0.0, 2.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _logoController,
      curve: Curves.elasticOut,
    ));

    // Rotation animation
    _rotationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1800),
    );

    _rotationAnimation = Tween<double>(
      begin: 0,
      end: 2 * math.pi,
    ).animate(CurvedAnimation(
      parent: _rotationController,
      curve: Curves.easeInOutBack,
    ));

    // Scale animation
    _scaleController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _scaleAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _scaleController,
      curve: Curves.easeOutBack,
    ));

    // Pulse animation for continuous effect
    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..repeat(reverse: true);

    _pulseAnimation = Tween<double>(
      begin: 1.0,
      end: 1.08,
    ).animate(CurvedAnimation(
      parent: _pulseController,
      curve: Curves.easeInOut,
    ));

    // Schedule animation start after widget is fully built
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted && !_animationStarted) {
        _animationStarted = true;
        _startAnimationSequence();
      }
    });
  }

  void _startAnimationSequence() {
    // Animation sequence
    Future.delayed(const Duration(milliseconds: 200), () {
      if (mounted) {
        _bgColorController.forward();
        _updateParticles();
      }
    });

    Future.delayed(const Duration(milliseconds: 500), () {
      if (mounted) {
        _scaleController.forward();
      }
    });

    Future.delayed(const Duration(milliseconds: 800), () {
      if (mounted) {
        _rotationController.forward();
      }
    });

    Future.delayed(const Duration(milliseconds: 1200), () {
      if (mounted) {
        _logoController.forward();
      }
    });

    // Navigate to login page after splash
    Future.delayed(const Duration(milliseconds: 4000), () {
      _navigateToLogin();
    });
  }

  void _navigateToLogin() {
    // Prevent multiple navigation attempts
    if (mounted && !_isNavigating) {
      _isNavigating = true;

      // Use off instead of offAll for better memory management
      Get.off(
        () => const LoginPage(),
        transition: Transition.fadeIn,
        duration: const Duration(milliseconds: 1000),
        preventDuplicates: true,
      );
    }
  }

  void _initParticles() {
    // We'll initialize particles with dummy values first and update them later
    // This avoids MediaQuery usage in initState which causes the error
    final random = math.Random();

    for (int i = 0; i < _particleCount; i++) {
      _particles.add(Particle(
        x: random.nextDouble() *
            100, // Dummy value, will be updated in first build
        y: random.nextDouble() *
            100, // Dummy value, will be updated in first build
        size: random.nextDouble() * 5 + 1,
        speedX: (random.nextDouble() - 0.5) * 2,
        speedY: (random.nextDouble() - 0.5) * 2,
        opacity: random.nextDouble() * 0.6 + 0.2,
      ));
    }
  }

  void _updateParticles() {
    if (!mounted) return;

    Future.delayed(const Duration(milliseconds: 50), () {
      if (!mounted) return;

      setState(() {
        final screenWidth = MediaQuery.of(context).size.width;
        final screenHeight = MediaQuery.of(context).size.height;

        for (var particle in _particles) {
          particle.update();

          // Keep particles within screen bounds
          if (particle.x > screenWidth) particle.x = 0;
          if (particle.x < 0) particle.x = screenWidth;
          if (particle.y > screenHeight) particle.y = 0;
          if (particle.y < 0) particle.y = screenHeight;
        }
      });

      _updateParticles();
    });
  }

  @override
  void dispose() {
    _bgColorController.dispose();
    _logoController.dispose();
    _rotationController.dispose();
    _scaleController.dispose();
    _pulseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Update particle positions with actual screen dimensions after first build
    if (_particles.isNotEmpty) {
      final screenWidth = MediaQuery.of(context).size.width;
      final screenHeight = MediaQuery.of(context).size.height;

      // Make sure particles use actual screen dimensions
      for (var particle in _particles) {
        if (particle.x <= 100 && particle.y <= 100) {
          // Only update if still using dummy values
          particle.x = math.Random().nextDouble() * screenWidth;
          particle.y = math.Random().nextDouble() * screenHeight;
        }
      }
    }

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              _currentBgColor,
              _currentBgColor
                  .withBlue((_currentBgColor.blue + 20).clamp(0, 255)),
            ],
          ),
        ),
        child: Stack(
          children: [
            // Particles background
            ..._particles.map((particle) => Positioned(
                  left: particle.x,
                  top: particle.y,
                  child: Opacity(
                    opacity: particle.opacity,
                    child: Container(
                      width: particle.size,
                      height: particle.size,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.white.withOpacity(0.3),
                            blurRadius: 3,
                            spreadRadius: 1,
                          ),
                        ],
                      ),
                    ),
                  ),
                )),

            // Logo in center
            Center(
              child: SlideTransition(
                position: _logoOffset,
                child: AnimatedBuilder(
                  animation: _rotationAnimation,
                  builder: (context, child) {
                    return Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.identity()
                        ..setEntry(3, 2, 0.001) // Perspective
                        ..rotateY(_rotationAnimation.value),
                      child: ScaleTransition(
                        scale: _scaleAnimation,
                        child: AnimatedBuilder(
                          animation: _pulseAnimation,
                          builder: (context, child) {
                            return Transform.scale(
                              scale: _pulseAnimation.value,
                              child: child,
                            );
                          },
                          child: Container(
                            width: 170,
                            height: 170,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color:
                                      const Color.fromARGB(255, 240, 240, 240)
                                          .withOpacity(0.5),
                                  blurRadius: 20,
                                  spreadRadius: 5,
                                ),
                              ],
                            ),
                            child: Image.asset(
                              'assets/logo/splash.png',
                              width: 150,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),

            // Company name or app name
            Positioned(
              bottom: 50,
              left: 0,
              right: 0,
              child: AnimatedOpacity(
                opacity: _logoController.value,
                duration: const Duration(milliseconds: 800),
                child: const Center(
                  child: Text(
                    "EKSTRAKURIKULER SISWA",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2.0,
                      shadows: [
                        Shadow(
                          color: Colors.black26,
                          blurRadius: 5,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Particle class untuk animasi background
class Particle {
  double x;
  double y;
  double size;
  double speedX;
  double speedY;
  double opacity;

  Particle({
    required this.x,
    required this.y,
    required this.size,
    required this.speedX,
    required this.speedY,
    required this.opacity,
  });

  void update() {
    x += speedX;
    y += speedY;
  }
}
