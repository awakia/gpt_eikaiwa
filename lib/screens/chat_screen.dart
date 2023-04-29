import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:gpt_eikaiwa/services/speech_to_text.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _textController = TextEditingController();
  final SpeechToText _speech = SpeechToText();

  void _handleSpeechResult(String result) {
    _textController.text = result;
  }

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      appBar: PlatformAppBar(
        title: const Text('GPT英会話 - チャット学習'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 0, // Update this with the number of chat messages
              itemBuilder: (context, index) {
                // Implement the chat message UI here
                return Container();
              },
            ),
          ),
          const Divider(height: 1.0),
          Container(
            decoration: BoxDecoration(color: Theme.of(context).cardColor),
            child: _buildTextComposer(),
          ),
        ],
      ),
    );
  }

  Widget _buildTextComposer() {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: [
            Flexible(
              child: TextField(
                controller: _textController,
                decoration:
                    const InputDecoration.collapsed(hintText: 'メッセージを入力してください'),
                onSubmitted: _handleSubmitted,
              ),
            ),
            PlatformIconButton(
                onPressed: _toggleListening,
                material: (_, __) =>
                    MaterialIconButtonData(icon: const Icon(Icons.mic)),
                cupertino: (_, __) => CupertinoIconButtonData(
                    icon: const Icon(CupertinoIcons.mic))),
            PlatformIconButton(
              onPressed: () => _handleSubmitted(_textController.text),
              material: (_, __) =>
                  MaterialIconButtonData(icon: const Icon(Icons.send)),
              cupertino: (_, __) => CupertinoIconButtonData(
                  icon: const Icon(CupertinoIcons.arrow_up)),
            ),
          ],
        ),
      ),
    );
  }

  void _handleSubmitted(String text) {
    _textController.clear();
    // Implement the logic to send the message and update the chat UI
  }

  void _toggleListening() {
    if (_speech.isListening()) {
      _speech.stopListening();
    } else {
      _speech.onResult = _handleSpeechResult;
      _speech.startListening();
    }
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }
}
