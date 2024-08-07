/// verify_otp_page
import 'package:agora/export.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VerifyOtpPage extends StatefulWidget {
  static const String route = '/VerifyOtpPage';

  const VerifyOtpPage({Key? key}) : super(key: key);

  @override
  State<VerifyOtpPage> createState() => _VerifyOtpPageState();
}

class _VerifyOtpPageState extends State<VerifyOtpPage> {
  late final VerifyOtpCubit cubit;
  late final TextEditingController otpCodeTextController = TextEditingController();

  late final String? key;

  @override
  void initState() {
    cubit = context.read<VerifyOtpCubit>();
    final arg = context.navigate.getArg<String>();
    if (arg is String) {
      key = arg;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackArrowWidget(),
        title: const Text('Verify Otp'),
      ),
      body: AppListViewBuilder(children: [
        TextFieldWidget(
          controller: otpCodeTextController,
          hintText: 'OTP Code',
        ),
        FilledButton(onPressed: () => verify(), child: const Text('Verify')),
      ]).separated((context, index) => 12.sh()),
    );
  }

  void verify() {
    if (otpCodeTextController.text.isNotEmpty && key != null) {
      cubit.request(data: VerifyOtpRequest(code: otpCodeTextController.text, key: key!));
    } else {
      app.snackBar.show('Validation Fail');
    }
  }
}
