// ignore_for_file: prefer_const_constructors, unnecessary_const

import 'package:flutter/material.dart';

class HomeBannerSection extends StatelessWidget {
  const HomeBannerSection({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(24),
      onTap: () => Navigator.pushNamed(context, '/quran'),
      child: Container(
        height: 210,
        padding: const EdgeInsets.all(22),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          gradient: const LinearGradient(
            colors: [Color(0xFF0B6B5B), Color(0xFF134E4A)],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
        ),
        child: Row(
          children: [
            const Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'وردك اليومي',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 27,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'ابدأ يومك بآية وذكر',
                    style: TextStyle(color: Colors.white70, fontSize: 17),
                  ),
                  SizedBox(height: 16),
                  Chip(
                    label: const Text('اقرأ الآن'),
                    backgroundColor: Colors.white,
                    labelStyle: TextStyle(color: Color(0xFF0B6B5B)),
                  ),
                ],
              ),
            ),
            Container(
              width: 92,
              height: 92,
              decoration: BoxDecoration(
                color: Colors.white24,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.auto_stories_outlined,
                color: Colors.white,
                size: 54,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
