import 'package:agora/export.dart';

class ProductFilterPage extends StatelessWidget {
  const ProductFilterPage({super.key});

  static const String route = "/ProductFilterPage";

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: Column(
          children: [
            SafeArea(
              bottom: false,
              child: SizedBox(
                height: 50,
                child: Row(
                  children: [
                    SizedBox(
                      width: 90,
                      child: IconButton(
                        onPressed: () => app.navigate.pop(),
                        icon: const Icon(
                          Icons.arrow_back_ios_new_outlined,
                          size: 19,
                        ),
                      ),
                    ),
                    Expanded(
                      child: TabBar(
                        padding: EdgeInsets.zero,
                        labelPadding: EdgeInsets.zero,
                        tabAlignment: TabAlignment.start,
                        isScrollable: true,
                        // indicatorColor: AppColor.grey6Color.withOpacity(.0),
                        tabs: [
                          SizedBox(
                            width:
                                (MediaQuery.of(context).size.width - 140) / 3,
                            height: 50,
                            // alignment: Alignment.centerLeft,
                            child: const Tab(
                              text: "All",
                            ),
                          ),
                          SizedBox(
                            width:
                                (MediaQuery.of(context).size.width - 140) / 3,
                            child: const Tab(
                              text: "Male",
                            ),
                          ),
                          SizedBox(
                            width:
                                (MediaQuery.of(context).size.width - 140) / 3,
                            child: const Tab(
                              text: "Female",
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 50,
                      child: IconButton(
                        icon: const Icon(Icons.search),
                        onPressed: () {
                          //
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                color: AppColor.grey6Color,
                child: Row(
                  children: [
                    SizedBox(
                      width: 90,
                      height: MediaQuery.of(context).size.height,
                    ),
                    Expanded(
                      child: Container(
                        color: AppColor.whiteColor,
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
