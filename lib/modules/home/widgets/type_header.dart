import 'package:flutter/material.dart';
import 'package:yt_music/themes/app_colors.dart';

class TypeHeader extends StatefulWidget {
  final List<String> categories;
  final ScrollController scrollController;

  const TypeHeader({
    super.key,
    required this.categories,
    required this.scrollController,
  });

  @override
  State<TypeHeader> createState() => _TypeHeaderState();
}

class _TypeHeaderState extends State<TypeHeader> {
  bool _isScrolled = false;

  @override
  void initState() {
    super.initState();
    widget.scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    widget.scrollController.removeListener(_scrollListener);
    super.dispose();
  }

  void _scrollListener() {
    if (widget.scrollController.offset > 50 && !_isScrolled) {
      setState(() {
        _isScrolled = true;
      });
    } else if (widget.scrollController.offset <= 50 && _isScrolled) {
      setState(() {
        _isScrolled = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      margin: const EdgeInsets.symmetric(vertical: 10),
      color: _isScrolled ? AppColors.mainColor : Colors.transparent,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.categories.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.only(left: 15),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color:
                  _isScrolled
                      ? AppColors.secondColor
                      : AppColors.secondTextColor,
            ),
            child: Text(
              widget.categories[index],
              style: TextStyle(
                color: AppColors.mainTextColor,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          );
        },
      ),
    );
  }
}
