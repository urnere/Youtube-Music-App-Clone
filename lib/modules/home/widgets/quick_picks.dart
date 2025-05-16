import 'package:flutter/material.dart';
import 'package:yt_music/themes/app_colors.dart';

class QuickPicks extends StatelessWidget {
  const QuickPicks({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> songs = [
      {
        'title': 'HMDL (feat. Organize, Batuflex ve Chiko)',
        'artist': 'ERAY067, Mansur ve Avie',
        'playCount': '4,1 Mn kez dinlendi',
        'image': 'assets/images/image 1.png',
      },
      {
        'title': 'Yarasalar',
        'artist': 'Ati242',
        'playCount': '13 Mn kez dinlendi',
        'image': 'assets/images/image 2.png',
      },
      {
        'title': 'Keşke',
        'artist': 'BLOK3 ve Ati242',
        'playCount': '7,3 Mn kez dinlendi',
        'image': 'assets/images/image 3.png',
      },
      {
        'title': 'Dedublüman / Çağrı Çelik - Gamzedeyim',
        'artist': 'Dedublüman',
        'playCount': '102 Mn görüntüleme',
        'image': 'assets/images/image 4.png',
      },

      {
        'title': 'Yeni Şarkı 1',
        'artist': 'Sanatçı 1',
        'playCount': '5 Mn kez dinlendi',
        'image': 'assets/images/image 5.png',
      },
      {
        'title': 'Yeni Şarkı 2',
        'artist': 'Sanatçı 2',
        'playCount': '8 Mn kez dinlendi',
        'image': 'assets/images/image 6.png',
      },
      {
        'title': 'Yeni Şarkı 3',
        'artist': 'Sanatçı 3',
        'playCount': '3 Mn kez dinlendi',
        'image': 'assets/images/Song 1.png',
      },
      {
        'title': 'Yeni Şarkı 4',
        'artist': 'Sanatçı 4',
        'playCount': '6 Mn kez dinlendi',
        'image': 'assets/images/Song 2.png',
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
                'Hızlı seçimler',
                style: TextStyle(
                  color: AppColors.mainTextColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextButton(
                style: ButtonStyle(
                  padding: WidgetStatePropertyAll(
                    EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                  ),
                  side: WidgetStatePropertyAll(
                    BorderSide(color: AppColors.secondColor, width: 0.5),
                  ),
                ),
                onPressed: () {},
                child: Text(
                  'Tümünü oynat',
                  style: TextStyle(
                    color: AppColors.mainTextColor,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 1),
        SizedBox(
          height: 320,
          child: PageView.builder(
            controller: PageController(viewportFraction: 0.88, initialPage: 0),
            itemCount: (songs.length / 4).ceil(),
            itemBuilder: (context, pageIndex) {
              final startIndex = pageIndex * 4;
              final endIndex =
                  (startIndex + 4) < songs.length
                      ? startIndex + 4
                      : songs.length;

              final pageSongs = songs.sublist(startIndex, endIndex);

              return Container(
                margin: EdgeInsets.only(right: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: pageSongs.length,
                  itemBuilder: (context, index) {
                    return Container(
                      height: 70,
                      margin: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                      child: Row(
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              image: DecorationImage(
                                image: AssetImage(pageSongs[index]['image']),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(width: 12),

                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  pageSongs[index]['title'],
                                  style: TextStyle(
                                    color: AppColors.mainTextColor,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                SizedBox(height: 4),
                                Text(
                                  '${pageSongs[index]['artist']} • ${pageSongs[index]['playCount']}',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.more_vert,
                              color: AppColors.mainTextColor,
                            ),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ),

        Container(
          height: 20,
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              (songs.length / 4).ceil(),
              (index) => Container(
                width: 8,
                height: 8,
                margin: EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: index == 0 ? AppColors.mainTextColor : Colors.grey,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
