import 'package:dart_translate/dart_translate.dart';

Future<void> main() async {
  final translate = GoogleTranslate();
  try {
    var text = await translate.translate("สวัสดี", "th", "en");
    print("translate text: $text\n");

    var auto = await translate.translate("ลาก่อน", "auto", "en");
    print("translate text: $auto\n");
  } catch (e) {
    print('$e');
  } finally {
    translate.close();
  }
}
