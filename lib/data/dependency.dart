import 'package:agora/export.dart';

class Dependency {
  static AuthRepository get authRepository => AuthRepository();

  static UserRepository get userRepository => UserRepository();

  static AttachmentRepository get attachmentRepository => AttachmentRepository();
}
