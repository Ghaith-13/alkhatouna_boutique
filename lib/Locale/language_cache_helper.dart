import 'package:shared_preferences/shared_preferences.dart';

class LanguageCacheHelper {
  Future<void> cachelanguageCode(String languageCode) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString("LOCALE", languageCode);
  }

  Future<String> getCachedLanguageCode() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final cachedLanguageCode = sharedPreferences.getString("LOCALE");
    if (cachedLanguageCode != null) {
      return cachedLanguageCode;
    } else {
      return "ar";
    }
  }
}
