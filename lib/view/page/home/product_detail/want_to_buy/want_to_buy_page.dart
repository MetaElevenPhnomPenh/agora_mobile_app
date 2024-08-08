import 'package:agora/export.dart';

class WantToBuyPage extends StatelessWidget {
  const WantToBuyPage({super.key});

  static const String route = "/WantToBuyPage";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Stack(
          children: [
            const Text(
              "Seek to purchase",
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                "My purchase",
                style: context.textTheme.labelSmall,
              ),
            ),
          ],
        ),
      ),
      body: Container(
        color: AppColor.grey6Color,
        // padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            ///
            Expanded(
              child: ListView(
                children: [
                  /// Product
                  Container(
                    color: AppColor.whiteColor,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        12.sh(),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: Text(
                            "Text here",
                            style: context.textTheme.displaySmall,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: Text(
                            "Text here",
                            style: context.textTheme.bodyMedium,
                          ),
                        ),
                        8.sh(),
                        SizedBox(
                          height: 100,
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            children: [
                              Expanded(
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: 12,
                                  itemBuilder: (context, ind) {
                                    return Container(
                                      height:
                                          MediaQuery.of(context).size.height,
                                      width: 90,
                                      margin: EdgeInsets.only(
                                        right: 12,
                                        left: ind == 0 ? 12 : 0,
                                      ),
                                      padding: const EdgeInsets.all(6),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          width: 1,
                                          color: AppColor.grey6Color,
                                        ),
                                      ),
                                      child: Column(
                                        children: [
                                          Expanded(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 8),
                                              child: Image.network(
                                                "https://pngimg.com/uploads/hoodie/hoodie_PNG24.png",
                                              ),
                                            ),
                                          ),
                                          8.sh(),
                                          Text(
                                            "Hoodie Fake no copy",
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: context.textTheme.bodyMedium
                                                ?.copyWith(
                                              fontSize: 12,
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ),
                              8.sw(),
                              Text(
                                "Switch",
                                style: context.textTheme.bodyMedium?.copyWith(
                                  fontSize: 12,
                                ),
                              ),
                              const Icon(
                                Icons.arrow_forward_ios_rounded,
                                size: 14,
                              ),
                              8.sw(),
                            ],
                          ),
                        ),
                        12.sh(),
                      ],
                    ),
                  ),

                  12.sh(),

                  /// Initiate a purchase
                  Container(
                    color: AppColor.whiteColor,
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Initiate a purchase",
                          style: context.textTheme.displaySmall,
                        ),
                        TextField(
                          autofocus: true,
                          decoration: InputDecoration(
                            prefix: Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: Text(
                                "\$",
                                style: context.textTheme.displaySmall,
                              ),
                            ),
                            hintText: "Enter the price you want to buy",
                          ),
                          keyboardType: TextInputType.number,
                        ),
                      ],
                    ),
                  ),

                  12.sh(),

                  /// Frequently ask questions
                  Container(
                    color: AppColor.whiteColor,
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Frequently ask questions",
                          style: context.textTheme.displaySmall,
                        ),
                        8.sh(),
                        Text(
                          "Q: How are you all bro bro ???",
                          style: context.textTheme.bodyMedium,
                        ),
                        Text(
                          "A: Yes, I am fine thank you bye bye!!",
                          style: context.textTheme.bodyMedium,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            ///
            Container(
              color: AppColor.whiteColor,
              padding: const EdgeInsets.all(12),
              child: SafeArea(
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            text: TextSpan(
                              text: "Deposit",
                              style: context.textTheme.bodyMedium,
                              children: [
                                TextSpan(
                                  text: " \$",
                                  style:
                                      context.textTheme.displaySmall?.copyWith(
                                    fontSize: 14,
                                  ),
                                ),
                                TextSpan(
                                  text: "0.00",
                                  style: context.textTheme.displaySmall,
                                ),
                              ],
                            ),
                          ),
                          Text(
                            "Due to the special mode, the use of discount 2 is not supported",
                            style: context.textTheme.bodyMedium,
                          ),
                        ],
                      ),
                    ),
                    12.sw(),
                    Container(
                      padding: const EdgeInsets.all(12),
                      color: AppColor.primaryButtonColor,
                      child: Text(
                        "Payment of deposit",
                        style: context.textTheme.bodyMedium?.copyWith(
                          color: AppColor.whiteColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
