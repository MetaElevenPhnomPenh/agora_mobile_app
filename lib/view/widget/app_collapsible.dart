import 'package:collapsible/collapsible.dart';
import 'package:flutter/material.dart';

class AppCollapsible extends StatefulWidget {
  final Widget child;
  final bool collapsed;
  final CollapsibleAxis axis;

  const AppCollapsible({
    Key? key,
    required this.child,
    this.collapsed = false,
    this.axis = CollapsibleAxis.vertical,
  }) : super(key: key);

  @override
  State<AppCollapsible> createState() => _AppCollapsibleState();
}

class _AppCollapsibleState extends State<AppCollapsible> {
  final int duration = 150;

  @override
  Widget build(BuildContext context) {
    return Collapsible(
      collapsed: widget.collapsed,
      axis: widget.axis,
      duration: Duration(milliseconds: duration),
      maintainAnimation: true,
      curve: Curves.easeIn,
      fade: true,
      child: widget.child,
    );
  }
}
