part of 'serializer.dart';

T? deserializeType<T>(dynamic json) {
  var types = [VerifyOtpResponse,RegisterResponse,UploadFileResponse,ProfileResponse,UserProfileHivebox,TokenHivebox];
  if (types.contains(T)) {
    if (T == VerifyOtpResponse) {
      return VerifyOtpResponse.fromJson(json) as T;
    } else if (T == RegisterResponse) {
      return RegisterResponse.fromJson(json) as T;
    } else if (T == UploadFileResponse) {
      return UploadFileResponse.fromJson(json) as T;
    } else if (T == ProfileResponse) {
      return ProfileResponse.fromJson(json) as T;
    } else if (T == UserProfileHivebox) {
      return UserProfileHivebox.fromJson(json) as T;
    } else if (T == TokenHivebox) {
      return TokenHivebox.fromJson(json) as T;
    }
  }
  return null;
}
      