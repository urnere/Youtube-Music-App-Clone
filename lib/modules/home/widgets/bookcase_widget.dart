import 'package:flutter/material.dart';
import 'package:yt_music/themes/app_colors.dart';

class BookcaseWidget extends StatelessWidget {
  const BookcaseWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> categories = [
      {
        'title': 'Rock',
        'artist': 'Barış Özdemir',
        'count': '449',
        'images': [
          'assets/images/image 1.png',
          'assets/images/image 2.png',
          'assets/images/image 3.png',
          'assets/images/image 4.png',
        ],
      },
      {
        'title': 'Pop',
        'artist': 'Barış Özdemir',
        'count': '151',
        'images': [
          'assets/images/image 5.png',
          'assets/images/image 6.png',
          'assets/images/Song 1.png',
          'assets/images/Song 2.png',
        ],
      },
      {
        'title': 'Hip Hop',
        'artist': 'Barış Özdemir',
        'count': '67',
        'images': [
          'assets/images/image 3.png',
          'assets/images/image 4.png',
          'assets/images/image 1.png',
          'assets/images/image 2.png',
        ],
      },
    ];

    return Container(
      color: Colors.transparent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Kitaplığınız',
                  style: TextStyle(
                    color: AppColors.mainTextColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Tümünü Gör',
                    style: TextStyle(
                      color: AppColors.mainTextColor,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 240,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final category = categories[index];
                return Container(
                  width: 180,
                  margin: const EdgeInsets.only(left: 16, right: 4),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 180,
                        decoration: BoxDecoration(
                          color: AppColors.secondColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: GridView.count(
                            crossAxisCount: 2,
                            physics: const NeverScrollableScrollPhysics(),
                            padding: EdgeInsets.zero,

                            children: List.generate(4, (i) {
                              return Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  color: AppColors.secondColor,
                                ),
                                clipBehavior: Clip.hardEdge,
                                child: Image.asset(
                                  category['images'][i],
                                  fit: BoxFit.cover,
                                ),
                              );
                            }),
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        category['title'],
                        style: TextStyle(
                          color: AppColors.mainTextColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        "${category['artist']} • ${category['count']} parça",
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
