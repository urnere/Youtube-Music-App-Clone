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
  final ScrollController _scrollController = ScrollController();
  bool _showBackgroundImage = true;

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

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.offset > 50 && _showBackgroundImage) {
      setState(() {
        _showBackgroundImage = false;
      });
    } else if (_scrollController.offset <= 50 && !_showBackgroundImage) {
      setState(() {
        _showBackgroundImage = true;
      });
    }
  }

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
      body: Stack(
        children: [
          if (_showBackgroundImage)
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              height: 250,
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/background.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black.withOpacity(0.4),
                        AppColors.mainColor,
                      ],
                      stops: [0.5, 1.0],
                    ),
                  ),
                ),
              ),
            ),

          Column(
            children: [
              Expanded(
                child: CustomScrollView(
                  controller: _scrollController,
                  slivers: [
                    CustomSliverAppBar(
                      categories: _categories,
                      scrollController: _scrollController,
                    ),
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
        ],
      ),
    );
  }
}
