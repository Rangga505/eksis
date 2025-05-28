import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'screens/splash_screen.dart';
import 'pages/home_page.dart';
import 'pages/prestasi_page.dart';
import 'pages/galeri_page.dart';
import 'pages/profil_page.dart';
import 'pages/ekskul_selection_page.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF435059),
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const SplashScreen(),
      getPages: [
  GetPage(
    name: '/home',
    page: () => const HomePage(),
    transition: Transition.fadeIn,
    transitionDuration: Duration(milliseconds: 500),
  ),
  GetPage(
    name: '/ekskul',
    page: () => const EkskulSelectionPage(),
    transition: Transition.fadeIn,
    transitionDuration: Duration(milliseconds: 500),
  ),
  GetPage(
    name: '/prestasi',
    page: () => const PrestasiPage(),
    transition: Transition.fadeIn,
    transitionDuration: Duration(milliseconds: 500),
  ),
  GetPage(
    name: '/galeri',
    page: () => const GaleriPage(),
    transition: Transition.fadeIn,
    transitionDuration: Duration(milliseconds: 500),
  ),
  GetPage(
    name: '/profil',
    page: () => const ProfilPage(),
    transition: Transition.fadeIn,
    transitionDuration: Duration(milliseconds: 500),
  ),
    GetPage(
    name: '/pendaftaran',
    page: () => const ProfilPage(),
    transition: Transition.fadeIn,
    transitionDuration: Duration(milliseconds: 500),
  ),
],



    );
  }
}