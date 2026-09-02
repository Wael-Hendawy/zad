import 'package:flutter/material.dart';
import 'package:zad/features/components/home_banner_section.dart';
import 'package:zad/features/components/home_category_section.dart';
import 'package:zad/features/components/home_drawer.dart';
import 'package:zad/features/components/home_daily_content.dart';
import 'package:zad/features/components/home_product.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;

  void _openSection(String route) => Navigator.pushNamed(context, route);

  void _showMessage(String message) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(content: Text(message), behavior: SnackBarBehavior.floating),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const HomeDrawer(),
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          'ZAD | زاد',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
        actions: [
          IconButton(
            onPressed: () => _showMessage('البحث في محتوى زاد قريبًا'),
            icon: const Icon(Icons.search, size: 28),
          ),
          IconButton(
            onPressed: () => _openSection('/cart'),
            icon: const Icon(Icons.shopping_bag_rounded, size: 28),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            const SizedBox(height: 20),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
              decoration: BoxDecoration(
                color: const Color(0xFF0B6B5B),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Text(
                'مرحبًا بك فى زاد',
                textAlign: TextAlign.right,
                textDirection: TextDirection.rtl,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 21,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 20),
            const HomeCategorySection(),
            const SizedBox(height: 20),
            const HomeBannerSection(),
            const SizedBox(height: 20),
            const HomeDailyContent(),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'مختارات زاد',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                TextButton(
                  onPressed: () => _openSection('/library'),
                  child: const Text('عرض الكل'),
                ),
              ],
            ),
            SizedBox(
              height: 400,
              child: ListView.separated(
                separatorBuilder: (context, index) => const SizedBox(width: 15),
                itemBuilder: (context, i) =>
                    Product(productModel: listOfProducts[i]),
                itemCount: listOfProducts.length,
                scrollDirection: Axis.horizontal,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'محتوى مختار',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                TextButton(
                  onPressed: () => _showMessage('سيتم عرض كل المحتوى قريبًا'),
                  child: const Text('عرض الكل'),
                ),
              ],
            ),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                mainAxisExtent: 400,
              ),
              itemCount: listOfProducts.length,
              itemBuilder: (context, index) =>
                  Product(productModel: listOfProducts[index]),
            ),
          ],
        ),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,
        onDestinationSelected: (index) {
          setState(() => selectedIndex = index);
          const routes = ['/quran', '/azkar', '/tasbeeh', '/library'];
          if (index > 0) _openSection(routes[index - 1]);
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'الرئيسية',
          ),
          NavigationDestination(
            icon: Icon(Icons.menu_book_outlined),
            label: 'القرآن',
          ),
          NavigationDestination(
            icon: Icon(Icons.wb_sunny_outlined),
            label: 'الأذكار',
          ),
          NavigationDestination(
            icon: Icon(Icons.touch_app_outlined),
            label: 'التسبيح',
          ),
          NavigationDestination(
            icon: Icon(Icons.local_library_outlined),
            label: 'المكتبة',
          ),
        ],
      ),
    );
  }
}
