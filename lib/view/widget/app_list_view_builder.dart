import 'package:agora/export.dart';

class AppListViewBuilder {
  final ScrollController? controller;
  final List<Widget> children;
  final Axis scrollDirection;
  final bool? shrinkWrap;
  final EdgeInsets? padding;
  final ScrollPhysics? physics;
  final Key? oneKey;

  const AppListViewBuilder({
    this.controller,
    required this.children,
    this.scrollDirection = Axis.vertical,
    this.shrinkWrap,
    this.physics,
    this.padding,
    this.oneKey,
  });

  Widget builder() {
    return ListView.builder(
      padding: padding ?? EdgeInsets.zero,
      cacheExtent: 100,
      key: oneKey,
      physics: physics ?? AppWidgetHelper.scrollPhysics,
      itemCount: children.length,
      controller: controller,
      scrollDirection: scrollDirection,
      addAutomaticKeepAlives: false,
      shrinkWrap: shrinkWrap ?? false,
      itemBuilder: (BuildContext context, int index) {
        return children[index];
      },
    );
  }

  Widget separated(IndexedWidgetBuilder separatorBuilder) {
    return ListView.separated(
      separatorBuilder: separatorBuilder,
      padding: padding ?? EdgeInsets.zero,
      cacheExtent: 100,
      key: oneKey,
      physics: physics ?? AppWidgetHelper.scrollPhysics,
      itemCount: children.length,
      controller: controller,
      scrollDirection: scrollDirection,
      addAutomaticKeepAlives: false,
      shrinkWrap: shrinkWrap ?? false,
      itemBuilder: (BuildContext context, int index) {
        return children[index];
      },
    );
  }
}
