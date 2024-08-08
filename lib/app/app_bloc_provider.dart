import 'package:agora/export.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBlocsProvider extends StatelessWidget {
  final Widget child;

  const AppBlocsProvider({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<RegisterCubit>(
            create: (context) => RegisterCubit(Dependency.authRepository)),
        BlocProvider<VerifyOtpCubit>(
            create: (context) => VerifyOtpCubit(Dependency.authRepository)),
        BlocProvider<ProfileCubit>(
            create: (context) => ProfileCubit(Dependency.userRepository)),
        BlocProvider<OrderCounterCubit>(
            create: (context) => OrderCounterCubit()),

        //BlocProvider<ConfigCubit>(create: (context) => ConfigCubit(DependencyHelper.repository)),
      ],
      child: child,
    );
  }
}
