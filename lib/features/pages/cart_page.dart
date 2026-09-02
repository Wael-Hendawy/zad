import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zad/features/state/cart_provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartProvider>();
    return Scaffold(
      appBar: AppBar(title: const Text('سلة كتب زاد')),
      body: cart.lines.isEmpty
          ? const Center(child: Text('السلة فارغة حاليًا'))
          : ListView.separated(
              padding: const EdgeInsets.all(20),
              itemCount: cart.lines.length,
              separatorBuilder: (context, index) => const SizedBox(height: 10),
              itemBuilder: (context, index) {
                final line = cart.lines[index];
                return Card(
                  child: ListTile(
                    leading: const CircleAvatar(child: Icon(Icons.menu_book_outlined)),
                    title: Text(line.product.title),
                    subtitle: Text('${line.product.price} جنيه × ${line.quantity}'),
                    trailing: Wrap(
                      children: [
                        IconButton(onPressed: () => cart.decrement(line.product), icon: const Icon(Icons.remove_circle_outline)),
                        IconButton(onPressed: () => cart.add(line.product), icon: const Icon(Icons.add_circle_outline)),
                        IconButton(onPressed: () => cart.remove(line.product), icon: const Icon(Icons.delete_outline)),
                      ],
                    ),
                  ),
                );
              },
            ),
      bottomNavigationBar: cart.lines.isEmpty
          ? null
          : SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('الإجمالي', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                        Text('${cart.total.toStringAsFixed(2)} جنيه', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF0B6B5B))),
                      ],
                    ),
                    const SizedBox(height: 12),
                    SizedBox(
                      width: double.infinity,
                      child: FilledButton(
                        onPressed: () => ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('تم تجهيز الطلب تجريبيًا'))),
                        child: const Text('إتمام الطلب'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
