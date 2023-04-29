import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:gpt_eikaiwa/screens/home_screen.dart';
import 'package:gpt_eikaiwa/screens/chat_screen.dart';
import 'package:gpt_eikaiwa/screens/word_card_screen.dart';
import 'package:gpt_eikaiwa/screens/progress_screen.dart';
import 'package:gpt_eikaiwa/screens/settings_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'GPT英会話',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  final List<Widget> _widgetOptions = <Widget>[
    const HomeScreen(),
    const ChatScreen(),
    const WordCardScreen(),
    const ProgressScreen(),
    const SettingsScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final isMaterialPlatform =
        Theme.of(context).platform == TargetPlatform.android;
    return Scaffold(
      appBar: AppBar(
        title: const Text('英語学習アプリ'),
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: isMaterialPlatform
          ? BottomNavigationBar(
              currentIndex: _selectedIndex,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'ホーム',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.chat_bubble),
                  label: 'チャット学習',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.view_carousel),
                  label: '単語カード',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.bar_chart),
                  label: '進捗状況',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.settings),
                  label: '設定',
                ),
              ],
              selectedItemColor: Colors.amber[800],
              onTap: _onItemTapped,
            )
          : CupertinoTabBar(
              currentIndex: _selectedIndex,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'ホーム',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.chat_bubble),
                  label: 'チャット学習',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.view_carousel),
                  label: '単語カード',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.bar_chart),
                  label: '進捗状況',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.settings),
                  label: '設定',
                ),
              ],
              onTap: _onItemTapped,
            ),
    );
  }
}
