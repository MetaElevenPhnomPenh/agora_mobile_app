import 'package:agora/export.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class App extends StatelessWidget {
  const App({super.key});

  static final RouteObserver<Route<dynamic>> routeObserver = RouteObserver<Route<dynamic>>();

  @override
  Widget build(BuildContext context) {
    return AppBlocsProvider(
      child: Builder(builder: (context) {
        app.initData(context);
        return BlocBuilder<ProfileCubit, ProfileState>(
          builder: (context, state) {
            return MaterialApp(
              localizationsDelegates: const [
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              theme: customLightTheme,
              darkTheme: customDarkTheme,
              navigatorKey: globalKey,
              onGenerateRoute: AppRoutes.generateRoute,
              home: const HomePage(),
            );
          },
        );
      }),
    );
  }
}
