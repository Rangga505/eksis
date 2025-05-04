// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final NotchBottomBarController _controller = NotchBottomBarController(index: 2);

  final List<Widget> _pages = [
    Center(child: Text('Ekskul')),
    Center(child: Text('Prestasi')),
    Center(child: Text('Beranda')),
    Center(child: Text('Galeri')),
    Center(child: Text('Profil')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false, // Important: Don't apply bottom padding
        child: IndexedStack(
          index: _controller.index,
          children: _pages,
        ),
      ),
      extendBody: true, // Make body extend behind bottom nav bar
      bottomNavigationBar: AnimatedNotchBottomBar(
        notchBottomBarController: _controller,
        kIconSize: 24.0,
        bottomBarWidth: MediaQuery.of(context).size.width,
        durationInMilliSeconds: 300,
        kBottomRadius: 28.0,
        color: Color(0xFF435059),
        showLabel: true,
        notchColor: Color(0xFF435059), // Abu-abu muda untuk bulatan
        removeMargins: true, // Changed to true to remove margins
        bottomBarItems: [
          BottomBarItem(
            inActiveItem: Icon(Icons.sports_basketball, color: Colors.white),
            activeItem: Icon(Icons.sports_basketball, color: const Color.fromARGB(255, 255, 255, 255)),
            itemLabel: 'Ekskul',
          ),
          BottomBarItem(
            inActiveItem: Icon(Icons.emoji_events, color: Colors.white),
            activeItem: Icon(Icons.emoji_events, color: const Color.fromARGB(255, 255, 255, 255)),
            itemLabel: 'Prestasi',
          ),
          BottomBarItem(
            inActiveItem: Icon(Icons.home, color: Colors.white),
            activeItem: Icon(Icons.home, color: const Color.fromARGB(255, 255, 255, 255)),
            itemLabel: 'Beranda',
          ),
          BottomBarItem(
            inActiveItem: Icon(Icons.photo, color: Colors.white),
            activeItem: Icon(Icons.photo, color: const Color.fromARGB(255, 255, 255, 255)),
            itemLabel: 'Galeri',
          ),
          BottomBarItem(
            inActiveItem: Icon(Icons.person, color: Colors.white),
            activeItem: Icon(Icons.person, color: const Color.fromARGB(255, 255, 255, 255)),
            itemLabel: 'Profil',
          ),
        ],
        onTap: (index) {
          setState(() {
            _controller.index = index;
          });
        },
      ),
    );
  }
}