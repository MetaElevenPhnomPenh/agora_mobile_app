import 'package:agora/export.dart';

class ProductCardSmallWidget extends StatelessWidget {
  const ProductCardSmallWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        app.navigate.pushNamed(ProductDetailPage.route);
      },
      child: Container(
        color: AppColor.containerBackgroundBlack,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Image.network(
                  "https://m.media-amazon.com/images/I/71mhs8nkGeL._AC_UY1000_.jpg",
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              "金边男士连帽衫|Hoodie for man",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 12,
                color: Colors.grey[700],
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              "\$1200",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
