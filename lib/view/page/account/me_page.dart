/// me_page
import 'package:agora/data/_.dart';
import 'package:agora/export.dart';

class MePage extends StatefulWidget {
  static const String route = '/MePage';

  const MePage({Key? key}) : super(key: key);

  @override
  State<MePage> createState() => _MePageState();
}

class _MePageState extends State<MePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        automaticallyImplyLeading: false,
        actions: [
          const AppGestureDetector(
            paddingAll: 8,
            child: Icon(Icons.headphones),
          ),
          const AppGestureDetector(
            paddingAll: 8,
            child: Icon(Icons.menu),
          ),
          8.sw(),
        ],
      ),
      body: AppListViewBuilder(
        children: [
          sectionAvatar(),
          sectionMenu(),
        ],
      ).separated((context, index) => 20.sh()),
    );
  }

  Widget iconWidget({required String title}) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(
            Icons.add_chart,
            size: 30,
          ),
          2.sh(),
          Center(
            child: Text(
              title,
              style: context.textTheme.labelMedium?.copyWith(
                fontSize: 11.7,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  Widget iconRowWidget({required String title}) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(
            Icons.add_chart,
            size: 30,
          ),
          8.sw(),
          Expanded(
            child: Text(
              title,
              style: context.textTheme.labelMedium,
            ),
          ),
          const Icon(
            Icons.arrow_forward_ios_outlined,
            size: 14,
            color: AppColor.greyLightI,
          ),
        ],
      ),
    );
  }

  Widget sectionAvatar() {
    return Container(
      padding: app.screenPaddingX,
      child: Row(
        children: [
          SizedBox(
            height: 60,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(1000),
              child: AspectRatio(
                aspectRatio: 1,
                child: Container(
                  color: AppColor.primaryColor,
                ),
              ),
            ),
          ),
          10.sw(),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Log in OR Register', style: context.textTheme.headlineSmall),
                Text('Log in to get more surprises', style: context.textTheme.bodySmall),
              ],
            ),
          ),
          const Icon(
            Icons.arrow_forward_ios_outlined,
            size: 14,
          ),
        ],
      ),
    );
  }

  Widget sectionMenu() {
    return Container(
      padding: app.screenPadding,
      decoration: BoxDecoration(
        color: AppColor.greyLightII.lighten(70),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Row(
                children: [
                  Text(
                    'Creation \n Center',
                    style: context.textTheme.headlineSmall?.copyWith(
                      fontSize: 13,
                    ),
                  ),
                  3.sw(),
                  const Icon(
                    Icons.arrow_forward_ios_outlined,
                    size: 14,
                  ),
                ],
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    iconWidget(
                      title: 'Data',
                    ),
                    iconWidget(
                      title: 'Task',
                    ),
                    iconWidget(
                      title: 'Activity',
                    ),
                    iconWidget(
                      title: 'Property',
                    ),
                  ],
                ),
              ),
            ].separator((index) => 12.sw()),
          ),
          Card(
            child: Container(
              margin: 13.p(),
              width: context.mediaQuery.size.width,
              child: Column(
                children: [
                  Row(
                    children: [
                      iconRowWidget(title: 'Favorite'),
                      iconRowWidget(title: 'Save'),
                    ].separator((index) => 12.sw()),
                  ),
                  Row(
                    children: [
                      iconRowWidget(title: 'Footprints'),
                      iconRowWidget(title: 'Subscription'),
                    ].separator((index) => 12.sw()),
                  ),
                ].separator((index) => 20.sh()),
              ),
            ),
          ),
          Card(
            child: Container(
              margin: 13.p(),
              width: context.mediaQuery.size.width,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Order', style: context.textTheme.headlineMedium),
                      Row(
                        children: [
                          Text('All', style: context.textTheme.labelMedium),
                          5.sw(),
                          const Icon(
                            Icons.arrow_forward_ios_outlined,
                            size: 10,
                          ),
                        ],
                      ),
                    ],
                  ),
                  13.sh(),
                  Row(
                    children: [
                      iconWidget(title: 'Padding'),
                      iconWidget(title: 'Delivered'),
                      iconWidget(title: 'Awaiting'),
                      iconWidget(title: 'Evaluated'),
                      iconWidget(title: 'Refund'),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ].separator((index) => 20.sh()),
      ),
    );
  }
}
