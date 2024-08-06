import 'package:agora/export.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppImageSvg extends StatelessWidget {
  final String path;
  final BoxFit fit;
  final String? errorImageAsset;
  final double? width;
  final double? height;
  final Color? color;
  final bool isDefaultColor;

  const AppImageSvg({
    required this.path,
    this.fit = BoxFit.cover,
    this.errorImageAsset,
    this.width,
    this.height,
    this.color,
    this.isDefaultColor = false,
  });

  @override
  Widget build(BuildContext context) {
    return appExtension(path) == 'svg'
        ? SvgPicture.asset(
            path,
            fit: fit,
            width: width,
            height: height,
            colorFilter: isDefaultColor
                ? null
                : ColorFilter.mode(
                    color ?? appIconColor(context),
                    BlendMode.srcIn,
                  ),
          )
        : Image.asset(
            path,
            fit: fit,
            width: width,
            height: height,
            color: isDefaultColor ? null : (color ?? appIconColor(context)),
          );
  }
}
