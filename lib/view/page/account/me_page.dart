/// me_page
import 'package:agora/data/_.dart';
import 'package:agora/export.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MePage extends StatefulWidget {
  static const String route = '/MePage';
  final GestureTapCallback onDrawer;

  const MePage({Key? key, required this.onDrawer}) : super(key: key);

  @override
  State<MePage> createState() => _MePageState();
}

class _MePageState extends State<MePage> {
  late final ProfileCubit cubit;

  @override
  void initState() {
    cubit = context.read<ProfileCubit>();
    if (app.isLogin) {
      cubit.request();
      if (kDebugMode) {
        print(app.user);
      }
      if (kDebugMode) {}
    }
    super.initState();
  }

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
          AppGestureDetector(
            paddingAll: 8,
            onTap: () => widget.onDrawer.call(),
            child: const Icon(Icons.menu),
          ),
          8.sw(),
        ],
      ),
      body: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          final UserProfileHivebox? user = app.isLogin ? (state.data ?? app.user) : null;
          return AppListViewBuilder(
            children: [
              sectionAvatar(user),
              sectionMenu(),
            ],
          ).separated((context, index) => 20.sh());
        },
      ),
    );
  }

  Widget iconWidget({required String title, Widget? iconWidget}) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          iconWidget ??
              const Icon(
                Icons.add_chart,
                size: 28,
              ),
          2.sh(),
          Center(
            child: Text(
              title,
              style: context.textTheme.labelMedium?.copyWith(
                fontSize: 12.5,
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
          Expanded(
            child: Text(
              title,
              style: context.textTheme.labelLarge,
            ),
          ),
          Text(
            '0',
            style: context.textTheme.labelMedium?.copyWith(
              color: AppColor.greyLight,
            ),
          ),
          const Icon(
            Icons.arrow_forward_ios_outlined,
            size: 14,
            color: AppColor.greyLightI,
          ),
        ].separator((i) => 8.sw()),
      ),
    );
  }

  Widget textRowWidget({required String title, required String sub}) {
    return Expanded(
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: context.textTheme.headlineSmall?.copyWith(
                    fontSize: 14,
                  ),
                ),
                4.sh(),
                Text(sub, style: context.textTheme.labelMedium),
              ],
            ),
          ),
          5.sw(),
          const Icon(
            Icons.arrow_forward_ios_outlined,
            size: 14,
            color: AppColor.greyLight,
          ),
        ],
      ),
    );
  }

  Widget sectionAvatar([UserProfileHivebox? user]) {
    return AppGestureDetector(
      onTap: () => user == null ? context.navigate.pushNamed(LoginPage.route) : null,
      child: Container(
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
                  if (user == null) ...[
                    Text('Login OR Register', style: context.textTheme.headlineSmall),
                    Text('Login to get more surprises', style: context.textTheme.bodySmall),
                  ] else ...[
                    Text(user.username, style: context.textTheme.headlineSmall),
                    Text(user.phoneNumber ?? (user.email ?? ''), style: context.textTheme.bodySmall),
                  ],
                ],
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios_outlined,
              size: 14,
            ),
          ],
        ),
      ),
    );
  }

  Widget sectionMenu() {
    return Container(
      padding: app.screenPadding,
      decoration: BoxDecoration(
        color: AppColor.greyLightII.lighten(70),
        borderRadius: 10.rt(),
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
          Card(
            child: Container(
              margin: 13.p(),
              width: context.mediaQuery.size.width,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Wallet', style: context.textTheme.headlineMedium),
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
                      iconWidget(
                        title: 'Coupon',
                        iconWidget: Text('0', style: context.textTheme.displayMedium),
                      ),
                      iconWidget(
                        title: 'Balance',
                        iconWidget: Text('\$0', style: context.textTheme.displayMedium),
                      ),
                      iconWidget(
                        title: 'Feel free for save',
                        iconWidget: Container(
                          padding: 4.pb(),
                          child: Text(
                            'large coupon',
                            style: context.textTheme.labelMedium?.copyWith(
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                      iconWidget(
                        title: 'Allowance',
                        iconWidget: Text('\$0', style: context.textTheme.displayMedium),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Card(
            child: Container(
              margin: 13.p(),
              width: context.mediaQuery.size.width,
              child: Row(
                children: [
                  textRowWidget(title: 'Individual seller', sub: 'Earn living allowance'),
                  10.sw(),
                  textRowWidget(title: 'Settled in', sub: 'Invite'),
                ],
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
                    children: [
                      iconWidget(title: 'Star Forest'),
                      iconWidget(title: 'Receive Coupon'),
                      iconWidget(title: 'Lottery'),
                      iconWidget(title: 'Get a price'),
                    ],
                  ),
                  13.sh(),
                  Row(
                    children: [
                      iconWidget(title: 'High Price'),
                      iconWidget(title: 'Service'),
                      iconWidget(title: 'Shoe and clothing'),
                      iconWidget(title: 'Student Area'),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ].separator((index) => 13.sh()),
      ),
    );
  }
}
