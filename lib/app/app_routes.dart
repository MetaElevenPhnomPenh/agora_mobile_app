import 'package:agora/export.dart';

class AppRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case LoginPage.route:
        return _buildRoute(const LoginPage(), settings);
      case LoginPasswordPage.route:
        return _buildRoute(const LoginPasswordPage(), settings);
      case ProductDetailPage.route:
        return _buildRoute(const ProductDetailPage(), settings);
      case CountryPhonePage.route:
        return _buildRoute(const CountryPhonePage(), settings);
      case BuyerNoticePage.route:
        return _buildRoute(const BuyerNoticePage(), settings);
      case PrivacyPolicyPage.route:
        return _buildRoute(const PrivacyPolicyPage(), settings);
      case UserAgreementPage.route:
        return _buildRoute(const UserAgreementPage(), settings);
      case AppImagePreview.route:
        return _buildRoute(const AppImagePreview(), settings);
      default:
        return _buildRoute(
          Scaffold(
            body: Center(
              child: Text(
                'No route defined for ${settings.name}',
              ),
            ),
          ),
          settings,
        );
    }
  }

  static _buildRoute(Widget widget, RouteSettings settings) {
    return MaterialPageRoute(builder: (context) => widget, settings: settings);
  }
}
