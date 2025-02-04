import 'package:flutter/widgets.dart';

class CartProvider extends ChangeNotifier {

  // List<Map<String, dynamic>: product_cart
  final List<Map<String, dynamic>> productCart = [];

  void addProduct(Map<String, dynamic> product) {
    productCart.add(product);
    notifyListeners();
  }

  void removeProduct(Map<String, dynamic> product) {
    productCart.remove(product);
    notifyListeners();
  }
}