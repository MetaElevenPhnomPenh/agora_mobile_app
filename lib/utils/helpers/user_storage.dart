import 'package:agora/export.dart';

class UserStorage extends StorageServiceInterface<UserProfileHivebox>{
  @override
  String get defaultBoxName => StorageBox.userBox.name;

}