import 'dart:convert';

import 'package:get/get.dart';
import 'package:winter_store/data/repositories/product/product_repository.dart';
import 'package:winter_store/features/shop/models/product_model.dart';
import 'package:winter_store/utils/local_storage/storage_utility.dart';

class FavoritesController extends GetxController {
  // Singleton
  static FavoritesController get instance => Get.find();

  // Variables
  final favorites = <String, bool>{}.obs;

  @override
  void onInit() {
    super.onInit();
    initFavorites();
  }

  Future<void> initFavorites() async {
    final json = TLocalStorage.instance().readData('favorites');
    if (json != null) {
      final storedFavorites = jsonDecode(json) as Map<String, dynamic>;
      favorites.assignAll(
          storedFavorites.map((key, value) => MapEntry(key, value as bool)));
    }
  }

  bool isFavorite(String productId) {
    return favorites[productId] ?? false;
  }

  void saveFavoritesToStorage() {
    final encodedFavorites = jsonEncode(favorites);
    TLocalStorage.instance().saveData('favorites', encodedFavorites);
  }

  void toggleFavoriteProduct(String productId) {
    if (!favorites.containsKey(productId)) {
      favorites[productId] = true;
      saveFavoritesToStorage();
    } else {
      TLocalStorage.instance().removeData(productId);
      favorites.remove(productId);
      saveFavoritesToStorage();
      favorites.refresh();
    }
  }

  Future<List<ProductModel>> favoriteProducts() async {
    return await ProductRepository.instance
        .getFavoriteProducts(favorites.keys.toList());
  }
}
