import 'package:flutter/material.dart';
import 'package:yt_music/themes/app_colors.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: AppColors.secondColor,
      currentIndex: currentIndex,
      onTap: onTap,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: AppColors.mainTextColor,
      unselectedItemColor: AppColors.mainTextColor,
      items: [
        BottomNavigationBarItem(
          icon: Icon(
            currentIndex == 0 ? Icons.home_filled : Icons.home_outlined,
          ),
          label: 'Ana Sayfa',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            currentIndex == 1 ? Icons.play_arrow : Icons.play_arrow_outlined,
          ),
          label: 'Sana Özel',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            currentIndex == 2 ? Icons.explore : Icons.explore_outlined,
          ),
          label: 'Keşfet',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            currentIndex == 3
                ? Icons.library_music
                : Icons.library_music_outlined,
          ),
          label: 'Kitaplık',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            currentIndex == 4 ? Icons.play_circle : Icons.play_circle_outline,
          ),
          label: 'Yükselt',
        ),
      ],
    );
  }
}
