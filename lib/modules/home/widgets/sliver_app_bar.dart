import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yt_music/modules/home/widgets/type_header.dart';
import 'package:yt_music/themes/app_colors.dart';

class CustomSliverAppBar extends StatefulWidget {
  final List<String> categories;
  final ScrollController scrollController;

  const CustomSliverAppBar({
    super.key,
    required this.categories,
    required this.scrollController,
  });

  @override
  State<CustomSliverAppBar> createState() => _CustomSliverAppBarState();
}

class _CustomSliverAppBarState extends State<CustomSliverAppBar> {
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
    return SliverAppBar(
      floating: true,
      pinned: true,
      backgroundColor: _isScrolled ? AppColors.mainColor : Colors.transparent,
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
        CircleAvatar(
          radius: 12,
          child: Text("BÖ", style: TextStyle(fontSize: 11)),
        ),
        SizedBox(width: 10),
      ],
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: TypeHeader(
          categories: widget.categories,
          scrollController: widget.scrollController,
        ),
      ),
    );
  }
}
