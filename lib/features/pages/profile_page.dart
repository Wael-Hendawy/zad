// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('الملف الشخصي')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const CircleAvatar(radius: 44, child: Icon(Icons.person_outline, size: 44)),
          const SizedBox(height: 14),
          const Center(child: Text('مستخدم زاد', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold))),
          const SizedBox(height: 24),
          const Card(child: ListTile(leading: Icon(Icons.bookmark_outline), title: Text('السور المحفوظة'), subtitle: Text('تابع آخر موضع قراءة'))),
          const Card(child: ListTile(leading: Icon(Icons.favorite_outline), title: Text('المفضلة'), subtitle: Text('الأذكار والكتب المفضلة'))),
          const Card(child: ListTile(leading: Icon(Icons.settings_outlined), title: Text('الإعدادات'), subtitle: Text('المظهر واللغة والإشعارات'))),
        ],
      ),
    );
  }
}
