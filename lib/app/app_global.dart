import 'package:agora/export.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppGlobal {
  NavigationHelper get navigate => NavigationHelper();

  BuildContext get context => globalKey.currentState!.context;

  SnackBarHelper get snackBar => SnackBarHelper();

  String DEFAULT_COUNTRY_CODE = '+855';

  void focusNew(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  bool get isLogin => tokenStorage.get() != null;

  UserStorage get userStorage => UserStorage();

  TokenStorage get tokenStorage => TokenStorage();

  TokenHivebox? get token => tokenStorage.get();

  UserProfileHivebox? get user => userStorage.get();

  void restart() {
    context.navigate.pushNamedAndRemoveUntil(HomePage.route, predicate: 'home');
  }

  Future<void> logout() async {
    await userStorage.delete();
    await tokenStorage.delete();
    await app.context.read<ProfileCubit>().close();
  }

  final screenPaddingX = const EdgeInsets.symmetric(horizontal: 16);
  final screenPaddingY = const EdgeInsets.symmetric(vertical: 20);
  final screenPadding = const EdgeInsets.symmetric(vertical: 20, horizontal: 16);
}
