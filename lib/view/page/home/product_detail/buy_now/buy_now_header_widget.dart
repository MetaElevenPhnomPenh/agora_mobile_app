import 'package:agora/export.dart';

class BuyNowHeaderWidget extends StatelessWidget {
  const BuyNowHeaderWidget({super.key});

  static const String route = "/BuyNowHeaderWidget";

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

                      /// Select item amount
                      ...[
                        12.sw(),
                        Container(
                          color: AppColor.grey6Color,
                          width: 30,
                          height: 30,
                          child: Center(
                            child: InkWell(
                              onTap: () {},
                              child: const Icon(
                                Icons.remove,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 2),
                        Container(
                          color: AppColor.grey6Color,
                          width: 30,
                          height: 30,
                          child: const Center(
                            child: Text("2"),
                          ),
                        ),
                        const SizedBox(width: 2),
                        Container(
                          color: AppColor.grey6Color,
                          width: 30,
                          height: 30,
                          child: Center(
                            child: InkWell(
                              onTap: () {},
                              child: const Icon(
                                Icons.add,
                              ),
                            ),
                          ),
                        ),
                        12.sw(),
                      ],
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
