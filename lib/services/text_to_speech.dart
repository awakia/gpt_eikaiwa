import 'package:flutter_tts/flutter_tts.dart';

class TextToSpeech {
  FlutterTts flutterTts = FlutterTts();

  Future speak(String text, String locale) async {
    await flutterTts.setLanguage(locale);
    await flutterTts.speak(text);
  }

  Future speakJa(String text) async {
    await speak(text, 'ja-JP');
  }

  Future speakEn(String text) async {
    await speak(text, 'en-US');
  }

  Future stop() async {
    await flutterTts.stop();
  }
}
