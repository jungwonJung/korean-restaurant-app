import 'package:flutter/material.dart';

import 'food.dart';

class Shop extends ChangeNotifier {
  final List<Food> _foodMenu = [
    Food(
        name: "TteokBokki",
        imagePath: "lib/images/tteok.png",
        price: "21.00",
        rating: "4.8"),
    Food(
        name: "BudaeJjiage",
        imagePath: "lib/images/budae-jjigae.png",
        price: "30.00",
        rating: "4.4"),
    Food(
        name: "Bibimbap",
        imagePath: "lib/images/bibimbap.png",
        price: "22.00",
        rating: "4.9"),
    Food(
        name: "Gimbap",
        imagePath: "lib/images/gimbap.png",
        price: "17.00",
        rating: "4.9")
  ];

  // customer cart
  List<Food> _cart = [];

  // getter methods
  List<Food> get foodMenu => _foodMenu;
  List<Food> get cart => _cart;

  // add to cart
  void addToCart(Food foodItem, int quantity) {
    for (int i = 0; i < quantity; i++) {
      _cart.add(foodItem);
    }
    notifyListeners();
  }

  // remover from the cart
  void removeFromCart(Food food) {
    _cart.remove(food);
    notifyListeners();
  }
}
