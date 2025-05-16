import 'package:flutter/material.dart';
import 'package:yt_music/themes/app_colors.dart';

class MiniPlayer extends StatelessWidget {
  final bool isPlaying;
  final String? songTitle;
  final String? thumbnailUrl;
  final VoidCallback? onPlayPause;
  final VoidCallback? onCast;
  final VoidCallback? onTap;

  const MiniPlayer({
    super.key,
    this.isPlaying = false,
    this.songTitle,
    this.thumbnailUrl,
    this.onPlayPause,
    this.onCast,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          color: AppColors.secondColor,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 4,
              offset: const Offset(0, -1),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 50,
              height: 50,
              margin: const EdgeInsets.only(left: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: Colors.grey[700],
              ),
              child:
                  thumbnailUrl != null
                      ? ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: Image.network(thumbnailUrl!, fit: BoxFit.cover),
                      )
                      : const Icon(
                        Icons.music_note,
                        color: AppColors.mainTextColor,
                      ),
            ),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Text(
                  songTitle ?? "Bir şey çalınmıyor",
                  style: const TextStyle(
                    color: AppColors.mainTextColor,
                    fontWeight: FontWeight.w500,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),

            IconButton(
              icon: const Icon(Icons.cast, color: AppColors.mainTextColor),
              onPressed: onCast,
              tooltip: 'Televizyona yansıt',
            ),
            IconButton(
              icon: Icon(
                isPlaying ? Icons.pause : Icons.play_arrow,
                color: AppColors.mainTextColor,
              ),
              onPressed: onPlayPause,
              tooltip: isPlaying ? 'Duraklat' : 'Oynat',
            ),
            const SizedBox(width: 8),
          ],
        ),
      ),
    );
  }
}
