import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:winter_store/data/repositories/product/product_repository.dart';
import 'package:winter_store/features/shop/models/product_model.dart';
import 'package:winter_store/utils/loaders/loaders.dart';

class AllProductController extends GetxController {
  // Singleton
  static AllProductController get instance => Get.find();

  // Variables
  final repository = ProductRepository.instance;
  final RxString selectedSortOption = 'Name'.obs;
  final RxList<ProductModel> products = <ProductModel>[].obs;

  Future<List<ProductModel>> fetchProductsByQuery(Query? query) async {
    try {
      if (query == null) return [];

      final products = await repository.fetchProductsByQuery(query);

      return products;
    } catch (e) {
      WLoader.errorSnackBar(title: 'Oh snap!', message: e.toString());
      return [];
    }
  }

  void sortProducts(String sortBy) {
    selectedSortOption.value = sortBy;
    switch (sortBy) {
      case 'Name':
        products.sort((a, b) => a.title.compareTo(b.title));
        break;

      case 'Higher Price':
        products.sort((a, b) => b.price.compareTo(a.price));
        break;

      case 'Lower Price':
        products.sort((a, b) => a.price.compareTo(b.price));
        break;

      case 'Sale': // Sale
        products.sort((a, b) => b.salePrice!.compareTo(a.salePrice!));
        break;

      default:
        products.sort((a, b) => a.title.compareTo(b.title));
        break;
    }
  }

  void assignProducts(List<ProductModel> products) {
    this.products.assignAll(products);
    sortProducts('Name');
  }
}
