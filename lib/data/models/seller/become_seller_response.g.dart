// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'become_seller_response.dart';

// **************************************************************************
// JsonGenerator
// **************************************************************************

// From Json Method
BecomeSellerResponse _$BecomeSellerResponseFromJson(Map<String, dynamic> json) => BecomeSellerResponse(
      status: json['status'].toString().toAppString()!,
      type: json['type'].toString().toAppString()!,
    );

// To Json Method
Map<String, dynamic> _$BecomeSellerResponseToJson(BecomeSellerResponse instance) => <String, dynamic>{
      'status': instance.status,
      'type': instance.type,
    };

// Extension for a BecomeSellerResponse class to provide 'copyWith' method
extension $BecomeSellerResponseExtension on BecomeSellerResponse {
  BecomeSellerResponse copyWith({
    String? status,
    String? type,
  }) {
    return BecomeSellerResponse(
      status: status ?? this.status,
      type: type ?? this.type,
    );
  }
}
