import 'package:http/http.dart' as http;
import 'package:http/retry.dart';

class GoogleTranslate {
  final _client = RetryClient(http.Client());

  Future<String> translate(text, fromLanguage, toLanguage) async {
    final queryParameters = {
      'sl': fromLanguage,
      'tl': toLanguage,
      'q': text,
    };
    final url = Uri.https(
      "translate.google.com",
      "/m",
      queryParameters,
    );
    final response = await _client.get(url);
    return _parseTranslate(response.body);
  }

  String _parseTranslate(String contents) {
    const DIV_RESULT = '<div class="result-container">';
    //print("$contents : ${contents.length}");
    final startIndex = contents.indexOf(DIV_RESULT);
    //print("startIndex : $startIndex");
    final endIndex = contents.indexOf("</div>", startIndex + DIV_RESULT.length);
    //print("endIndex : $endIndex");
    return contents.substring(startIndex + DIV_RESULT.length, endIndex);
  }

  void close() {
    _client.close();
  }
}

// CODE   LANGUAGE
//  en     English
//  fr     French
//  es     Spanish
//  it     Italian
//  de     German
//  af     Afrikaans
//  sq     Albanian
//  am     Amharic
//  ar     Arabic
//  hy     Armenian
//  az     Azerbaijani
//  eu     Basque
//  be     Belarusian
//  bn     Bengali
//  bs     Bosnian
//  bg     Bulgarian
//  ca     Catalan
//  ceb    Cebuano
//  ny     Chichewa
//  zh-CN  Chinese (Simplified)
//  zh-TW  Chinese (Traditional)
//  co     Corsican
//  hr     Croatian
//  cs     Czech
//  da     Danish
//  nl     Dutch
//  eo     Esperanto
//  et     Estonian
//  tl     Filipino
//  fi     Finnish
//  fy     Frisian
//  gl     Galician
//  ka     Georgian
//  el     Greek
//  gu     Gujarati
//  ht     Haitian Creole
//  ha     Hausa
//  haw    Hawaiian
//  iw     Hebrew
//  hi     Hindi
//  hmn    Hmong
//  hu     Hungarian
//  is     Icelandic
//  ig     Igbo
//  id     Indonesian
//  ga     Irish
//  ja     Japanese
//  jw     Javanese
//  kn     Kannada
//  kk     Kazakh
//  km     Khmer
//  rw     Kinyarwanda
//  ko     Korean
//  ku     Kurdish (Kurmanji)
//  ky     Kyrgyz
//  lo     Lao
//  la     Latin
//  lv     Latvian
//  lt     Lithuanian
//  lb     Luxembourgish
//  mk     Macedonian
//  mg     Malagasy
//  ms     Malay
//  ml     Malayalam
//  mt     Maltese
//  mi     Maori
//  mr     Marathi
//  mn     Mongolian
//  my     Myanmar (Burmese)
//  ne     Nepali
//  no     Norwegian
//  or     Odia (Oriya)
//  ps     Pashto
//  fa     Persian
//  pl     Polish
//  pt     Portuguese
//  pa     Punjabi
//  ro     Romanian
//  ru     Russian
//  sm     Samoan
//  gd     Scots Gaelic
//  sr     Serbian
//  st     Sesotho
//  sn     Shona
//  sd     Sindhi
//  si     Sinhala
//  sk     Slovak
//  sl     Slovenian
//  so     Somali
//  su     Sundanese
//  sw     Swahili
//  sv     Swedish
//  tg     Tajik
//  ta     Tamil
//  tt     Tatar
//  te     Telugu
//  th     Thai
//  tr     Turkish
//  tk     Turkmen
//  uk     Ukrainian
//  ur     Urdu
//  ug     Uyghur
//  uz     Uzbek
//  vi     Vietnamese
//  cy     Welsh
//  xh     Xhosa
//  yi     Yiddish
//  yo     Yoruba
//  zu     Zulu
