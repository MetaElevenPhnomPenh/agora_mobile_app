import 'package:agora/export.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:intl_phone_field/phone_number.dart';

class LoginPasswordPage extends StatefulWidget {
  const LoginPasswordPage({super.key});

  static const route = '/LoginPasswordPage';

  @override
  State<LoginPasswordPage> createState() => _LoginPasswordPageState();
}

class _LoginPasswordPageState extends State<LoginPasswordPage> {
  late final LoginCubit cubit;
  Country country = PhoneNumber.getCountry(app.DEFAULT_COUNTRY_CODE);

  @override
  void initState() {
    cubit = context.read<LoginCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        leading: const BackArrowWidget(
          icon: Icons.close,
        ),
        actions: [
          AppGestureDetector(
            paddingAll: 16,
            child: Text(
              'Encounter problems',
              style: context.textTheme.labelLarge?.copyWith(
                color: AppColor.greyLight,
              ),
            ),
          ),
        ],
      ),
      body: AppListViewBuilder(
        padding: app.screenPadding,
        children: [
          Text(T.loginWithPassword.r, style: context.textTheme.displayLarge),
          TextFieldWidget(
            hintText: T.passwordLogin.r,
          ),
          SizedBox(
            width: context.mediaQuery.size.width,
            child: FilledButton(
              onPressed: () => cubit.request(),
              child: Text(T.login.r),
            ),
          ),
          Center(child: Text(T.otpLogin.r, style: context.textTheme.bodyLarge)),
          Text.rich(
            TextSpan(
              children: [
                const WidgetSpan(
                  child: Icon(
                    Icons.radio_button_off_outlined,
                    size: 13,
                    color: AppColor.greyLight,
                  ),
                ),
                TextSpan(text: ' ' + T.iHaveReadAndAgreedToThe.r, style: const TextStyle(color: AppColor.greyLight)),
                TextSpan(text: '《' + T.userAgreement.r + '》'),
                TextSpan(text: '《' + T.privacyPolicy.r + '》'),
                TextSpan(text: T.and.r),
                TextSpan(text: '《' + T.buyerNotice.r + '》。'),
              ],
            ),
            style: context.textTheme.labelMedium,
          ),
        ],
      ).separated((BuildContext context, int index) => 20.sh()),
    );
  }
}
