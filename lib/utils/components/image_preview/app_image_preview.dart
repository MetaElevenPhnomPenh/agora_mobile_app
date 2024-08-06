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
              return PhotoView(
                imageProvider: const NetworkImage(
                  "https://static.vecteezy.com/system/resources/previews/035/320/453/non_2x/ai-generated-blank-grey-hoodie-front-and-back-view-mockup-isolated-on-transparent-background-free-png.png",
                ),
              );
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
          )
        ],
      ),
    );
  }
}
