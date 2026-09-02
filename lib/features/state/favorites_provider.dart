import 'package:flutter/foundation.dart';
import 'package:zad/features/models/product_model.dart';

class FavoritesProvider extends ChangeNotifier {
  final Set<String> _favoriteTitles = <String>{};

  bool isFavorite(ProductModel product) => _favoriteTitles.contains(product.title);

  void toggle(ProductModel product) {
    if (isFavorite(product)) {
      _favoriteTitles.remove(product.title);
    } else {
      _favoriteTitles.add(product.title);
    }
    notifyListeners();
  }

  List<ProductModel> favoritesFrom(List<ProductModel> products) =>
      products.where(isFavorite).toList();
}
