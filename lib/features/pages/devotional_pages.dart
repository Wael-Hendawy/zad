import 'package:flutter/material.dart';

class QuranSurah {
  const QuranSurah(this.name, this.verses);
  final String name;
  final List<String> verses;
}

const quranSurahs = <QuranSurah>[
  QuranSurah('سورة الفاتحة', [
    'بِسْمِ اللَّهِ الرَّحْمَٰنِ الرَّحِيمِ',
    'الْحَمْدُ لِلَّهِ رَبِّ الْعَالَمِينَ',
    'الرَّحْمَٰنِ الرَّحِيمِ',
    'مَالِكِ يَوْمِ الدِّينِ',
    'إِيَّاكَ نَعْبُدُ وَإِيَّاكَ نَسْتَعِينُ',
    'اهْدِنَا الصِّرَاطَ الْمُسْتَقِيمَ',
    'صِرَاطَ الَّذِينَ أَنْعَمْتَ عَلَيْهِمْ غَيْرِ الْمَغْضُوبِ عَلَيْهِمْ وَلَا الضَّالِّينَ',
  ]),
  QuranSurah('سورة الإخلاص', [
    'قُلْ هُوَ اللَّهُ أَحَدٌ',
    'اللَّهُ الصَّمَدُ',
    'لَمْ يَلِدْ وَلَمْ يُولَدْ',
    'وَلَمْ يَكُنْ لَهُ كُفُوًا أَحَدٌ',
  ]),
  QuranSurah('سورة الفلق', [
    'قُلْ أَعُوذُ بِرَبِّ الْفَلَقِ',
    'مِنْ شَرِّ مَا خَلَقَ',
    'وَمِنْ شَرِّ غَاسِقٍ إِذَا وَقَبَ',
    'وَمِنْ شَرِّ النَّفَّاثَاتِ فِي الْعُقَدِ',
    'وَمِنْ شَرِّ حَاسِدٍ إِذَا حَسَدَ',
  ]),
];

class HadithItem {
  const HadithItem(this.title, this.text, this.source);
  final String title;
  final String text;
  final String source;
}

const hadithItems = <HadithItem>[
  HadithItem(
    'إنما الأعمال بالنيات',
    'إنما الأعمال بالنيات، وإنما لكل امرئ ما نوى.',
    'متفق عليه',
  ),
  HadithItem(
    'من كان يؤمن بالله',
    'من كان يؤمن بالله واليوم الآخر فليقل خيرًا أو ليصمت.',
    'متفق عليه',
  ),
  HadithItem(
    'لا يؤمن أحدكم',
    'لا يؤمن أحدكم حتى يحب لأخيه ما يحب لنفسه.',
    'متفق عليه',
  ),
  HadithItem(
    'الدين النصيحة',
    'الدين النصيحة. قلنا: لمن؟ قال: لله ولكتابه ولرسوله ولأئمة المسلمين وعامتهم.',
    'رواه مسلم',
  ),
];

class QuranPage extends StatelessWidget {
  const QuranPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('القرآن الكريم')),
      body: ListView.separated(
        padding: const EdgeInsets.all(20),
        itemCount: quranSurahs.length,
        separatorBuilder: (_, index) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          final surah = quranSurahs[index];
          return Card(
            child: ListTile(
              leading: const CircleAvatar(
                child: Icon(Icons.menu_book_outlined),
              ),
              title: Text(
                surah.name,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text('${surah.verses.length} آيات'),
              trailing: const Icon(Icons.chevron_left),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => QuranReadingPage(surah: surah),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class QuranReadingPage extends StatelessWidget {
  const QuranReadingPage({super.key, required this.surah});
  final QuranSurah surah;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(surah.name)),
      body: ListView.builder(
        padding: const EdgeInsets.all(24),
        itemCount: surah.verses.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Text(
            '${surah.verses[index]}  ﴿${index + 1}﴾',
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 25,
              height: 1.9,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}

class DhikrItem {
  const DhikrItem(this.text, this.repeat, this.source);
  final String text;
  final int repeat;
  final String source;
}

const morningAzkar = <DhikrItem>[
  DhikrItem(
    'أصبحنا وأصبح الملك لله، والحمد لله، لا إله إلا الله وحده لا شريك له، له الملك وله الحمد وهو على كل شيء قدير.',
    1,
    'رواه أبو داود',
  ),
  DhikrItem(
    'اللهم بك أصبحنا وبك أمسينا، وبك نحيا وبك نموت وإليك النشور.',
    1,
    'رواه الترمذي',
  ),
  DhikrItem(
    'رضيت بالله ربًا، وبالإسلام دينًا، وبمحمد صلى الله عليه وسلم نبيًا.',
    3,
    'رواه أبو داود والترمذي',
  ),
  DhikrItem(
    'حسبي الله لا إله إلا هو، عليه توكلت وهو رب العرش العظيم.',
    7,
    'ورد في القرآن الكريم',
  ),
  DhikrItem('سبحان الله وبحمده.', 100, 'رواه مسلم'),
];

const eveningAzkar = <DhikrItem>[
  DhikrItem(
    'أمسينا وأمسى الملك لله، والحمد لله، لا إله إلا الله وحده لا شريك له، له الملك وله الحمد وهو على كل شيء قدير.',
    1,
    'رواه أبو داود',
  ),
  DhikrItem(
    'اللهم إني أسألك العفو والعافية في الدنيا والآخرة.',
    1,
    'رواه أبو داود',
  ),
  DhikrItem(
    'رضيت بالله ربًا، وبالإسلام دينًا، وبمحمد صلى الله عليه وسلم نبيًا.',
    3,
    'رواه أبو داود والترمذي',
  ),
  DhikrItem('أعوذ بكلمات الله التامات من شر ما خلق.', 3, 'رواه مسلم'),
  DhikrItem('أستغفر الله وأتوب إليه.', 100, 'رواه البخاري'),
];

const sleepAzkar = <DhikrItem>[
  DhikrItem('باسمك اللهم أموت وأحيا.', 1, 'رواه البخاري'),
  DhikrItem('اللهم قني عذابك يوم تبعث عبادك.', 3, 'رواه أبو داود والترمذي'),
  DhikrItem(
    'قراءة سورة الإخلاص والفلق والناس، ثم المسح على الجسد.',
    3,
    'رواه البخاري',
  ),
  DhikrItem('سبحان الله.', 33, 'وصية النبي صلى الله عليه وسلم'),
  DhikrItem('الحمد لله.', 33, 'وصية النبي صلى الله عليه وسلم'),
  DhikrItem('الله أكبر.', 34, 'وصية النبي صلى الله عليه وسلم'),
];

const prayerAzkar = <DhikrItem>[
  DhikrItem('أستغفر الله.', 3, 'رواه مسلم'),
  DhikrItem(
    'اللهم أنت السلام ومنك السلام، تباركت يا ذا الجلال والإكرام.',
    1,
    'رواه مسلم',
  ),
  DhikrItem(
    'لا إله إلا الله وحده لا شريك له، له الملك وله الحمد وهو على كل شيء قدير.',
    1,
    'رواه مسلم',
  ),
  DhikrItem('سبحان الله، والحمد لله، والله أكبر.', 33, 'رواه مسلم'),
];

class AzkarSection {
  const AzkarSection(this.title, this.items);
  final String title;
  final List<DhikrItem> items;
}

const azkarSections = <AzkarSection>[
  AzkarSection('أذكار الصباح', morningAzkar),
  AzkarSection('أذكار المساء', eveningAzkar),
  AzkarSection('أذكار النوم', sleepAzkar),
  AzkarSection('أذكار بعد الصلاة', prayerAzkar),
  AzkarSection('أذكار الاستيقاظ', [
    DhikrItem(
      'الحمد لله الذي أحيانا بعدما أماتنا وإليه النشور.',
      1,
      'رواه البخاري',
    ),
  ]),
];

class AzkarPage extends StatelessWidget {
  const AzkarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('الأذكار')),
      body: ListView.separated(
        padding: const EdgeInsets.all(20),
        itemCount: azkarSections.length,
        separatorBuilder: (_, index) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          final section = azkarSections[index];
          return Card(
            child: ListTile(
              leading: const CircleAvatar(child: Icon(Icons.wb_sunny_outlined)),
              title: Text(
                section.title,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text('${section.items.length} أذكار'),
              trailing: const Icon(Icons.chevron_left),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => AzkarReadingPage(section: section),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class AzkarReadingPage extends StatefulWidget {
  const AzkarReadingPage({super.key, required this.section});
  final AzkarSection section;

  @override
  State<AzkarReadingPage> createState() => _AzkarReadingPageState();
}

class _AzkarReadingPageState extends State<AzkarReadingPage> {
  late final List<int> counts;

  @override
  void initState() {
    super.initState();
    counts = List<int>.filled(widget.section.items.length, 0);
  }

  @override
  Widget build(BuildContext context) {
    final completed = counts.where((count) => count > 0).length;
    return Scaffold(
      appBar: AppBar(title: Text(widget.section.title)),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: widget.section.items.length + 1,
        separatorBuilder: (_, index) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          if (index == 0) {
            return LinearProgressIndicator(
              value: widget.section.items.isEmpty
                  ? 0
                  : completed / widget.section.items.length,
              minHeight: 8,
              borderRadius: BorderRadius.circular(8),
              color: const Color(0xFF0B6B5B),
            );
          }
          final dhikrIndex = index - 1;
          final dhikr = widget.section.items[dhikrIndex];
          final current = counts[dhikrIndex];
          final finished = current >= dhikr.repeat;
          return Card(
            color: finished ? const Color(0xFFE7F1EF) : null,
            child: Padding(
              padding: const EdgeInsets.all(18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    dhikr.text,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 20,
                      height: 1.8,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    dhikr.source,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey.shade600),
                  ),
                  const SizedBox(height: 14),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'التكرار: $current / ${dhikr.repeat}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF0B6B5B),
                        ),
                      ),
                      FilledButton.icon(
                        onPressed: finished
                            ? null
                            : () => setState(() => counts[dhikrIndex]++),
                        icon: Icon(finished ? Icons.check : Icons.touch_app),
                        label: Text(finished ? 'تم' : 'اذكر'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class HadithPage extends StatelessWidget {
  const HadithPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('الحديث الشريف')),
      body: ListView.separated(
        padding: const EdgeInsets.all(20),
        itemCount: hadithItems.length,
        separatorBuilder: (_, index) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          final hadith = hadithItems[index];
          return Card(
            child: ListTile(
              leading: const CircleAvatar(
                child: Icon(Icons.format_quote_outlined),
              ),
              title: Text(
                hadith.title,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                hadith.text,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              trailing: const Icon(Icons.chevron_left),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => HadithReadingPage(hadith: hadith),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class HadithReadingPage extends StatelessWidget {
  const HadithReadingPage({super.key, required this.hadith});
  final HadithItem hadith;

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('قراءة الحديث')),
    body: Padding(
      padding: const EdgeInsets.all(24),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                hadith.title,
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 24),
              Text(
                hadith.text,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 23, height: 1.8),
              ),
              const SizedBox(height: 24),
              Text(
                hadith.source,
                style: const TextStyle(
                  color: Color(0xFF0B6B5B),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

class TasbeehPage extends StatefulWidget {
  const TasbeehPage({super.key});
  @override
  State<TasbeehPage> createState() => _TasbeehPageState();
}

class _TasbeehPageState extends State<TasbeehPage> {
  final dhikrOptions = const [
    'سبحان الله',
    'الحمد لله',
    'الله أكبر',
    'لا إله إلا الله',
    'أستغفر الله',
  ];
  String selectedDhikr = 'سبحان الله';
  int count = 0;

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('التسبيح')),
    body: Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DropdownButtonFormField<String>(
            initialValue: selectedDhikr,
            decoration: const InputDecoration(labelText: 'اختر الذكر'),
            items: dhikrOptions
                .map((item) => DropdownMenuItem(value: item, child: Text(item)))
                .toList(),
            onChanged: (value) => setState(() {
              selectedDhikr = value ?? selectedDhikr;
              count = 0;
            }),
          ),
          const SizedBox(height: 32),
          Text(
            selectedDhikr,
            style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          Text(
            '$count',
            style: const TextStyle(
              fontSize: 76,
              fontWeight: FontWeight.bold,
              color: Color(0xFF0B6B5B),
            ),
          ),
          const SizedBox(height: 20),
          FilledButton(
            onPressed: () => setState(() => count++),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 16),
              child: Text('اضغط للعد'),
            ),
          ),
          TextButton(
            onPressed: () => setState(() => count = 0),
            child: const Text('إعادة الضبط'),
          ),
        ],
      ),
    ),
  );
}

class DevotionalListPage extends StatelessWidget {
  const DevotionalListPage({
    super.key,
    required this.title,
    required this.icon,
    required this.items,
  });
  final String title;
  final IconData icon;
  final List<String> items;

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: Text(title)),
    body: ListView.separated(
      padding: const EdgeInsets.all(20),
      itemCount: items.length,
      separatorBuilder: (context, index) => const SizedBox(height: 10),
      itemBuilder: (context, index) => Card(
        child: ListTile(
          leading: CircleAvatar(child: Icon(icon)),
          title: Text(items[index]),
          trailing: const Icon(Icons.chevron_left),
          onTap: () => showDialog<void>(
            context: context,
            builder: (_) => AlertDialog(
              title: Text(items[index]),
              content: Text('تم فتح قسم ${items[index]} في تطبيق زاد.'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('إغلاق'),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
