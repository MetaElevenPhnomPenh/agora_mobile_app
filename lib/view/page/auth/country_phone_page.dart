import 'package:agora/export.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:intl_phone_field/phone_number.dart';

class CountryPhonePage extends StatefulWidget {
  const CountryPhonePage({super.key});

  static const route = '/CountryPhonePage';

  @override
  State<CountryPhonePage> createState() => _CountryPhonePageState();
}

class _CountryPhonePageState extends State<CountryPhonePage> {
  String? arg;
  final filteredCountries = ValueNotifier<List<Country>>(List.of(countries));
  Country? selectedCountry;
  List<Country> topCountry = [
    PhoneNumber.getCountry('+86'),
    PhoneNumber.getCountry('+855'),
    PhoneNumber.getCountry('+84'),
  ];

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) => onLoadedWidget(context));
    super.initState();
  }

  void onLoadedWidget(BuildContext context) {
    arg = context.navigate.getArg<String>();
    autoSelect();
    sortCountry();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bgGreyLight,
      appBar: AppBar(
        leading: const BackArrowWidget(
          icon: Icons.close,
        ),
        title: const Text('Select Country or Region'),
      ),
      body: ValueListenableBuilder(
          valueListenable: filteredCountries,
          builder: (context, fileterdCountryList, _) {
            return AppListViewBuilder(
              padding: app.screenPaddingY,
              children: List.from(
                fileterdCountryList.map(
                  (e) {
                    bool isSelected = e == selectedCountry;
                    return AppGestureDetector(
                      onTap: () => app.navigate.pop(arg: e),
                      child: Container(
                        color: AppColor.whiteColor,
                        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text.rich(
                                TextSpan(children: [
                                  TextSpan(
                                    text: e.name,
                                    style: isSelected
                                        ? const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: AppColor.blackColor,
                                          )
                                        : null,
                                  ),
                                  if (isSelected)
                                    const TextSpan(
                                      text: ' (Currently selected)',
                                    ),
                                ]),
                                style: context.textTheme.labelLarge?.copyWith(
                                  color: AppColor.greyDark,
                                ),
                              ),
                            ),
                            Text(
                              '+ ' + e.dialCode,
                              style: context.textTheme.labelLarge?.copyWith(
                                color: isSelected ? null : AppColor.greyDark,
                                fontWeight: isSelected ? FontWeight.bold : null,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ).separated((BuildContext context, int index) => const Divider(height: 1));
          }),
    );
  }

  void autoSelect() {
    selectedCountry = PhoneNumber.getCountry(arg ?? app.DEFAULT_COUNTRY_CODE);
  }

  void sortCountry() {
    var country = filteredCountries.value;
    topCountry.map((e) => country.remove(e));
    country.remove(selectedCountry);
    topCountry.remove(selectedCountry);
    country = [...topCountry, ...country];
    if (selectedCountry != null) {
      country = [selectedCountry!, ...country];
    }
    filteredCountries.value = country;
  }
}
