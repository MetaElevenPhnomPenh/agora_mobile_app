import 'package:agora/export.dart';

class ProductsListedByCategoryPage extends StatefulWidget {
  const ProductsListedByCategoryPage({super.key});

  static const String route = "/ProductsListedByCategoryPage";

  @override
  State<ProductsListedByCategoryPage> createState() =>
      _ProductsListedByCategoryPageState();
}

class _ProductsListedByCategoryPageState
    extends State<ProductsListedByCategoryPage>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 12, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Category"),
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(35),
          child: SizedBox(
            height: 35,
            child: TabBar(
              isScrollable: true,
              tabAlignment: TabAlignment.start,
              controller: _tabController,
              labelStyle: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w700,
              ),
              indicatorWeight: .5,
              automaticIndicatorColorAdjustment: false,
              labelPadding: const EdgeInsets.only(bottom: 10),
              tabs: [
                for (int i = 0; i < 12; i++)
                  const Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                    ),
                    child: Text(
                      'Tag',
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
      body: Container(
        color: AppColor.grey6Color,
        child: TabBarView(
          controller: _tabController,
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
                        crossAxisCount: 2,
                        mainAxisSpacing: .5,
                        crossAxisSpacing: .5,
                      ),
                      itemBuilder: (_, index) => const ProductCardWidget(),
                      itemCount: 14,
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
