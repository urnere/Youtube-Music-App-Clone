import 'package:flutter/material.dart';
import 'package:yt_music/modules/home/widgets/bookcase_widget.dart';
import 'package:yt_music/modules/home/widgets/bottom_navigation_bar.dart';
import 'package:yt_music/modules/home/widgets/for_you.dart';
import 'package:yt_music/modules/home/widgets/mini_player.dart';
import 'package:yt_music/modules/home/widgets/quick_picks.dart';
import 'package:yt_music/modules/home/widgets/sliver_app_bar.dart';
import 'package:yt_music/themes/app_colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  final List<String> _categories = [
    'Enerjik',
    'Antrenman',
    'Keyifli',
    'Hüzünlü',
    'Rahatlama',
    'İşe gidip gelme',
    'Parti',
    'Odaklanma',
    'Romantik',
    'Uyku',
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
      backgroundColor: AppColors.mainColor,
      body: Column(
        children: [
          Expanded(
            child: CustomScrollView(
              slivers: [
                CustomSliverAppBar(categories: _categories),
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      BookcaseWidget(),
                      SizedBox(height: 30),
                      QuickPicks(),
                      ForYouSection(),
                    ],
                  ),
                ),
              ],
            ),
          ),
          MiniPlayer(),
        ],
      ),
    );
  }
}
