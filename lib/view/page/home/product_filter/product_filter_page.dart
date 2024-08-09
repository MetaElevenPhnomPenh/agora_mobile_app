import 'package:agora/export.dart';

class ProductFilterPage extends StatefulWidget {
  const ProductFilterPage({super.key});

  static const String route = "/ProductFilterPage";

  @override
  State<ProductFilterPage> createState() => _ProductFilterPageState();
}

class _ProductFilterPageState extends State<ProductFilterPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: Column(
          children: [
            SafeArea(
              bottom: false,
              left: false,
              child: SizedBox(
                height: 40,
                child: Row(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      width: 70,
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
                        indicator: const UnderlineTabIndicator(
                          borderSide: BorderSide(
                            width: 2,
                            color: AppColor.primaryButtonColor,
                          ),
                          insets: EdgeInsets.symmetric(
                            horizontal: 25,
                          ),
                        ),
                        tabs: [
                          SizedBox(
                            width:
                                (MediaQuery.of(context).size.width - 140) / 3,
                            height: 40,
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
                      width: 40,
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
              child: TabBarView(
                children: [
                  for (int i = 0; i < 3; i++)
                    Container(
                      color: AppColor.grey6Color,
                      child: Row(
                        children: [
                          SizedBox(
                            width: 90,
                            height: MediaQuery.of(context).size.height,
                            child: ListView.builder(
                              padding: EdgeInsets.zero,
                              itemCount: 12,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    if (mounted) {
                                      setState(() {
                                        _currentPage = index;
                                      });
                                    }
                                    _pageController.jumpToPage(
                                      _currentPage,
                                    );
                                  },
                                  child: Padding(
                                    padding: 16.py(),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          "Hello $index",
                                          style: context.textTheme.bodyMedium
                                              ?.copyWith(
                                            fontSize: 14,
                                            fontWeight: index == _currentPage
                                                ? FontWeight.w700
                                                : null,
                                          ),
                                        ),
                                        if (index == _currentPage) ...[
                                          4.sh(),
                                          Container(
                                            width: 15,
                                            height: 1,
                                            color: AppColor.blackColor,
                                          ),
                                        ],
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          Expanded(
                            child: Container(
                              height: MediaQuery.of(context).size.height,
                              color: Colors.white,
                              child: PageView.builder(
                                controller: _pageController,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: 12,
                                scrollDirection: Axis.vertical,
                                itemBuilder: (context, page) {
                                  return SizedBox(
                                    child: ListView.builder(
                                      itemCount: 3,
                                      padding: EdgeInsets.zero,
                                      itemBuilder: (context, ind) {
                                        return ListView(
                                          shrinkWrap: true,
                                          padding: EdgeInsets.zero,
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          children: [
                                            12.sh(),
                                            Padding(
                                              padding: 12.px(),
                                              child: Text(
                                                "Category ${ind + 1}",
                                                style: context
                                                    .textTheme.bodyMedium
                                                    ?.copyWith(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ),
                                            GridView.builder(
                                              shrinkWrap: true,
                                              physics:
                                                  const NeverScrollableScrollPhysics(),
                                              padding: EdgeInsets.zero,
                                              itemCount: 6 - ind,
                                              gridDelegate:
                                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 3,
                                                crossAxisSpacing: 8,
                                                mainAxisSpacing: 8,
                                                childAspectRatio: 1,
                                              ),
                                              itemBuilder: (_, index) =>
                                                  GestureDetector(
                                                onTap: () =>
                                                    app.navigate.pushNamed(
                                                  ProductsListedByCategoryPage
                                                      .route,
                                                ),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      Expanded(
                                                        child: Container(
                                                          width: MediaQuery.of(
                                                                  context)
                                                              .size
                                                              .width,
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8),
                                                          child: Image.network(
                                                            "https://target.scene7.com/is/image/Target/GUEST_4b405ae1-a4d6-4c57-b1f2-fb170b9c689c?wid=488&hei=488&fmt=pjpeg",
                                                          ),
                                                        ),
                                                      ),
                                                      const Text(
                                                        "White color",
                                                        maxLines: 1,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          fontSize: 12,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        );
                                      },
                                    ),
                                  );
                                },
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
      ),
    );
  }
}
