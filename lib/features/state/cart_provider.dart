import 'package:flutter/foundation.dart';
import 'package:zad/features/models/product_model.dart';

class CartLine {
  CartLine({required this.product, this.quantity = 1});
  final ProductModel product;
  int quantity;
  double get subtotal => product.price * quantity;
}

class CartProvider extends ChangeNotifier {
  final List<CartLine> _lines = [];
  List<CartLine> get lines => List.unmodifiable(_lines);
  int get itemCount => _lines.fold(0, (sum, line) => sum + line.quantity);
  double get total => _lines.fold(0, (sum, line) => sum + line.subtotal);

  void add(ProductModel product) {
    final index = _lines.indexWhere((line) => line.product.title == product.title);
    if (index == -1) {
      _lines.add(CartLine(product: product));
    } else {
      _lines[index].quantity++;
    }
    notifyListeners();
  }

  void decrement(ProductModel product) {
    final index = _lines.indexWhere((line) => line.product.title == product.title);
    if (index == -1) return;
    if (_lines[index].quantity <= 1) {
      _lines.removeAt(index);
    } else {
      _lines[index].quantity--;
    }
    notifyListeners();
  }

  void remove(ProductModel product) {
    _lines.removeWhere((line) => line.product.title == product.title);
    notifyListeners();
  }

  void clear() {
    _lines.clear();
    notifyListeners();
  }
}
