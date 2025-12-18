import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';
import '../../resources/app_colors.dart';

class LessonVideoCard extends StatefulWidget {
  final String videoUrl;
  final String thumbnailUrl;

  const LessonVideoCard({
    super.key,
    required this.videoUrl,
    required this.thumbnailUrl,
  });

  @override
  State<LessonVideoCard> createState() => _LessonVideoCardState();
}

class _LessonVideoCardState extends State<LessonVideoCard> {
  late VideoPlayerController _videoController;
  ChewieController? _chewieController;

  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();

    _videoController = VideoPlayerController.networkUrl(
      Uri.parse(widget.videoUrl),
    )..initialize().then((_) {
        setState(() {});
      });

    _chewieController = ChewieController(
      videoPlayerController: _videoController,
      autoPlay: false,
      looping: false,
      showControls: true,
    );
  }

  @override
  void dispose() {
    _videoController.dispose();
    _chewieController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      clipBehavior: Clip.hardEdge,
      elevation: 4,
      child: Stack(
        children: [
          /// Thumbnail OR Video
          _isPlaying
              ? Chewie(controller: _chewieController!)
              : Image.network(
                  widget.thumbnailUrl,
                  width: double.infinity,
                  height: 260.h,
                  fit: BoxFit.cover,
                ),

          /// Play Button
          if (!_isPlaying)
            Center(
              child: IconButton(
                icon: Icon(Icons.play_circle_fill,
                    size: 70, color: AppColors.white),
                onPressed: () {
                  setState(() {
                    _isPlaying = true;
                    _videoController.play();
                  });
                },
              ),
            ),

          /// Bookmark Icon
          Positioned(
            top: 12,
            right: 12,
            child: Container(
              decoration: BoxDecoration(
                  color: AppColors.fillColor,
                  borderRadius: BorderRadius.circular(12.0)),
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.bookmark_border, color: AppColors.primaryColor),
            ),
          ),
        ],
      ),
    );
  }
}
