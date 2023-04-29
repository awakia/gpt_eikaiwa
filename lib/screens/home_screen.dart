import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      appBar: PlatformAppBar(
        title: const Text('GPT英会話'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Padding(
                padding: EdgeInsets.all(16.0),
                child: WelcomeMessage(),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(16.0, 0, 16.0, 16.0),
                child: AppDescription(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class WelcomeMessage extends StatelessWidget {
  const WelcomeMessage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      'ようこそ、GPT英会話へ！',
      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
    );
  }
}

class AppDescription extends StatelessWidget {
  const AppDescription({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      'GPT英会話は、AIを活用して英語学習を効果的にサポートするアプリです。チャット形式で英会話練習ができる機能や、URLから英単語やフレーズを取り込んで学習・復習できるカード形式の機能など、英語学習に役立つ多彩な機能が揃っています。さあ、楽しく英語を学びましょう！',
      style: TextStyle(fontSize: 16),
    );
  }
}
