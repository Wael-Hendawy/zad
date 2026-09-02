import 'package:flutter/material.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24),
                color: const Color(0xFF0B6B5B),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(radius: 30, child: Icon(Icons.person_outline)),
                    SizedBox(height: 12),
                    Text('ZAD | زاد', style: TextStyle(color: Colors.white, fontSize: 21, fontWeight: FontWeight.bold)),
                    SizedBox(height: 4),
                    Text('رفيقك في طريق الخير', style: TextStyle(color: Colors.white70)),
                  ],
                ),
              ),
              ListTile(leading: const Icon(Icons.home_outlined), title: const Text('الرئيسية'), onTap: () => Navigator.pop(context)),
              ListTile(leading: const Icon(Icons.menu_book_outlined), title: const Text('القرآن الكريم'), onTap: () { Navigator.pop(context); Navigator.pushNamed(context, '/quran'); }),
              ListTile(leading: const Icon(Icons.wb_sunny_outlined), title: const Text('الأذكار'), onTap: () { Navigator.pop(context); Navigator.pushNamed(context, '/azkar'); }),
              ListTile(leading: const Icon(Icons.format_quote_outlined), title: const Text('الحديث الشريف'), onTap: () { Navigator.pop(context); Navigator.pushNamed(context, '/hadith'); }),
              ListTile(leading: const Icon(Icons.touch_app_outlined), title: const Text('التسبيح'), onTap: () { Navigator.pop(context); Navigator.pushNamed(context, '/tasbeeh'); }),
              ListTile(leading: const Icon(Icons.local_library_outlined), title: const Text('المكتبة'), onTap: () { Navigator.pop(context); Navigator.pushNamed(context, '/library'); }),
              const Divider(),
              ListTile(leading: const Icon(Icons.settings_outlined), title: const Text('الإعدادات'), onTap: () => Navigator.pop(context)),
              ListTile(leading: const Icon(Icons.person_outline), title: const Text('الملف الشخصي'), onTap: () { Navigator.pop(context); Navigator.pushNamed(context, '/profile'); }),
            ],
          ),
        ),
      ),
    );
  }
}
