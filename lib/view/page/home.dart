import 'package:agora/data/_.dart';
import 'package:agora/export.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static const String route = '/HomePage';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  int _currentTappedIndex = 1;

  final List<Widget> _tabViews = [
    const SizedBox(),
    const HomeScreenWidget(),
    const SizedBox(),
    MePage(
      onDrawer: () => scaffoldKey.currentState?.openEndDrawer(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      endDrawer: drawerWidget(),
      body: _tabViews[_currentTappedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentTappedIndex,
        onTap: (page) {
          if (mounted) {
            setState(() {
              _currentTappedIndex = page;
            });
          }
        },
        items: [
          BottomNavigationBarItem(
            label: T.home.r,
            icon: const Icon(
              Icons.home,
            ),
          ),
          BottomNavigationBarItem(
            label: T.buy.r,
            icon: const Icon(
              Icons.email,
            ),
          ),
          BottomNavigationBarItem(
            label: T.explore.r,
            icon: const Icon(
              Icons.star,
            ),
          ),
          BottomNavigationBarItem(
            label: T.me.r,
            icon: const Icon(
              Icons.person,
            ),
          ),
        ],
      ),
    );
  }

  Widget drawerWidget() {
    return Drawer(
      child: SafeArea(
        child: Container(
          margin: app.screenPadding,
          child: Column(
            children: [
              Expanded(
                child: Column(
                  children: [
                    menuWidget(title: 'Privacy Setting'),
                    menuWidget(title: 'General Setting'),
                    const Divider(height: 0.5),
                    menuWidget(title: 'About'),
                    const Divider(height: 0.5),
                    menuWidget(title: 'Protection'),
                    menuWidget(title: 'App Permissions'),
                    menuWidget(title: 'Privacy Policy'),
                  ].separator((i) => 24.sh()),
                ),
              ),
              SizedBox(
                width: context.mediaQuery.size.width,
                child: OutlinedButton(onPressed: () => context.navigate.pushNamed(LoginPage.route), child: Text(T.login.r)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget menuWidget({required String title}) {
    return Row(
      children: [
        Expanded(
          child: Text(title, style: context.textTheme.bodyMedium),
        ),
        const Icon(
          Icons.arrow_forward_ios_outlined,
          size: 14,
          color: AppColor.greyLightI,
        ),
      ],
    );
  }
}
