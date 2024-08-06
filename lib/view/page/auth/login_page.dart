import 'package:agora/export.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:intl_phone_field/phone_number.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  static const route = '/LoginPage';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final LoginCubit cubit;
  bool isOtp = true;
  Country country = PhoneNumber.getCountry(app.DEFAULT_COUNTRY_CODE);

  @override
  void initState() {
    cubit = context.read<LoginCubit>();
    WidgetsBinding.instance.addPostFrameCallback((_) => onLoadedWidget(context));
    super.initState();
  }

  void onLoadedWidget(BuildContext context) {
    final arg = context.navigate.getArg<bool>();
    if (arg is bool) {
      isOtp = arg;
    }
    setState(() {});
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
          Text(T.loginWithMobilePhoneNumber.r, style: context.textTheme.displayLarge),
          Text(
            T.unregisteredMobilePhoneNumbers.r,
            style: context.textTheme.bodySmall?.copyWith(
              color: AppColor.greyLight,
            ),
          ),
          PhoneFieldWidget(
            country: country,
            onChanged: (v) => setState(() {
              country = v;
            }),
          ),
          if (isOtp) ...[
            SizedBox(
              width: context.mediaQuery.size.width,
              child: FilledButton(
                onPressed: () => cubit.request(),
                child: Text(T.getVerificationCode.r),
              ),
            ),
            AppGestureDetector(
              onTap: () => context.navigate.pushNamed(LoginPage.route, false),
              child: Center(child: Text(T.passwordLogin.r, style: context.textTheme.bodyLarge)),
            ),
          ] else ...[
            TextFieldWidget(
              hintText: T.passwordLogin.r,
              obscureText: true,
            ),
            SizedBox(
              width: context.mediaQuery.size.width,
              child: FilledButton(
                onPressed: () => cubit.request(),
                child: Text(T.login.r),
              ),
            ),
            AppGestureDetector(
              onTap: () => context.navigate.pop(),
              child: Center(child: Text(T.otpLogin.r, style: context.textTheme.bodyLarge)),
            ),
          ],
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
