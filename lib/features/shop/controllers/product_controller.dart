import 'package:get/get.dart';
import 'package:winter_store/data/repositories/product/product_repository.dart';
import 'package:winter_store/features/shop/models/product_model.dart';
import 'package:winter_store/utils/constants/image_strings.dart';
import 'package:winter_store/utils/loaders/loaders.dart';
import 'package:winter_store/utils/popups/full_screen_loader.dart';

class ProductController extends GetxController {
  // Singleton
  static ProductController get instance => Get.find();

  // Variables
  final isLoading = false.obs;
  final _productRepository = Get.put(ProductRepository());
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
      final products = await _productRepository.getFeaturedProducts();
      // assign all products
      featuredProducts.assignAll(products);
    } catch (e) {
      WLoader.errorSnackBar(title: 'Oh snap!', message: e.toString());
    } finally {
      // Remove loading
      isLoading.value = false;
    }
  }

  // Push all data to firebase storage
  Future<void> uploadAllProducts() async {
    try {
      // Start loading
      WFullScreenLoader.openLoadingDialog(
          'Processing...', TImages.docerAnimation);

      // Push all products to firebase storage
      await _productRepository.pushAllProducts();

      // Show success message
      WLoader.successSnackBar(
          title: 'Success', message: 'All products uploaded successfully');
    } catch (e) {
      WLoader.errorSnackBar(title: 'Oh snap!', message: e.toString());
    } finally {
      // Remove loading
      WFullScreenLoader.stopLoading();
    }
  }
}
