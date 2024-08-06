import 'package:agora/export.dart';

class AppWidgetHelper {
  static ScrollPhysics get scrollPhysics => const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics());

  static void focusNew(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
  }
}
