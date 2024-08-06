/// me_page
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
        padding: app.screenPadding,
        children: [
          Row(
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
              )
            ],
          ),
        ],
      ).separated((context, index) => 20.sh()),
    );
  }
}
