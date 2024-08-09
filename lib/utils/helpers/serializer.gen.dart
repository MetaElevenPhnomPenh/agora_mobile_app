part of 'serializer.dart';

T? deserializeType<T>(dynamic json) {
  var types = [BecomeSellerResponse,VerifyOtpResponse,RegisterResponse,UploadFileResponse,ProfileResponse,UserProfileHivebox,TokenHivebox,CreateStoreResponse];
  if (types.contains(T)) {
    if (T == BecomeSellerResponse) {
      return BecomeSellerResponse.fromJson(json) as T;
    } else if (T == VerifyOtpResponse) {
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
    } else if (T == CreateStoreResponse) {
      return CreateStoreResponse.fromJson(json) as T;
    }
  }
  return null;
}
      