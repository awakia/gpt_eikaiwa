import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class SpeechToText {
  final stt.SpeechToText _speech = stt.SpeechToText();
  String transcription = '';

  void Function(String)? onResult;

  bool isListening() {
    return _speech.isListening;
  }

  void startListening() async {
    bool available = await _speech.initialize();
    if (available) {
      _speech.listen(
        onResult: (result) {
          transcription = result.recognizedWords;
          if (onResult != null) {
            onResult!(transcription);
          }
          debugPrint('認識結果： $transcription'); // debugPrintで表示する
        },
        listenFor: const Duration(seconds: 15),
        pauseFor: const Duration(seconds: 3),
        onSoundLevelChange: null,
        cancelOnError: true,
        listenMode: stt.ListenMode.confirmation,
        // localeId: 'ja-JP'
      );
    } else {
      debugPrint('The user has denied the use of speech recognition.');
    }
  }

  void stopListening() {
    if (isListening()) {
      _speech.stop();
    }
  }
}
