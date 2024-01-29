import 'package:get/get.dart';
import 'package:winter_store/data/repositories/product/product_repository.dart';
import 'package:winter_store/features/shop/models/product_model.dart';
import 'package:winter_store/utils/loaders/loaders.dart';

class ProductController extends GetxController {
  // Singleton
  static ProductController get instance => Get.find();

  // Variables
  final isLoading = false.obs;
  final productRepository = Get.put(ProductRepository());
  RxList<ProductModel> featuredProducts = <ProductModel>[].obs;

  @override
  void onInit() {
    fetchFeaturedProducts();
    super.onInit();
  }

  void fetchFeaturedProducts() async {
    try {
      // Start loading
      isLoading.value = true;

      // Fetch products from API
      final products = await productRepository.getFeaturedProducts();
      // assign all products
      featuredProducts.assignAll(products);
    } catch (e) {
      WLoader.errorSnackBar(title: 'Oh snap!', message: e.toString());
    } finally {
      // Remove loading
      isLoading.value = false;
    }
  }
}
