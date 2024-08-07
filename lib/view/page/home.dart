import 'package:agora/data/_.dart';
import 'package:agora/export.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentTappedIndex = 1;

  final List<Widget> _tabViews = const [
    SizedBox(),
    HomeScreenWidget(),
    SizedBox(),
    MePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
}
