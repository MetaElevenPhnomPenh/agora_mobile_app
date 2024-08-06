import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';

import '../../../export.dart';

class VideoPlayerWidget extends StatefulWidget {
  const VideoPlayerWidget({super.key});

  @override
  State<VideoPlayerWidget> createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController _controller;
  late ChewieController _chewieController;

  @override
  void initState() {
    _videoInitial();
    super.initState();
  }

  void _videoInitial() async {
    final _uri = Uri.parse(
      'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
    );
    _controller = VideoPlayerController.networkUrl(_uri);
    await _controller.initialize();
    if (mounted) {
      setState(() {});
      _chewieController = ChewieController(
        videoPlayerController: _controller,
        autoPlay: true,
        looping: true,
      );
    } else {
      _chewieController.dispose();
      _controller.dispose();
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_controller.value.isInitialized) {
      return Container(
        alignment: Alignment.center,
        color: AppColor.blackColor,
        child: AspectRatio(
          aspectRatio: _controller.value.aspectRatio,
          child: Chewie(
            controller: _chewieController,
          ),
        ),
      );
    }
    return Container(
      alignment: Alignment.center,
      color: AppColor.blackColor,
      child: const CircularProgressIndicator(),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _chewieController.dispose();
    super.dispose();
  }
}
