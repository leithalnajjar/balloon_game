import 'package:get_storage/get_storage.dart';

class SharedPrefsClient {
  static const String _storageName = "MyPref";

  static final GetStorage _storage = GetStorage(_storageName);

  init() async {
    await GetStorage.init(_storageName);
  }

  void clearData() {

  }

  String get language => _storage.read(keyLanguage) ?? "ar";

  set language(String value) {
    _storage.write(keyLanguage, value);
  }
}

const String keyLanguage = "key_language";
