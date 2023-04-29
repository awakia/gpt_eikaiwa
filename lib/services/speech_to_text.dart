import 'package:speech_to_text/speech_to_text.dart' as stt;

class SpeechToText {
  final stt.SpeechToText _speech = stt.SpeechToText();
  bool _isListening = false;
  String transcription = '';

  void startListening() {
    if (!_isListening) {
      _speech.listen(onResult: (result) {
        transcription = result.recognizedWords;
      });
      _isListening = true;
    }
  }

  void stopListening() {
    if (_isListening) {
      _speech.stop();
      _isListening = false;
    }
  }
}
