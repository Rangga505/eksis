import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';

class CommonNavBar extends StatefulWidget {
  final int currentIndex;
  
  const CommonNavBar({Key? key, required this.currentIndex}) : super(key: key);

  @override
  State<CommonNavBar> createState() => _CommonNavBarState();
}

class _CommonNavBarState extends State<CommonNavBar> {
  late NotchBottomBarController _controller;

  @override
  void initState() {
    super.initState();
    _controller = NotchBottomBarController(index: widget.currentIndex);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedNotchBottomBar(
      notchBottomBarController: _controller,
      color: const Color(0xFF435059),
      showLabel: true,
      notchColor: const Color(0xFF435059),
      removeMargins: true,
      bottomBarWidth: double.infinity,
      durationInMilliSeconds: 300,
      kBottomRadius: 0,
      kIconSize: 24.0,
      bottomBarItems: [
        BottomBarItem(
          inActiveItem: const Icon(Icons.sports_basketball, color: Colors.white60),
          activeItem: const Icon(Icons.sports_basketball, color: Colors.white),
          itemLabel: 'Ekskul',
        ),
        BottomBarItem(
          inActiveItem: const Icon(Icons.emoji_events, color: Colors.white60),
          activeItem: const Icon(Icons.emoji_events, color: Colors.white),
          itemLabel: 'Prestasi',
        ),
        BottomBarItem(
          inActiveItem: const Icon(Icons.home, color: Colors.white60, size: 28),
          activeItem: const Icon(Icons.home, color: Colors.white, size: 28),
          itemLabel: 'Beranda',
        ),
        BottomBarItem(
          inActiveItem: const Icon(Icons.photo_library, color: Colors.white60),
          activeItem: const Icon(Icons.photo_library, color: Colors.white),
          itemLabel: 'Galeri',
        ),
        BottomBarItem(
          inActiveItem: const Icon(Icons.person, color: Colors.white60),
          activeItem: const Icon(Icons.person, color: Colors.white),
          itemLabel: 'Profil',
        ),
      ],
      onTap: (index) {
        _controller.index = index;

        // Navigasi menggunakan GetX
        switch(index) {
          case 0:
            Get.offNamed('/ekskul');
            break;
          case 1:
            Get.offNamed('/prestasi');
            break;
          case 2:
            Get.offNamed('/home');
            break;
          case 3:
            Get.offNamed('/galeri');
            break;
          case 4:
            Get.offNamed('/profil');
            break;
        }
      },
    );
  }
}