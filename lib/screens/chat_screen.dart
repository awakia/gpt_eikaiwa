import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:gpt_eikaiwa/services/speech_to_text.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen>
    with AutomaticKeepAliveClientMixin<ChatScreen> {
  final TextEditingController _textController = TextEditingController();
  final List<String> _messages = []; // メッセージを保持するリスト
  final SpeechToText _speech = SpeechToText();

  @override
  bool get wantKeepAlive => true;

  void _handleSpeechResult(String result) {
    setState(() {
      _textController.text = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return PlatformScaffold(
      appBar: PlatformAppBar(
        title: const Text('GPT英会話 - チャット学習'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              reverse: true,
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              itemCount: _messages
                  .length, // Update this with the number of chat messages
              itemBuilder: (context, index) {
                return _buildMessageItem(_messages[
                    index]); // Build the message UI with the message at index
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

  Widget _buildMessageItem(String message) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CircleAvatar(
            child: Text('U'),
          ),
          const SizedBox(width: 8.0),
          Expanded(
            child: Text(
              message,
              style: const TextStyle(fontSize: 16),
            ),
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
    setState(() {
      _messages.insert(0, text); // メッセージをリストに追加
    });
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
