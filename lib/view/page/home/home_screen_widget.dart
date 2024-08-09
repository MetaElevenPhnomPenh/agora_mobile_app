import 'package:agora/export.dart';

class HomeScreenWidget extends StatefulWidget {
  const HomeScreenWidget({super.key});

  @override
  State<HomeScreenWidget> createState() => _HomeScreenWidgetState();
}

class _HomeScreenWidgetState extends State<HomeScreenWidget>
    with SingleTickerProviderStateMixin {
  late TabController bottomTabController;

  @override
  void initState() {
    bottomTabController = TabController(length: 12, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Expanded(
            child: NestedScrollView(
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) {
                return <Widget>[
                  SliverAppBar(
                    title: const Row(
                      children: [
                        Icon(Icons.flutter_dash),
                        SizedBox(
                          width: 12,
                        ),
                        Expanded(
                          child: Text("得物联合国家权威检测机构保障"),
                        ),
                      ],
                    ),
                    actions: [
                      AppGestureDetector(
                        child: const Icon(
                          Icons.login,
                          color: Colors.teal,
                        ),
                        onTap: () => app.navigate.pushNamed(LoginPage.route),
                      ),
                      16.sw(),
                    ],
                    pinned: true,
                    floating: true,
                    forceElevated: innerBoxIsScrolled,
                    bottom: PreferredSize(
                      preferredSize: const Size.fromHeight(85),
                      child: SizedBox(
                        height: 85,
                        child: Column(
                          children: [
                            Expanded(
                              child: Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 12),
                                decoration: BoxDecoration(
                                  color: Colors.grey[100],
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.search,
                                      color: Colors.grey[500],
                                    ),
                                    Expanded(
                                      child: TextField(
                                        decoration: InputDecoration(
                                          hintText: T.search1.r,
                                          focusColor: AppColor.bgDarkColor,
                                          border: InputBorder.none,
                                          focusedBorder: InputBorder.none,
                                          enabledBorder: InputBorder.none,
                                          errorBorder: InputBorder.none,
                                          disabledBorder: InputBorder.none,
                                          contentPadding: const EdgeInsets.only(
                                            bottom: 12,
                                            left: 4,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Icon(
                                      Icons.camera_alt,
                                      color: Colors.grey[500],
                                      size: 20,
                                    ),
                                    Container(
                                      height: 20,
                                      width: .5,
                                      color: Colors.grey[400],
                                      margin: const EdgeInsets.symmetric(
                                        horizontal: 12,
                                      ),
                                    ),
                                    Text(
                                      T.filter.r,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 12),
                            Row(
                              children: [
                                Expanded(
                                  child: Stack(
                                    children: [
                                      SizedBox(
                                        height: 35,
                                        child: TabBar(
                                          isScrollable: true,
                                          tabAlignment: TabAlignment.start,
                                          controller: bottomTabController,
                                          labelStyle: const TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.w700,
                                          ),
                                          indicatorWeight: .5,
                                          automaticIndicatorColorAdjustment:
                                              false,
                                          labelPadding:
                                              const EdgeInsets.only(bottom: 10),
                                          tabs: [
                                            for (int i = 0; i < 12; i++)
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                  horizontal: 12,
                                                ),
                                                child: Text(
                                                  'Tag',
                                                  style: context
                                                      .textTheme.bodyMedium,
                                                ),
                                              ),
                                          ],
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.centerRight,
                                        child: Container(
                                          width: 25,
                                          height: 35,
                                          decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                              begin: Alignment.centerLeft,
                                              end: Alignment.centerRight,
                                              colors: [
                                                Colors.white.withOpacity(.0),
                                                Colors.white,
                                              ],
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                InkWell(
                                  onTap: () => app.navigate
                                      .pushNamed(ProductFilterPage.route),
                                  child: Padding(
                                    padding: 8.pb(),
                                    child: Row(
                                      children: [
                                        const Icon(
                                          Icons.menu,
                                          size: 14,
                                          color: AppColor.blackColor,
                                        ),
                                        Text(
                                          "Menu",
                                          style: context.textTheme.bodyMedium
                                              ?.copyWith(
                                            fontSize: 12,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                12.sw(),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ];
              },
              body: Container(
                color: AppColor.grey6Color,
                child: TabBarView(
                  controller: bottomTabController,
                  children: [
                    for (int i = 0; i < 12; i++)
                      SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const SizedBox(height: 1),
                            GridView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 5,
                              ),
                              itemBuilder: (_, index) => InkWell(
                                onTap: () {
                                  app.navigate.pushNamed(
                                    ProductsListedByCategoryPage.route,
                                  );
                                },
                                child: const BrandCardWidget(),
                              ),
                              itemCount: 10,
                            ),
                            GridView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 4,
                              ),
                              itemBuilder: (_, index) =>
                                  const BrandCardWidget(),
                              itemCount: 4,
                            ),
                            GridView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: .5,
                                crossAxisSpacing: .5,
                              ),
                              itemBuilder: (_, index) =>
                                  const ProductCardWidget(),
                              itemCount: 14,
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
