import 'package:flutter/material.dart';
import 'package:yt_music/themes/app_colors.dart';

class TypeHeader extends StatelessWidget {
  final List<String> categories;

  const TypeHeader({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.only(left: 15),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: AppColors.secondTextColor,
            ),
            child: Text(
              categories[index],
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
