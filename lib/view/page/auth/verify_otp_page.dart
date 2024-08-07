/// verify_otp_page
import 'package:agora/export.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinput/pinput.dart';
import 'package:timer_count_down/timer_count_down.dart';

class VerifyOtpPara {
  final String phone;
  final String key;

  const VerifyOtpPara({
    required this.phone,
    required this.key,
  });
}

class VerifyOtpPage extends StatefulWidget {
  static const String route = '/VerifyOtpPage';

  const VerifyOtpPage({Key? key}) : super(key: key);

  @override
  State<VerifyOtpPage> createState() => _VerifyOtpPageState();
}

class _VerifyOtpPageState extends State<VerifyOtpPage> {
  late final VerifyOtpCubit cubit;
  late final TextEditingController otpCodeTextController = TextEditingController();

  VerifyOtpPara? para;

  int _durationCountDown = 120; // 120 seconds.
  bool showResendButton = false;

  @override
  void initState() {
    cubit = context.read<VerifyOtpCubit>();
    WidgetsBinding.instance.addPostFrameCallback((_) => onLoadedWidget(context));
    super.initState();
  }

  void onLoadedWidget(BuildContext context) {
    final arg = context.navigate.getArg<VerifyOtpPara>();
    if (arg is VerifyOtpPara) {
      para = arg;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 60,
      height: 56,
      textStyle: const TextStyle(
        fontSize: 22,
        color: AppColor.primaryColor,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: AppColor.primaryColor, width: 0.9),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        leading: const BackArrowWidget(),
        title: const Text('Verify Otp'),
      ),
      body: BlocConsumer<VerifyOtpCubit, VerifyOtpState>(
        listenWhen: (previous, current) => previous.stateStatus != current.stateStatus,
        listener: (context, state) {
          if (state.stateStatus == AppStateStatus.success) {
            context.navigate.pushNamedAndRemoveUntil(HomePage.route);
          } else if (state.stateStatus == AppStateStatus.failure) {
            app.snackBar.show(state.message!);
          }
        },
        builder: (context, state) {
          return AppListViewBuilder(
            padding: app.screenPadding,
            children: [
              Text(
                T.verification.r,
                style: context.textTheme.displayMedium,
              ),
              Text(
                T.enter4DigitNumberThatWasSentTo.r + ":",
                style: context.textTheme.labelLarge,
              ),
              Text(
                para?.phone ?? '',
                style: context.textTheme.headlineMedium,
              ),
              Container(
                padding: 12.py(),
                child: Pinput(
                  onTapOutside: (v) => app.focusNew(context),
                  cursor: Container(
                    height: 40,
                    color: generateColor(context),
                    width: 1,
                  ),
                  controller: otpCodeTextController,
                  defaultPinTheme: defaultPinTheme,
                  separatorBuilder: (index) => const SizedBox(width: 8),
                  onCompleted: (code) {
                    otpCodeTextController.text = code;
                    verify();
                  },
                  focusedPinTheme: defaultPinTheme.copyWith(
                    decoration: defaultPinTheme.decoration!.copyWith(
                      border: Border.all(color: AppColor.primaryColor, width: 2),
                    ),
                  ),
                ),
              ),
              if (showResendButton) ...[
                AppGestureDetector(
                  //onTap: (){},
                  child: Center(
                    child: Text(
                      'Resent',
                      style: context.textTheme.bodySmall,
                    ),
                  ),
                ),
              ] else ...[
                Center(
                  child: Countdown(
                    seconds: _durationCountDown,
                    build: (BuildContext context, double time) => Text(
                      "${time.toInt().toString()} " + T.seconds.r,
                      style: const TextStyle(
                        color: AppColor.primaryButtonColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                    ),
                    interval: const Duration(seconds: 1),
                    onFinished: () => setState(() => showResendButton = true),
                  ),
                ),
              ],
              FilledButton(onPressed: () => verify(), child: const Text('Verify')),
            ],
          ).separated((context, index) => 12.sh());
        },
      ),
    );
  }

  Color generateColor(BuildContext context) => AppColor.primaryButtonColor;

  void verify() {
    if (otpCodeTextController.text.isNotEmpty && para != null) {
      cubit.request(data: VerifyOtpRequest(code: otpCodeTextController.text, key: para!.key));
    } else {
      app.snackBar.show('Validation Fail');
    }
  }
}
