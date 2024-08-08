import 'package:agora/export.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:intl_phone_field/phone_number.dart';

class LoginPagePara {
  final bool isOtp;
  final bool isRegister;

  const LoginPagePara({
    this.isOtp = true,
    this.isRegister = false,
  });
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  static const route = '/LoginPage';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final RegisterCubit cubit;
  bool isOtp = true;
  bool isRegister = false;
  Country country = PhoneNumber.getCountry(app.DEFAULT_COUNTRY_CODE);
  TextEditingController phoneTextController = TextEditingController();

  String get getPhone => '+${country.dialCode}${phoneTextController.text}';

  @override
  void initState() {
    cubit = context.read<RegisterCubit>();
    WidgetsBinding.instance.addPostFrameCallback((_) => onLoadedWidget(context));
    super.initState();
  }

  void onLoadedWidget(BuildContext context) {
    final arg = context.navigate.getArg<LoginPagePara>();
    if (arg is LoginPagePara) {
      isOtp = arg.isOtp;
      isRegister = arg.isOtp;
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
      body: BlocListener<RegisterCubit, RegisterState>(
        listenWhen: (previous, current) => previous.stateStatus != current.stateStatus,
        listener: (context, state) {
          if (state.stateStatus == AppStateStatus.success) {
            context.navigate.pushNamed(VerifyOtpPage.route, VerifyOtpPara(key: state.data!.key, phone: getPhone));
          } else if (state.stateStatus == AppStateStatus.failure) {
            app.snackBar.show(state.message!);
          }
        },
        child: AppListViewBuilder(
          padding: app.screenPadding,
          children: [
            Text(isRegister ? T.registerWithMobilePhoneNumber.r : T.loginWithMobilePhoneNumber.r, style: context.textTheme.displayLarge),
            if (!isRegister)
              Text(
                T.unregisteredMobilePhoneNumbers.r,
                style: context.textTheme.bodySmall?.copyWith(
                  color: AppColor.greyLight,
                ),
              ),
            PhoneFieldWidget(
              country: country,
              controller: phoneTextController,
              onChanged: (v) => setState(() => country = v),
            ),
            if (isOtp) ...[
              SizedBox(
                width: context.mediaQuery.size.width,
                child: FilledButton(
                  onPressed: () => cubit.request(data: RegisterRequest(phoneNumber: getPhone), subData: isRegister),
                  child: Text(T.getVerificationCode.r),
                ),
              ),
              if (!isRegister)
                AppGestureDetector(
                  onTap: () => context.navigate.pushNamed(LoginPage.route, const LoginPagePara(isRegister: true)),
                  child: Center(child: Text(T.register.r, style: context.textTheme.bodyLarge)),
                ),
              /*AppGestureDetector(
                onTap: () => context.navigate.pushNamed(LoginPage.route, const LoginPagePara(isOtp: false)),
                child: Center(child: Text(T.passwordLogin.r, style: context.textTheme.bodyLarge)),
              ),*/
            ] else ...[
              TextFieldWidget(
                hintText: T.passwordLogin.r,
                obscureText: true,
              ),
              SizedBox(
                width: context.mediaQuery.size.width,
                child: FilledButton(
                  onPressed: () => cubit.request(data: RegisterRequest(phoneNumber: getPhone)),
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
                  TextSpan(
                    text: '《' + T.userAgreement.r + '》',
                    recognizer: TapGestureRecognizer()..onTap = () => context.navigate.pushNamed(UserAgreementPage.route),
                  ),
                  TextSpan(
                    text: '《' + T.privacyPolicy.r + '》',
                    recognizer: TapGestureRecognizer()..onTap = () => context.navigate.pushNamed(PrivacyPolicyPage.route),
                  ),
                  TextSpan(text: T.and.r),
                  TextSpan(
                    text: '《' + T.buyerNotice.r + '》。',
                    recognizer: TapGestureRecognizer()..onTap = () => context.navigate.pushNamed(BuyerNoticePage.route),
                  ),
                ],
              ),
              style: context.textTheme.labelMedium,
            ),
          ],
        ).separated((BuildContext context, int index) => 20.sh()),
      ),
    );
  }
}
