import 'package:agora/export.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WantToBuyDisplayAsGridWidget extends StatelessWidget {
  const WantToBuyDisplayAsGridWidget({super.key});

  static const String route = "/WantToBuyDisplayAsGridWidget";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: 12.px(),
      child: Column(
        children: [
          12.sh(),
          Expanded(
            child: GridView.builder(
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                childAspectRatio: .9,
              ),
              itemBuilder: (_, index) => GestureDetector(
                onTap: () =>
                    context.read<OrderCounterCubit>().selectColor(index),
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColor.containerBackgroundBlack,
                    border: index != 1
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
              ),
              itemCount: 15,
            ),
          ),
          SafeArea(
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: FilledButton(
                onPressed: () {
                  //
                },
                child: Text("Confirm"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class WantToBuyDisplayHeaderWidget extends StatelessWidget {
  const WantToBuyDisplayHeaderWidget({super.key});

  static const String route = "/WantToBuyDisplayHeaderWidget";

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: [
          Container(
            width: 70,
            height: 70,
            padding: const EdgeInsets.all(12),
            margin: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              border: Border.all(
                width: 1,
                color: AppColor.grey6Color,
              ),
            ),
            child: Image.network(
              "https://m.media-amazon.com/images/I/A13usaonutL._CLa%7C2140%2C2000%7C616mtWb4SkL.png%7C0%2C0%2C2140%2C2000%2B0.0%2C0.0%2C2140.0%2C2000.0_AC_UY1000_.png",
            ),
          ),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      "\$153",
                      style: context.textTheme.displayMedium,
                    ),
                    8.sw(),
                    Text(
                      "\$199",
                      style: context.textTheme.bodySmall?.copyWith(
                        color: AppColor.darkGreyColor,
                        fontSize: 12,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                  ],
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: AppColor.grey6Color,
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 4,
                    vertical: 2,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "From 10.4\$/month",
                        style: context.textTheme.labelSmall?.copyWith(
                          fontSize: 10,
                        ),
                      ),
                      const Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: AppColor.lightGreyColor,
                        size: 14,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          "Selected color: Space grey - Mibai LC",
                          style: context.textTheme.labelSmall?.copyWith(
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
