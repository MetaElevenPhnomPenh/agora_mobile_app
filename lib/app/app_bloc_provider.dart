import 'package:agora/export.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBlocsProvider extends StatelessWidget {
  final Widget child;

  const AppBlocsProvider({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginCubit>(create: (context) => LoginCubit(Dependency.authRepository)),
        //BlocProvider<ConfigCubit>(create: (context) => ConfigCubit(DependencyHelper.repository)),
      ],
      child: child,
    );
  }
}
