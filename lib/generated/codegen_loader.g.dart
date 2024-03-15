import 'dart:ui';
import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader {
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String, dynamic> en = {
    "Register": "Register",
    "registername": "Write your name",
    "registernumber": "Write your number",
    "registermap": "Choose your country",
    "registerstory": "Write your story",
    "registerpassword": "Write your password",
    "regispassword": "Repeat your password",
  };
  static const Map<String, dynamic> kk = {
    "Register": "Тіркелу",
    "registername": "Атыңызды жазыңыз",
    "registernumber": "Нөміріңізді жазыңыз",
    "registermap": "Мемлекетіңізді таңдаңыз",
    "registerstory": "Историяңызды жазыңыз",
    "registerpassword": "Парольді жазыңыз",
    "regispassword": "Парольді қайталаңыз",
  };
  static const Map<String, dynamic> ru = {
    "Register": "Регистрация",
    "registername": "Напишите свое имя",
    "registernumber": "Напишите свой номер",
    "registermap": "Выберите свою страну",
    "registerstory": "Напишите свою историю",
    "registerpassword": "Напишите пароль",
    "regispassword": "Повторите пароль",
  };
  static const Map<String, Map<String, dynamic>> mapLocales = {
    "en": en,
    "kk": kk,
    "ru": ru
  };
}
