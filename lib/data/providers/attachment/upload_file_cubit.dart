/// upload_file_cubit
import 'dart:io';

import 'package:agora/export.dart';
import 'package:flutter/foundation.dart';

typedef UploadFileState = BaseBlocState<UploadFileResponse>;

class UploadFileCubit extends BaseBlocCubit<UploadFileResponse> {
  final AttachmentRepository repository;

  UploadFileCubit(this.repository);

  @override
  Future<BaseResponse<UploadFileResponse>> responseData([String? id, data, subData, bool isNetwork = true]) async {
    if (data is File) {
      final response = await repository.uploadFile(file: data);
      if (kDebugMode) {}
      return response;
    } else {
      throw const CustomException().toString();
    }
  }
}
