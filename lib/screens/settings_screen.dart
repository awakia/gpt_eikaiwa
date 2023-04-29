import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('設定画面'),
      ),
      body: ListView(
        children: const [
          CustomSettingItem(
            title: '通知設定',
            iconData: Icons.notifications,
          ),
          CustomSettingItem(
            title: 'プライバシー設定',
            iconData: Icons.lock,
          ),
        ],
      ),
    );
  }
}

class CustomSettingItem extends StatelessWidget {
  final String title;
  final IconData iconData;

  const CustomSettingItem({
    Key? key,
    required this.title,
    required this.iconData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(iconData),
      title: Text(title),
      trailing: const Icon(Icons.chevron_right),
      onTap: () {
        // Implement navigation or action for the setting item
      },
    );
  }
}
