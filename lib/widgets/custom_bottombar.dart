// Create a new file named bottom_navigation_bar.dart

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../themes/app_theme.dart';
import 'custom_text_widget.dart';

class BottomNavBar extends StatefulWidget {
  final List<NavBarItem> items;
  final int currentIndex;
  final void Function(int) onTap;

  const BottomNavBar(
      {super.key,
      required this.currentIndex,
      required this.onTap,
      required this.items});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      // margin: const EdgeInsets.only(left: 10, bottom: 15, right: 10),
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        color: Colors.white, // Background color
        // borderRadius: BorderRadius.circular(15), // Rounded corners
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.2),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 4), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(
          widget.items.length,
          (index) => _buildNavBarItem(index),
        ),
      ),
    );
  }

  Widget _buildNavBarItem(int index) {
    final item = widget.items[index];
    final isSelected = index == widget.currentIndex;

    return GestureDetector(
      onTap: () => widget.onTap(index),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            item.iconFilled,
            color: isSelected ? AppThemes.black : Colors.grey,
            //scale: 2,
            height: 20.h,
          ),
        ],
      ),
    );
  }
}

// BottomNavigationBarItem data structure
class NavBarItem {
  final String iconFilled;
  final String? label;

  const NavBarItem({
    required this.iconFilled,
    this.label,
  });
}
