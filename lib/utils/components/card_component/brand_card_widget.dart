import 'package:agora/export.dart';

class BrandCardWidget extends StatelessWidget {
  const BrandCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.containerBackgroundBlack,
      padding: const EdgeInsets.all(6),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(8),
              child: Image.network(
                "https://target.scene7.com/is/image/Target/GUEST_4b405ae1-a4d6-4c57-b1f2-fb170b9c689c?wid=488&hei=488&fmt=pjpeg",
              ),
            ),
          ),
          const Text(
            "HOODIE's men",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 10,
            ),
          ),
        ],
      ),
    );
  }
}
