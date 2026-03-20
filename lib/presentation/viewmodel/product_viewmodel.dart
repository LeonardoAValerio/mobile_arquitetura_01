import 'package:flutter/material.dart';
import 'package:product_app/domain/repositories/product_repository.dart';
import 'package:product_app/presentation/viewmodel/product_state.dart';

class ProductViewModel extends ChangeNotifier {
  final ProductRepository repository;
  ProductState _state = const ProductState();
  
  ProductState get state => _state;
  
  ProductViewModel(this.repository);
  
  Future<void> loadProducts() async {
    _state = _state.copyWith(isLoading: true);
    notifyListeners();
    
    try {
      final products = await repository.getProducts();
      _state = _state.copyWith(
        isLoading: false,
        products: products,
      );
    } catch (e) {
      _state = _state.copyWith(
        isLoading: false,
        error: e.toString(),
      );
    }
    notifyListeners();
  }

  void toggleFavorite(int productId) {
    final updatedProducts = _state.products.map((product) {
      if (product.id == productId) {
        return product.copyWith(isFavorite: !product.isFavorite);
      }
      return product;
    }).toList();
    
    _state = _state.copyWith(products: updatedProducts);
    notifyListeners();
  }
}