import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
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
    return MaterialApp(
      title: 'GPT英会話',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final List<Widget> _pages = [
    const HomeScreen(),
    const ChatScreen(),
    const WordCardScreen(),
    const ProgressScreen(),
    const SettingsScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: buildPlatformBottomNavigationBar(),
    );
  }

  Widget buildPlatformBottomNavigationBar() {
    return PlatformNavBar(
      currentIndex: _currentIndex,
      itemChanged: _onItemTapped,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'ホーム',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.chat),
          label: 'チャット',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.book),
          label: '単語カード',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.show_chart),
          label: '進捗',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: '設定',
        ),
      ],
      material: (_, __) => MaterialNavBarData(
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.white,
      ),
      cupertino: (_, __) => CupertinoTabBarData(
        activeColor: Colors.blue,
        backgroundColor: Colors.white,
      ),
    );
  }
}
