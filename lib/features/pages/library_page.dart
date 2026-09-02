import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zad/features/components/home_product.dart';
import 'package:zad/features/state/cart_provider.dart';
import 'package:zad/features/state/favorites_provider.dart';

class LibraryPage extends StatelessWidget {
  const LibraryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('مكتبة زاد')),
      body: ListView.separated(
        padding: const EdgeInsets.all(20),
        itemCount: listOfProducts.length,
        separatorBuilder: (context, index) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          final book = listOfProducts[index];
          final favorite = context.watch<FavoritesProvider>().isFavorite(book);
          return Card(
            child: InkWell(
              borderRadius: BorderRadius.circular(16),
              onTap: () => Navigator.pushNamed(
                context,
                '/book-details',
                arguments: book,
              ),
              child: ListTile(
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 6,
                ),
                leading: const CircleAvatar(
                  backgroundColor: Color(0xFFE7F1EF),
                  child: Icon(
                    Icons.menu_book_outlined,
                    color: Color(0xFF0B6B5B),
                  ),
                ),
                title: Text(
                  book.title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  '${book.subTitle}\n${book.price.toStringAsFixed(0)} جنيه',
                ),
                isThreeLine: true,
                trailing: Wrap(
                  spacing: 2,
                  children: [
                    IconButton(
                      tooltip: favorite
                          ? 'إزالة من المفضلة'
                          : 'إضافة إلى المفضلة',
                      onPressed: () =>
                          context.read<FavoritesProvider>().toggle(book),
                      icon: Icon(
                        favorite ? Icons.favorite : Icons.favorite_border,
                        color: favorite
                            ? Colors.redAccent
                            : const Color(0xFF0B6B5B),
                      ),
                    ),
                    IconButton(
                      tooltip: 'إضافة إلى السلة',
                      onPressed: () {
                        context.read<CartProvider>().add(book);
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('تمت إضافة الكتاب إلى السلة'),
                          ),
                        );
                      },
                      icon: const Icon(
                        Icons.add_shopping_cart,
                        color: Color(0xFF0B6B5B),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
