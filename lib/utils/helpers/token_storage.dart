import 'package:agora/export.dart';

class TokenStorage extends StorageServiceInterface<TokenHivebox>{
  @override
  String get defaultBoxName => StorageBox.tokenBox.name;

}