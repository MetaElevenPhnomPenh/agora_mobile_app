import 'package:agora/data/_.dart';
import 'package:agora/data/enums/_.dart';
import 'package:agora/export.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({super.key});

  static const String route = "/productDetailPage";

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage>
    with SingleTickerProviderStateMixin {
  int _pageViewIndex = 0;
  late PageController _pageController;
  late TabController _tabController;
  bool lastStatus = false;
  double height = 250;
  final ItemScrollController itemScrollController = ItemScrollController();
  final ItemPositionsListener itemPositionsListener =
      ItemPositionsListener.create();

  @override
  void initState() {
    _pageController = PageController(
      initialPage: _pageViewIndex,
    );
    _tabController = TabController(length: 4, vsync: this, initialIndex: 0);
    itemPositionsListener.itemPositions.addListener(() {
      int _index = findFirstVisibleChildIndex();
      // 3, 7, 11, 15
      switch (_index) {
        case (< 7):
          _tabController.animateTo(0);
        case (>= 7 && < 11):
          _tabController.animateTo(1);
        case (>= 11 && < 15):
          _tabController.animateTo(2);
        case (>= 15):
          _tabController.animateTo(3);
        default:
        //
      }
    });
    super.initState();
  }

  // Function to find the index of the first visible child in the list
  int findFirstVisibleChildIndex() {
    var positions = itemPositionsListener.itemPositions;
    if (positions.value.isNotEmpty) {
      return positions.value.first.index;
    }
    return -1; // If no items are currently visible
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _listWidget = <Widget>[
      /// Production media sliding
      Stack(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 350,
            child: PageView.builder(
              controller: _pageController,
              itemCount: 10,
              onPageChanged: (page) {
                setState(() {
                  _pageViewIndex = page;
                });
              },
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => app.navigate.pushNamed(AppImagePreview.route),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Center(
                      child: Image.network(
                        "https://static.vecteezy.com/system/resources/thumbnails/035/320/453/small_2x/ai-generated-blank-grey-hoodie-front-and-back-view-mockup-isolated-on-transparent-background-free-png.png",
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Positioned(
            right: 12,
            bottom: 12,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: const BoxDecoration(
                color: AppColor.whiteColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    12,
                  ),
                ),
              ),
              child: Text(
                "${_pageViewIndex + 1}/10",
                style: context.textTheme.labelSmall,
              ),
            ),
          )
        ],
      ),

      /// Display as row
      SizedBox(
        height: 50,
        width: MediaQuery.of(context).size.width,
        child: ListView.builder(
          itemCount: 10,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, ind) {
            return InkWell(
              onTap: () {
                setState(() {
                  _pageViewIndex = ind;
                });
                _pageController.animateToPage(
                  _pageViewIndex,
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.linear,
                );
              },
              child: Container(
                margin: const EdgeInsets.only(left: 12),
                padding: const EdgeInsets.all(2),
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: AppColor.whiteColor,
                  border: _pageViewIndex == ind
                      ? Border.all(
                          width: 1,
                          color: AppColor.primaryColor,
                        )
                      : null,
                ),
                child: Image.network(
                  "https://pngimg.com/d/hoodie_PNG4.png",
                ),
              ),
            );
          },
        ),
      ),
      const SizedBox(height: 8),

      /// Product summary (index = 3)
      Container(
        color: AppColor.whiteColor,
        margin: const EdgeInsets.symmetric(horizontal: 12),
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  "\$143",
                  style: context.textTheme.displaySmall,
                ),
                const SizedBox(width: 8),
                Text(
                  "New customer saved \$36",
                  style: context.textTheme.labelSmall,
                ),
                const Icon(Icons.navigate_next),
                const Spacer(),
                Text(
                  "21min ago",
                  style: context.textTheme.labelSmall,
                ),
              ],
            ),
            Text(
              "富士山樱花风景图印花冰丝宽松透气吸汗圆领 直筒短袖T恤水洗做旧条纹直筒阔腿牛仔裤休闲运",
              style: context.textTheme.labelSmall,
            ),
            Row(
              children: [
                RatingBar.builder(
                  itemSize: 10,
                  initialRating: 3,
                  minRating: 0.5,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  ignoreGestures: true,
                  itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    size: 10,
                  ),
                  onRatingUpdate: (rating) {
                    print(rating);
                  },
                ),
                Text(
                  "3.0",
                  style: context.textTheme.labelSmall,
                ),
                const Spacer(),
                Text(
                  "New customer saved \$36",
                  style: context.textTheme.labelSmall,
                ),
                const Icon(Icons.navigate_next),
              ],
            )
          ],
        ),
      ),
      const SizedBox(height: 8),
      Container(
        height: 40,
        margin: const EdgeInsets.symmetric(horizontal: 12),
        decoration: const BoxDecoration(
          color: AppColor.whiteColor,
        ),
        child: const Row(
          children: [
            Icon(Icons.flutter_dash),
            Text("富士山樱花风景图印花冰丝宽松透"),
            Spacer(),
            Icon(Icons.navigate_next),
          ],
        ),
      ),
      const SizedBox(height: 8),

      /// Recently purchased (index = 7)
      Container(
        color: AppColor.whiteColor,
        margin: const EdgeInsets.symmetric(horizontal: 12),
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  "Recent purchased(3)",
                  style: context.textTheme.displaySmall,
                ),
                const Spacer(),
                Text(
                  "See all",
                  style: context.textTheme.labelSmall,
                ),
                const Icon(
                  Icons.navigate_next,
                  size: 16,
                  color: AppColor.bgDarkColor,
                ),
              ],
            ),
            const SizedBox(height: 4),
            for (int i = 0; i < 3; i++)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 2),
                child: Row(
                  children: [
                    Text(
                      "Hongly",
                      style: context.textTheme.labelSmall,
                    ),
                    Expanded(
                      child: Center(
                        child: Text(
                          "富士山樱花风景图印花冰丝宽松透",
                          style: context.textTheme.labelSmall,
                        ),
                      ),
                    ),
                    Text(
                      "27, July",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: context.textTheme.labelSmall,
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
      const SizedBox(height: 8),

      /// Outfit selection
      Container(
        color: AppColor.whiteColor,
        margin: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  Text(
                    "Outfit selection(3)",
                    style: context.textTheme.displaySmall,
                  ),
                  const Spacer(),
                  Text(
                    "Go to post",
                    style: context.textTheme.labelSmall,
                  ),
                  const Icon(
                    Icons.add,
                    size: 16,
                    color: AppColor.bgDarkColor,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 4),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 1,
                mainAxisSpacing: 1,
                childAspectRatio: .8,
              ),
              itemBuilder: (_, index) => Image.network(
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR27TILN5re2nFelPedAHJUdDp68r7bPbXYBg&s",
                fit: BoxFit.cover,
              ),
              itemCount: 6,
            ),
          ],
        ),
      ),
      const SizedBox(height: 8),

      /// Branch name (index = 11)
      Container(
        color: AppColor.whiteColor,
        margin: const EdgeInsets.symmetric(horizontal: 12),
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Brand",
              style: context.textTheme.displaySmall,
            ),
            Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: const BoxDecoration(
                    color: Colors.greenAccent,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 4),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "MABEL&CO",
                      style: context.textTheme.bodySmall,
                    ),
                    Text(
                      "description",
                      style: context.textTheme.labelSmall?.copyWith(
                        color: AppColor.greyLight,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                const Icon(Icons.navigate_next),
              ],
            ),
          ],
        ),
      ),
      const SizedBox(height: 8),

      /// Recommendation
      Container(
        color: AppColor.whiteColor,
        margin: const EdgeInsets.symmetric(horizontal: 12),
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  "Related recommendation",
                  style: context.textTheme.displaySmall,
                ),
                const Spacer(),
                InkWell(
                  onTap: () => app.navigate
                      .pushNamed(ProductsListedByCategoryPage.route),
                  child: Row(
                    children: [
                      Text(
                        "View all",
                        style: context.textTheme.labelSmall,
                      ),
                      const Icon(
                        Icons.navigate_next,
                        size: 17,
                      ),
                    ],
                  ),
                )
              ],
            ),
            12.sh(),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                childAspectRatio: .9,
              ),
              itemBuilder: (_, index) => const ProductCardSmallWidget(),
              itemCount: 6,
            ),
          ],
        ),
      ),
      const SizedBox(height: 8),

      /// Display related images
      Container(
        color: AppColor.whiteColor,
        margin: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(12),
              child: Text(
                "Commodity display",
                style: context.textTheme.displaySmall,
              ),
            ),
            const SizedBox(height: 4),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (_, index) => InkWell(
                onTap: () => app.navigate.pushNamed(AppImagePreview.route),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: Image.network(
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR27TILN5re2nFelPedAHJUdDp68r7bPbXYBg&s",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              itemCount: 3,
            ),
          ],
        ),
      ),
      const SizedBox(height: 8),

      /// Related or similar products (index = 15)
      Center(
        child: Text(
          "Products",
          style: context.textTheme.displaySmall,
        ),
      ),
      12.sh(),
      GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: .5,
          crossAxisSpacing: .5,
        ),
        itemBuilder: (_, index) => const ProductCardWidget(),
        itemCount: 14,
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        elevation: lastStatus ? 1 : 0,
        backgroundColor: AppColor.whiteColor.withOpacity(
          lastStatus ? 1 : 0,
        ),
        title: _appBarRow(),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            InkWell(
              onTap: () {
                _tabController.animateTo(0);
                itemScrollController.jumpTo(index: 3);
              },
              child: const Tab(
                text: "Overview",
              ),
            ),
            InkWell(
              onTap: () {
                _tabController.animateTo(1);
                itemScrollController.jumpTo(index: 7);
              },
              child: const Tab(
                text: "Commend",
              ),
            ),
            InkWell(
              onTap: () {
                _tabController.animateTo(2);
                itemScrollController.jumpTo(index: 11);
              },
              child: const Tab(
                text: "Brand",
              ),
            ),
            InkWell(
              onTap: () {
                _tabController.animateTo(3);
                itemScrollController.jumpTo(index: 15);
              },
              child: const Tab(
                text: "Related",
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: AppColor.grey6Color,
              child: ScrollablePositionedList.builder(
                shrinkWrap: true,
                addRepaintBoundaries: false,
                itemScrollController: itemScrollController,
                itemPositionsListener: itemPositionsListener,
                // scrollOffsetListener: _scrollOffsetListener,
                itemCount: _listWidget.length,
                itemBuilder: (context, index) {
                  return _listWidget[index];
                },
              ),
            ),
          ),
          Container(
            color: AppColor.whiteColor,
            padding: const EdgeInsets.only(left: 12, right: 12, top: 8),
            child: SafeArea(
              top: false,
              child: Row(
                children: [
                  _item(
                    const Icon(
                      Icons.favorite_border,
                      size: 20,
                    ),
                    "I want",
                    onTap: () {
                      showModalBottomSheet<void>(
                        context: context,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(16),
                          ),
                        ),
                        isScrollControlled: true,
                        builder: (BuildContext context) {
                          return const BottomSheetTemplateWidget(
                            title: "Title here",
                            leadingTitle: Icon(Icons.flutter_dash),
                            child: FavoriteWidget(),
                          );
                        },
                      );
                    },
                  ),
                  const SizedBox(width: 6),
                  _item(
                    const Icon(
                      Icons.check_circle_outline_rounded,
                      size: 20,
                    ),
                    "I have",
                    onTap: () {
                      showModalBottomSheet<void>(
                        context: context,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(16),
                          ),
                        ),
                        isScrollControlled: true,
                        builder: (BuildContext context) {
                          return const BottomSheetTemplateWidget(
                            title: "Title here",
                            child: IHaveWidget(),
                          );
                        },
                      );
                    },
                  ),
                  const SizedBox(width: 6),
                  _item(
                    const Icon(
                      Icons.headset_mic_outlined,
                      size: 20,
                    ),
                    "Help",
                    onTap: () {},
                  ),
                  const SizedBox(width: 12),
                  SizedBox(
                    height: 35,
                    child: OutlinedButton(
                      onPressed: () =>
                          app.navigate.pushNamed(WantToBuyPage.route),
                      child: Text(
                        "Want to buy",
                        style: _textStyleBtn,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: SizedBox(
                      height: 35,
                      child: FilledButton(
                        onPressed: () {
                          context.read<OrderCounterCubit>().reset();
                          showModalBottomSheet<void>(
                            context: context,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(16),
                              ),
                            ),
                            isScrollControlled: true,
                            builder: (BuildContext context) {
                              return const BottomSheetTemplateWidget(
                                titleWidget: BuyNowHeaderWidget(),
                                child: BuyNowBodyWidget(),
                              );
                            },
                          );
                        },
                        child: Text(
                          "Buy it now",
                          style: _textStyleBtn,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _item(Icon icon, String text, {required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        constraints: const BoxConstraints(
          minWidth: 30,
        ),
        height: 35,
        child: Column(
          children: [
            icon,
            Text(
              text,
              style: _textStyle,
            ),
          ],
        ),
      ),
    );
  }

  final TextStyle _textStyle = const TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 10,
    color: Colors.grey,
  );

  final TextStyle _textStyleBtn = const TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 12,
  );

  Row _appBarRow() {
    return Row(
      children: [
        const Spacer(),
        GestureDetector(
          onTap: () {
            showModalBottomSheet<void>(
              context: context,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(16),
                ),
              ),
              isScrollControlled: true,
              builder: (BuildContext context) {
                return const BottomSheetTemplateWidget(
                  title: "Title here",
                  child: SizedBox(),
                );
              },
            );
          },
          child: Container(
            width: 35,
            height: 35,
            decoration: const BoxDecoration(
              color: AppColor.lightGreyColor,
              shape: BoxShape.circle,
            ),
            child: const Center(
              child: Icon(Icons.compare_arrows),
            ),
          ),
        ),
        const SizedBox(width: 6),
        GestureDetector(
          onTap: () {
            showModalBottomSheet<void>(
              context: context,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(16),
                ),
              ),
              isScrollControlled: true,
              builder: (BuildContext context) {
                return const BottomSheetTemplateWidget(
                  title: "Title here",
                  child: SizedBox(),
                );
              },
            );
          },
          child: Container(
            width: 35,
            height: 35,
            decoration: const BoxDecoration(
              color: AppColor.lightGreyColor,
              shape: BoxShape.circle,
            ),
            child: const Center(
              child: Icon(
                Icons.wechat,
                color: Colors.green,
              ),
            ),
          ),
        ),
        const SizedBox(width: 6),
        GestureDetector(
          onTap: () {
            showModalBottomSheet<void>(
              context: context,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(16),
                ),
              ),
              isScrollControlled: true,
              builder: (BuildContext context) {
                return const BottomSheetTemplateWidget(
                  title: "Title here",
                  child: SizedBox(),
                );
              },
            );
          },
          child: Container(
            width: 35,
            height: 35,
            decoration: const BoxDecoration(
              color: AppColor.lightGreyColor,
              shape: BoxShape.circle,
            ),
            child: const Center(
              child: Icon(Icons.more_horiz),
            ),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
