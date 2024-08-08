/// attachment_response
import 'package:agora/export.dart';

class UploadFileResponse {

  final String id;

  UploadFileResponse({
    required this.id,
  });

//coverFileName: json['cover_file_name'].toString().toAppString()!,
// fromJson
  factory UploadFileResponse.fromJson(Map<String, dynamic> json) {
    return UploadFileResponse(
      id: json['_id'].toString().toAppString()!,
    );
  }
// toJson
}