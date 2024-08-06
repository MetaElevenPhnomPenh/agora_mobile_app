/// buyer_notice_page
import 'package:agora/export.dart';

class BuyerNoticePage extends StatefulWidget {
  static const String route = '/BuyerNoticePage';

  const BuyerNoticePage({Key? key}) : super(key: key);

  @override
  State<BuyerNoticePage> createState() => _BuyerNoticePageState();
}

class _BuyerNoticePageState extends State<BuyerNoticePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackArrowWidget(),
        title: Text(T.buyerNotice.r),
      ),
      body: AppListViewBuilder(
        padding: app.screenPadding,
        children: [
          const Text(
            'Welcome to the Agora platform! We’re thrilled to have you here and are committed to providing you with a seamless and secure experience for all your buying needs. This notice is designed to inform you about important aspects of using the Agora app to ensure a smooth and enjoyable shopping journey.',
          ),
        ],
      ).separated((context, index) => 20.sh()),
    );
  }
}
