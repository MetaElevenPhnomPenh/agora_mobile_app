// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upload_file_response.dart';

// **************************************************************************
// JsonGenerator
// **************************************************************************

// From Json Method
UploadFileResponse _$UploadFileResponseFromJson(Map<String, dynamic> json) =>
    UploadFileResponse(
      id: json['id'].toString().toAppString()!,
    );

// To Json Method
Map<String, dynamic> _$UploadFileResponseToJson(UploadFileResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
    };

// Extension for a UploadFileResponse class to provide 'copyWith' method
extension $UploadFileResponseExtension on UploadFileResponse {
  UploadFileResponse copyWith({
    String? id,
  }) {
    return UploadFileResponse(
      id: id ?? this.id,
    );
  }
}
