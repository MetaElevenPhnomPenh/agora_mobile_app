import 'package:agora/export.dart';

extension DoubleExtension on double {
  EdgeInsets pt() {
    return EdgeInsets.only(top: this.toDouble());
  }

  EdgeInsets pb() {
    return EdgeInsets.only(bottom: this.toDouble());
  }

  EdgeInsets pl() {
    return EdgeInsets.only(left: this.toDouble());
  }

  EdgeInsets pr() {
    return EdgeInsets.only(right: this.toDouble());
  }

  EdgeInsets get px => EdgeInsets.symmetric(horizontal: this.toDouble());

  EdgeInsets py() {
    return EdgeInsets.symmetric(vertical: this.toDouble());
  }

  EdgeInsets p({double? l, double? r, double? t, double? b}) {
    return EdgeInsets.only(
      left: l ?? this.toDouble(),
      right: r ?? this.toDouble(),
      top: t ?? this.toDouble(),
      bottom: b ?? this.toDouble(),
    );
  }

  SizedBox sw() {
    return SizedBox(width: this.toDouble());
  }

  SizedBox sh() {
    return SizedBox(height: this.toDouble());
  }

  SizedBox s() {
    return SizedBox(height: this.toDouble(), width: this.toDouble());
  }

  BorderRadius r() {
    return BorderRadius.circular(this.toDouble());
  }

  BorderRadius rt({double? l, double? r}) {
    return BorderRadius.only(
      topLeft: Radius.circular(l ?? this.toDouble()),
      topRight: Radius.circular(r ?? this.toDouble()),
    );
  }

  BorderRadius rb({double? l, double? r}) {
    return BorderRadius.only(
      bottomLeft: Radius.circular(l ?? this.toDouble()),
      bottomRight: Radius.circular(r ?? this.toDouble()),
    );
  }
}
