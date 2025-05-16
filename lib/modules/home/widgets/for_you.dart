import 'package:flutter/material.dart';
import 'package:yt_music/themes/app_colors.dart';

class ForYouSection extends StatelessWidget {
  const ForYouSection({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> playlists = [
      {
        "image": "assets/images/image 1.png",
        "title": "Modern Karadeniz",
        "artists": "Ekin Uzunlar, Resul Dindar, Kâzım Koyuncu ...",
      },
      {
        "image": "assets/images/image 2.png",
        "title": "Anadolu Rock Klasikleri",
        "artists": "Barış Manço, Erkin Koray, Moğollar ve Cem Karaca",
      },
      {
        "image": "assets/images/image 3.png",
        "title": "Türkçe Pop Hits",
        "artists": "Tarkan, Sezen Aksu, Kenan Doğulu",
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Sizin için öne çıkan oynatma listeleri',
                style: TextStyle(
                  color: AppColors.mainTextColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Icon(Icons.chevron_right, color: AppColors.mainTextColor),
            ],
          ),
        ),
        SizedBox(
          height: 250,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            itemCount: playlists.length,
            itemBuilder: (context, index) {
              final playlist = playlists[index];
              return PlaylistCard(
                imagePath: playlist['image']!,
                title: playlist['title']!,
                artists: playlist['artists']!,
              );
            },
          ),
        ),
      ],
    );
  }
}

class PlaylistCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String artists;

  const PlaylistCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.artists,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      margin: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(
              imagePath,
              height: 140,
              width: 140,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  height: 140,
                  width: 140,
                  color: AppColors.secondColor,
                  child: Icon(
                    Icons.music_note,
                    color: AppColors.mainTextColor,
                    size: 50,
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: TextStyle(
              color: AppColors.mainTextColor,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 4),
          Text(
            artists,
            style: TextStyle(
              color: AppColors.mainTextColor.withOpacity(0.7),
              fontSize: 12,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
