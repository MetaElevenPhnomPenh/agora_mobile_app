import 'package:agora/export.dart';

class BuyNowBodyWidget extends StatelessWidget {
  const BuyNowBodyWidget({super.key});

  static const String route = "/BuyNowBodyWidget";

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          1.sh(),
          Container(
            width: MediaQuery.of(context).size.width,
            color: AppColor.whiteColor,
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 8,
            ),
            child: const Text(
              "Check the size chart",
            ),
          ),
          Expanded(
            child: Padding(
              padding: 12.px(),
              child: ListView(
                children: [
                  8.sh(),
                  const Text(
                    "Colors",
                  ),
                  12.sh(),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                      childAspectRatio: .9,
                    ),
                    itemBuilder: (_, index) => Container(
                      decoration: BoxDecoration(
                        color: AppColor.containerBackgroundBlack,
                        border: index != 0
                            ? null
                            : Border.all(
                                width: 1,
                                color: AppColor.blackColor,
                              ),
                      ),
                      padding: const EdgeInsets.all(6),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Expanded(
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              padding: const EdgeInsets.all(8),
                              child: Image.network(
                                "https://target.scene7.com/is/image/Target/GUEST_4b405ae1-a4d6-4c57-b1f2-fb170b9c689c?wid=488&hei=488&fmt=pjpeg",
                              ),
                            ),
                          ),
                          const Text(
                            "White color",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                    itemCount: 6,
                  ),
                  12.sh(),
                  const Text(
                    "Size",
                  ),
                  12.sh(),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 5,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                      childAspectRatio: .9,
                    ),
                    itemBuilder: (_, index) => Container(
                      decoration: BoxDecoration(
                        color: AppColor.containerBackgroundBlack,
                        border: index != 0
                            ? null
                            : Border.all(
                                width: 1,
                                color: AppColor.blackColor,
                              ),
                      ),
                      padding: const EdgeInsets.all(6),
                      child: const Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "M",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 19,
                            ),
                          ),
                          Text(
                            "\$133",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                    itemCount: 4,
                  ),
                ],
              ),
            ),
          ),
          SafeArea(
            child: Container(
              margin: 12.px(),
              height: 70,
              width: MediaQuery.of(context).size.width,
              color: AppColor.primaryButtonColor,
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      alignment: Alignment.centerRight,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "\$158",
                            style: context.textTheme.displayMedium?.copyWith(
                              color: AppColor.whiteColor,
                              fontSize: 19,
                            ),
                          ),
                          Text(
                            "\$189",
                            style: context.textTheme.labelSmall?.copyWith(
                              color: AppColor.whiteColor,
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  12.sw(),
                  Container(
                    width: 1,
                    height: 20,
                    color: AppColor.grey6Color,
                  ),
                  12.sw(),
                  Expanded(
                    child: Text(
                      "From 2-4 day arrive",
                      style: context.textTheme.labelLarge?.copyWith(
                        color: AppColor.whiteColor,
                        fontSize: 15,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
