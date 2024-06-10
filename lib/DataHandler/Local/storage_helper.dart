import 'package:get_storage/get_storage.dart';

class StorageHelper {

  /// TODO: here modify this class for better use

  GetStorage storage = GetStorage();

  StorageHelper._privateConstructor();

  static final StorageHelper _instance = StorageHelper._privateConstructor();

  static StorageHelper get instance => _instance;

  void setValue(String key, dynamic value) async {
    await storage.write(key, value);
  }

  String getStringValue(String key) {
    if (storage.read(key) != null) {
      return storage.read(key);
    } else {
      return "";
    }
  }

  int getIntValue(String key,{int? isDefault}) {
    if (storage.read(key) != null) {
      return storage.read(key);
    } else {
      return isDefault ?? 0 ;
    }
  }

  bool getBoolValue(String key) {
    if (storage.read(key) != null) {
      return storage.read(key);
    } else {
      return false;
    }
  }


  double getDoubleValue(String key) {
    if (storage.read(key) != null) {
      return storage.read(key);
    } else {
      return 0.0;
    }
  }


  dynamic getDynamicValue(String key) {
    if (storage.read(key) != null) {
      return storage.read(key);
    } else {
      return [] ;
    }
  }

  void clear() async{
    await storage.erase();
  }

}
