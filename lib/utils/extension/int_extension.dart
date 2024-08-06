import 'package:agora/export.dart';

extension IntExtension on int {
  EdgeInsets px() {
    return EdgeInsets.symmetric(horizontal: this.toDouble());
  }

  EdgeInsets py() {
    return EdgeInsets.symmetric(vertical: this.toDouble());
  }

  EdgeInsets p() {
    return EdgeInsets.all(this.toDouble());
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
}
