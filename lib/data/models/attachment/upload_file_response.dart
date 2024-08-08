/// attachment_response
import 'package:agora/export.dart';
import 'package:json_annotation/json_annotation.dart';
part 'upload_file_response.g.dart';

@JsonSerializable()
class UploadFileResponse {
  final String id;

  UploadFileResponse({
    required this.id,
  });

  factory UploadFileResponse.fromJson(Map<String, dynamic> json) => _$UploadFileResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UploadFileResponseToJson(this);

}