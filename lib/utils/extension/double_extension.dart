import 'package:agora/export.dart';

extension DoubleExtension on double {
  EdgeInsets px() {
    return EdgeInsets.symmetric(horizontal: this);
  }

  EdgeInsets py() {
    return EdgeInsets.symmetric(vertical: this);
  }

  EdgeInsets p() {
    return EdgeInsets.all(this);
  }

  SizedBox sw() {
    return SizedBox(width: this);
  }

  SizedBox sh() {
    return SizedBox(height: this);
  }

  SizedBox s() {
    return SizedBox(height: this, width: this);
  }
}
