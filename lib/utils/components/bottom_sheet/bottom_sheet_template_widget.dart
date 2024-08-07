import 'package:agora/export.dart';

class BottomSheetTemplateWidget extends StatelessWidget {
  final double? height;
  final String? title;
  final Widget? leadingTitle;
  final Widget child;

  const BottomSheetTemplateWidget({
    super.key,
    this.height,
    this.title,
    this.leadingTitle,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? MediaQuery.of(context).size.height * .7,
      child: Column(
        children: [
          SizedBox(
            height: 50,
            child: Row(
              children: [
                if (leadingTitle != null) const SizedBox(width: 8),
                leadingTitle ?? const SizedBox(),
                const SizedBox(width: 8),
                Text(
                  title ?? '',
                  style: context.textTheme.displaySmall,
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {
                    app.navigate.pop();
                  },
                  icon: const Icon(
                    Icons.close,
                    color: AppColor.greyLight,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width,
              color: AppColor.grey6Color,
              child: child,
            ),
          ),
        ],
      ),
    );
  }
}
