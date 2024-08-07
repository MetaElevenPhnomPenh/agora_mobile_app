part of 'serializer.dart';

T? deserializeType<T>(dynamic json) {
  var types = [VerifyOtpResponse,RegisterResponse];
  if (types.contains(T)) {
    if (T == VerifyOtpResponse) {
      return VerifyOtpResponse.fromJson(json) as T;
    } else if (T == RegisterResponse) {
      return RegisterResponse.fromJson(json) as T;
    }
  }
  return null;
}
      