import 'package:agora/export.dart';

class AppLoadingWidget extends StatelessWidget {
  final bool isBrandingLogo;

  const AppLoadingWidget({
    super.key,
    this.isBrandingLogo = true,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        isBrandingLogo
            ? const SizedBox(
                width: 75,
                child: FittedBox(
                  child: SizedBox(
                    width: 75,
                    height: 75,
                    child: LoadingCircularView(
                    ), //CircularProgressIndicator(),
                  ),
                ),
              )
            : const SizedBox(
                width: 25,
                height: 25,
                child: CircularProgressIndicator(),
              ),
      ],
    );
  }
}
