import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yt_music/modules/home/widgets/type_header.dart';
import 'package:yt_music/themes/app_colors.dart';

class CustomSliverAppBar extends StatelessWidget {
  final List<String> categories;

  const CustomSliverAppBar({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      pinned: true,
      backgroundColor: AppColors.mainColor,
      title: SvgPicture.asset("assets/images/logo.svg"),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.notifications_outlined,
            color: AppColors.mainTextColor,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.search_outlined, color: AppColors.mainTextColor),
        ),
        CircleAvatar(radius: 12, child: Text("BÖ")),
        SizedBox(width: 10),
      ],
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: TypeHeader(categories: categories),
      ),
    );
  }
}
