import 'package:ecomappwithprovider/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartProvider extends ChangeNotifier {
  final List<Product> _cart = [];
  // _cart एक private list है जिसमें Product objects (यानि जो items आप cart में डालते हैं) रखे जाते हैं।
  List<Product> get cart => _cart;
  // get cart एक getter है जिससे आप _cart को बाहर से read कर सकते हैं, पर direct change नहीं कर सकते।

  void toggleFavorite(Product product) {
    if (_cart.contains(product)) {
      for (Product element in _cart) {
        element.quantity++;
      }
    } else {
      _cart.add(product);
    }
    notifyListeners(); //change data
  }

  // this is short cut fot access cartProvider anywhere
  static CartProvider of(BuildContext context, {bool listen = true}) {
    return Provider.of<CartProvider>(context, listen: listen);
  }

  incrementQtn(int index) => _cart[index].quantity++;
  decrementQtn(int index) => _cart[index].quantity--;
  totalPrice() {
    double total1 = 0.0;
    for (Product element in _cart) {
      total1 += element.price * element.quantity;
    }
    return total1;
  }
}
