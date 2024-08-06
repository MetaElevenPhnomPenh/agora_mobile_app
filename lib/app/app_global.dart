import 'package:agora/export.dart';

class AppGlobal {

  NavigationHelper get navigate => NavigationHelper();

  BuildContext get context => globalKey.currentState!.context;

  SnackBarHelper get snackBar => SnackBarHelper();

  String DEFAULT_COUNTRY_CODE = '+855';

  void focusNew(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  final screenPaddingX = const EdgeInsets.symmetric(horizontal: 16);
  final screenPaddingY = const EdgeInsets.symmetric(vertical: 20);
  final screenPadding = const EdgeInsets.symmetric(vertical: 20, horizontal: 16);

}