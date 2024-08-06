import 'package:video_player/video_player.dart';

import '../../../export.dart';

class VideoPlayerWidget extends StatefulWidget {
  const VideoPlayerWidget({super.key});

  @override
  State<VideoPlayerWidget> createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    final _uri = Uri.parse(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4');
    _controller = VideoPlayerController.networkUrl(_uri)
      ..initialize().then(
        (_) {
          if (mounted) {
            setState(() {});
          } else {
            _controller.dispose();
          }
        },
      )
      ..play();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (_controller.value.isInitialized) {
      return Container(
        alignment: Alignment.center,
        color: AppColor.blackColor,
        child: AspectRatio(
          aspectRatio: _controller.value.aspectRatio,
          child: VideoPlayer(
            _controller,
          ),
        ),
      );
    }

    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
