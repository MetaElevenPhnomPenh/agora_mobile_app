/// attachment_response
import 'package:agora/export.dart';
import 'package:annotations/annotations.dart';
part 'upload_file_response.g.dart';

@JsonAnnotation()
class UploadFileResponse {
  UploadFileResponse({
    required this.id,
  });

  final String id;

  factory UploadFileResponse.fromJson(Map<String, dynamic> json) => _$UploadFileResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UploadFileResponseToJson(this);

}