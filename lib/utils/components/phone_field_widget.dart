import 'package:agora/export.dart';
import 'package:intl_phone_field/countries.dart';

class PhoneFieldWidget extends StatelessWidget {
  final ValueChanged<Country>? onChanged;
  final Country? country;
  final TextEditingController? controller;

  const PhoneFieldWidget({
    super.key,
    this.onChanged,
    this.country,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        TextFieldWidget(
          controller: controller,
          hintText: T.phoneNumber.r,
          keyboardType: TextInputType.number,
          prefixIcon: const SizedBox(
            width: 55,
          ),
        ),
        Positioned(
          top: 13,
          child: AppGestureDetector(
            onTap: () => context.navigate.pushNamed(CountryPhonePage.route, country?.dialCode ?? app.DEFAULT_COUNTRY_CODE).then((e) {
              if (e is Country) {
                onChanged?.call(e);
              }
            }),
            child: Row(
              children: [
                Text(
                  country?.dialCode ?? app.DEFAULT_COUNTRY_CODE,
                  style: context.textTheme.headlineSmall,
                ),
                3.sw(),
                const Icon(
                  Icons.keyboard_arrow_down_outlined,
                  size: 15,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
