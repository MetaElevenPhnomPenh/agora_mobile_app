import 'package:flutter/foundation.dart';
import 'package:agora/export.dart';

class StorageService {
  static const defaultBoxName = StorageBox.generalBox;

  static ValueListenable<Box> getListenable(String? key, {StorageBox boxName = defaultBoxName}) {
    if (key == null) {
      return Hive.box(boxName.toString()).listenable();
    }
    return Hive.box(boxName.toString()).listenable(keys: [key]);
  }

  const StorageService._();

  static Future add<T>({
    required T data,
    required StorageBox boxName,
  }) async {
    final box = Hive.box(boxName.toString());
    await box.add(data);
  }

  static List<T> list<T>({
    required StorageBox boxName,
  }) {
    final box = Hive.box(boxName.toString());
    return List<T>.from(box.values);
  }

  static remove<T>({
    required T data,
    required StorageBox boxName,
  }) async {
    final box = Hive.box(boxName.toString());
    return box.deleteAt(
      list<T>(boxName: boxName).indexOf(data),
    );
  }

  static Future put<T>({required String key, required T data, StorageBox boxName = defaultBoxName}) async {
    final box = Hive.box(boxName.toString());
    await box.put(key, data);
  }

  static dynamic get({required String key, StorageBox boxName = defaultBoxName, dynamic defaultValue}) {
    final box = Hive.box(boxName.toString());
    return box.get(
      key,
      defaultValue: defaultValue,
    );
  }

  static Future delete({required String key, StorageBox boxName = defaultBoxName, dynamic defaultValue}) async {
    final box = Hive.box(boxName.toString());
    await box.delete(key);
  }
}
