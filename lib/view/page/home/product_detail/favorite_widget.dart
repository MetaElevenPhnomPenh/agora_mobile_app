import 'package:agora/export.dart';

class FavoriteWidget extends StatefulWidget {
  const FavoriteWidget({super.key});

  static const String route = "/FavoriteWidget";

  @override
  State<FavoriteWidget> createState() => _FavoriteWidgetState();
}

class _FavoriteWidgetState extends State<FavoriteWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.only(
            left: 12,
            right: 12,
            bottom: 4,
          ),
          color: AppColor.whiteColor,
          child: Row(
            children: [
              Expanded(
                child: Text(
                  "Text something herer..",
                  style: context.textTheme.bodySmall?.copyWith(
                    color: AppColor.darkGreyColor,
                    fontSize: 12,
                  ),
                ),
              ),
              Text(
                "text here",
                style: context.textTheme.bodySmall?.copyWith(
                  color: AppColor.darkGreyColor,
                  fontSize: 12,
                ),
              ),
              Icon(
                Icons.navigate_next,
                color: AppColor.lightGreyColor,
              ),
            ],
          ),
        ),
        const SizedBox(height: 1),
        Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          color: AppColor.whiteColor,
          child: const Text("Check the size chart"),
        ),
        const SizedBox(height: 12),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Row(
            children: [
              Image.network(
                "https://cdn-icons-png.freepik.com/512/5222/5222802.png",
                width: 25,
              ),
              const SizedBox(width: 8),
              Text(
                "Yellow color",
                style: context.textTheme.bodyMedium,
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        for (var i = 0; i < 4; ++i)
          Container(
            color: AppColor.whiteColor,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            margin: const EdgeInsets.symmetric(vertical: 2),
            child: Row(
              children: [
                _size(text: "S"),
                const Spacer(),
                _price(text: "150"),
                const SizedBox(width: 12),
                Icon(
                  Icons.favorite_border,
                  color: Colors.grey[700],
                  size: 20,
                ),
              ],
            ),
          ),
      ],
    );
  }

  Widget _size({required String text}) {
    return Text(
      text,
      style: context.textTheme.bodyMedium,
    );
  }

  Widget _price({required String text}) {
    return Text(
      '\$$text',
      style: context.textTheme.bodyMedium?.copyWith(
        fontWeight: FontWeight.w500,
        fontSize: 14,
      ),
    );
  }
}
