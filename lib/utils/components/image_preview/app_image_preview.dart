import 'package:agora/utils/components/image_preview/video_player_widget.dart';
import 'package:photo_view/photo_view.dart';

import '../../../../export.dart';

class AppImagePreview extends StatelessWidget {
  static const String route = "/AppImagePreview";

  const AppImagePreview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            itemCount: 5,
            itemBuilder: (context, ind) {
              /// if image preview
              if (ind % 2 == 0) {
                return PhotoView(
                  imageProvider: const NetworkImage(
                    "https://static.vecteezy.com/system/resources/previews/035/320/453/non_2x/ai-generated-blank-grey-hoodie-front-and-back-view-mockup-isolated-on-transparent-background-free-png.png",
                  ),
                );
              } else {
                /// else if video preview
                return const VideoPlayerWidget();
              }
            },
          ),
          Align(
            alignment: Alignment.topLeft,
            child: SafeArea(
              child: IconButton(
                icon: const Icon(
                  Icons.close,
                  color: AppColor.grey6Color,
                ),
                onPressed: () => app.navigate.pop(),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SafeArea(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Spacer(),
                  IconButton(
                    onPressed: () {
                      //
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios_new_rounded,
                      color: AppColor.whiteColor,
                    ),
                  ),
                  const SizedBox(width: 24),
                  const Text(
                    "1/2",
                    style: TextStyle(
                      fontSize: 17,
                      color: AppColor.whiteColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(width: 24),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: AppColor.whiteColor,
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
