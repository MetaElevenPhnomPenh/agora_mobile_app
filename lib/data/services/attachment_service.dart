/// attachment_service
import 'dart:io';

import 'package:agora/export.dart';

////////////////// Interface

abstract class AttachmentInterface {
  Future<BaseResponse<UploadFileResponse>> uploadFile({required File file});

  Future<BaseResponse<UploadFileResponse>> uploadFiles({required List<File> files});
}

////////////////// Repository

class AttachmentRepository implements AttachmentInterface {
  final AttachmentService _service = AttachmentService();

  @override
  Future<BaseResponse<UploadFileResponse>> uploadFile({required File file}) {
    return _service.uploadFile(file: file);
  }

  @override
  Future<BaseResponse<UploadFileResponse>> uploadFiles({required List<File> files}) {
    return _service.uploadFiles(files: files);
  }
}

////////////////// Service

class AttachmentService implements AttachmentInterface {
  @override
  Future<BaseResponse<UploadFileResponse>> uploadFile({required File file}) {
    return DioClient.postMethod<UploadFileResponse>(
      path: '/api/attachment/upload-file',
      file: {'file': file},
    );
  }

  @override
  Future<BaseResponse<UploadFileResponse>> uploadFiles({required List<File> files}) {
    return DioClient.postMethod<UploadFileResponse>(
      path: '/api/attachment/upload-files',
      files: {'files': files},
    );
  }
}
