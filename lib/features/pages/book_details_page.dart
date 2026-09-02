import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zad/features/models/product_model.dart';
import 'package:zad/features/state/cart_provider.dart';
import 'package:zad/features/state/favorites_provider.dart';

class BookDetailsPage extends StatelessWidget {
  const BookDetailsPage({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final isFavorite = context.watch<FavoritesProvider>().isFavorite(product);
    return Scaffold(
      appBar: AppBar(
        title: const Text('تفاصيل الكتاب'),
        actions: [
          IconButton(
            tooltip: 'المفضلة',
            onPressed: () => context.read<FavoritesProvider>().toggle(product),
            icon: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              color: isFavorite ? Colors.redAccent : Colors.white,
            ),
          ),
          IconButton(
            tooltip: 'السلة',
            onPressed: () => Navigator.pushNamed(context, '/cart'),
            icon: const Icon(Icons.shopping_bag_outlined),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(24),
              child: AspectRatio(
                aspectRatio: 1.15,
                child: Image.asset(
                  product.image,
                  fit: BoxFit.cover,
                  errorBuilder: (_, error, stackTrace) => Container(
                    color: const Color(0xFFE7F1EF),
                    child: const Icon(Icons.menu_book, size: 90),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 22),
            Text(
              product.title,
              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              product.subTitle,
              style: TextStyle(fontSize: 17, color: Colors.grey.shade700),
            ),
            const SizedBox(height: 18),
            Text(
              '${product.price.toStringAsFixed(0)} جنيه',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF0B6B5B),
              ),
            ),
            const SizedBox(height: 22),
            const Text(
              'عن الكتاب',
              style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'كتاب مختار بعناية من مكتبة زاد، يقدم محتوى إسلاميًا نافعًا بأسلوب واضح ومناسب للقراءة اليومية. يمكنك حفظه في المفضلة أو إضافته إلى سلة الكتب للرجوع إليه لاحقًا.',
              style: TextStyle(
                fontSize: 16,
                height: 1.8,
                color: Colors.grey.shade800,
              ),
            ),
            const SizedBox(height: 28),
            ElevatedButton.icon(
              onPressed: () {
                context.read<CartProvider>().add(product);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('تمت إضافة الكتاب إلى السلة')),
                );
              },
              icon: const Icon(Icons.add_shopping_cart),
              label: const Text('إضافة إلى السلة'),
            ),
            OutlinedButton.icon(
              onPressed: () =>
                  context.read<FavoritesProvider>().toggle(product),
              icon: Icon(isFavorite ? Icons.favorite : Icons.favorite_border),
              label: Text(isFavorite ? 'إزالة من المفضلة' : 'حفظ في المفضلة'),
            ),
          ],
        ),
      ),
    );
  }
}
