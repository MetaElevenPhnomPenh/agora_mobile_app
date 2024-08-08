/// upload_files_cubit
import 'dart:io';

import 'package:agora/export.dart';
import 'package:flutter/foundation.dart';

typedef UploadFilesState = BaseBlocState<UploadFileResponse>;

class UploadFilesCubit extends BaseBlocCubit<UploadFileResponse> {
  final AttachmentRepository repository;

  UploadFilesCubit(this.repository);

  @override
  Future<BaseResponse<UploadFileResponse>> responseData([String? id, data, subData, bool isNetwork = true]) async {
    if (data is List<File>) {
      final response = await repository.uploadFiles(files: data);
      if (kDebugMode) {}
      return response;
    } else {
      throw const CustomException().toString();
    }
  }
}
