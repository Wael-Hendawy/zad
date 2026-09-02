import 'package:flutter/material.dart';
import 'package:zad/features/pages/devotional_pages.dart';

class HomeDailyContent extends StatelessWidget {
  const HomeDailyContent({super.key});

  @override
  Widget build(BuildContext context) {
    final day = DateTime.now().day;
    final surah = quranSurahs[day % quranSurahs.length];
    final hadith = hadithItems[day % hadithItems.length];
    final verse = surah.verses[day % surah.verses.length];

    return Column(
      children: [
        _DailyCard(
          icon: Icons.auto_stories_outlined,
          title: 'آية اليوم',
          content: '$verse\n(${surah.name})',
          buttonText: 'فتح القرآن',
          onPressed: () => Navigator.pushNamed(context, '/quran'),
        ),
        const SizedBox(height: 12),
        _DailyCard(
          icon: Icons.format_quote_outlined,
          title: 'حديث اليوم',
          content: '${hadith.text}\n— ${hadith.source}',
          buttonText: 'فتح الأحاديث',
          onPressed: () => Navigator.pushNamed(context, '/hadith'),
        ),
      ],
    );
  }
}

class _DailyCard extends StatelessWidget {
  const _DailyCard({
    required this.icon,
    required this.title,
    required this.content,
    required this.buttonText,
    required this.onPressed,
  });
  final IconData icon;
  final String title;
  final String content;
  final String buttonText;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: const Color(0xFFE7F1EF),
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                const Icon(Icons.star_outline, color: Color(0xFF0B6B5B)),
                const SizedBox(width: 8),
                Icon(icon, color: const Color(0xFF0B6B5B)),
                const SizedBox(width: 8),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              content,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 18, height: 1.7),
            ),
            const SizedBox(height: 10),
            Align(
              alignment: AlignmentDirectional.centerEnd,
              child: TextButton.icon(
                onPressed: onPressed,
                icon: const Icon(Icons.arrow_back),
                label: Text(buttonText),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
