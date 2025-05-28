import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';

class CommonNavBar extends StatefulWidget {
  final int currentIndex;
  
  const CommonNavBar({super.key, required this.currentIndex});

  @override
  State<CommonNavBar> createState() => _CommonNavBarState();
}

class _CommonNavBarState extends State<CommonNavBar> {
  /// Controller untuk AnimatedNotchBottomBar
  late NotchBottomBarController _controller;

  /// Daftar item menu
  final List<_NavBarItem> _navBarItems = [
    _NavBarItem(
      icon: Icons.sports_basketball,
      label: 'Ekskul',
      route: '/ekskul',
    ),
    _NavBarItem(
      icon: Icons.emoji_events,
      label: 'Prestasi',
      route: '/prestasi',
    ),
    _NavBarItem(
      icon: Icons.home,
      label: 'Beranda',
      route: '/home',
      iconSize: 28.0,
    ),
    _NavBarItem(
      icon: Icons.photo_library,
      label: 'Galeri',
      route: '/galeri',
    ),
    _NavBarItem(
      icon: Icons.person,
      label: 'Profil',
      route: '/profil',
    ),
  ];

  @override
  void initState() {
    super.initState();
    _controller = NotchBottomBarController(index: widget.currentIndex);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
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
      bottomBarItems: _buildBottomBarItems(),
      onTap: _handleNavigation,
    );
  }

  /// Membuat daftar item untuk navbar
  List<BottomBarItem> _buildBottomBarItems() {
    return _navBarItems.map((item) {
      return BottomBarItem(
        inActiveItem: Icon(
          item.icon,
          color: Colors.white60,
          size: item.iconSize,
        ),
        activeItem: Icon(
          item.icon,
          color: Colors.white,
          size: item.iconSize,
        ),
        itemLabel: item.label,
      );
    }).toList();
  }

  /// Menangani navigasi saat item navbar ditekan
  void _handleNavigation(int index) {
    _controller.index = index;
    Get.offNamed(_navBarItems[index].route);
  }
}

/// Model untuk item navbar
class _NavBarItem {
  final IconData icon;
  final String label;
  final String route;
  final double iconSize;

  _NavBarItem({
    required this.icon,
    required this.label,
    required this.route,
    this.iconSize = 24.0,
  });
}