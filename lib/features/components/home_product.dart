import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zad/features/models/product_model.dart';
import 'package:zad/features/state/cart_provider.dart';
import 'package:zad/features/state/favorites_provider.dart';

final List<ProductModel> listOfProducts = [
  ProductModel(
    title: 'تفسير ميسر',
    price: 120,
    image: 'assets/images/book_tafsir.png',
    subTitle: 'تفسير مبسط للقرآن الكريم',
    discount: 0,
    isNew: true,
    isExcl: false,
  ),
  ProductModel(
    title: 'حصن المسلم',
    price: 85,
    image: 'assets/images/book_hisn.png',
    subTitle: 'أذكار الصباح والمساء',
    discount: 0,
    isNew: false,
    isExcl: true,
  ),
  ProductModel(
    title: 'رياض الصالحين',
    price: 150,
    image: 'assets/images/book_riyad.png',
    subTitle: 'مختارات من الحديث الشريف',
    discount: 10,
    isNew: false,
    isExcl: false,
  ),
  ProductModel(
    title: 'قصص الأنبياء',
    price: 110,
    image: 'assets/images/book_stories.png',
    subTitle: 'قصص تربوية للأسرة',
    discount: 5,
    isNew: true,
    isExcl: false,
  ),
];

class Product extends StatelessWidget {
  const Product({super.key, required this.productModel});
  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    final favorite = context.watch<FavoritesProvider>().isFavorite(
      productModel,
    );
    return SizedBox(
      width: 235,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: InkWell(
              borderRadius: BorderRadius.circular(20),
              onTap: () => Navigator.pushNamed(
                context,
                '/book-details',
                arguments: productModel,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.asset(
                      productModel.image,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stack) => Container(
                        color: const Color(0xFFE7F1EF),
                        child: const Icon(Icons.menu_book, size: 60),
                      ),
                    ),
                    Positioned(
                      top: 10,
                      right: 10,
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        child: IconButton(
                          tooltip: 'إضافة إلى السلة',
                          onPressed: () {
                            context.read<CartProvider>().add(productModel);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'تمت إضافة ${productModel.title} إلى السلة',
                                ),
                              ),
                            );
                          },
                          icon: const Icon(
                            Icons.add_shopping_cart,
                            color: Color(0xFF0B6B5B),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 10,
                      left: 10,
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        child: IconButton(
                          tooltip: favorite
                              ? 'إزالة من المفضلة'
                              : 'إضافة إلى المفضلة',
                          onPressed: () => context
                              .read<FavoritesProvider>()
                              .toggle(productModel),
                          icon: Icon(
                            favorite ? Icons.favorite : Icons.favorite_border,
                            color: favorite
                                ? Colors.redAccent
                                : const Color(0xFF0B6B5B),
                          ),
                        ),
                      ),
                    ),
                    if (productModel.isNew == true)
                      const Positioned(
                        left: 10,
                        bottom: 10,
                        child: Chip(label: Text('جديد')),
                      ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            productModel.subTitle,
            style: TextStyle(color: Colors.grey.shade600),
          ),
          Text(
            productModel.title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Text(
            '${productModel.price} جنيه',
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFF0B6B5B),
            ),
          ),
        ],
      ),
    );
  }
}
