part of 'bootstrap.dart';

void _registerHiveModelAdapters() {
  Hive.registerAdapter(UserProfileHiveboxAdapter());
  Hive.registerAdapter(TokenHiveboxAdapter());
}
