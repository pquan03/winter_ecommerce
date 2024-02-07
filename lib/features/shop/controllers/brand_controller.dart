import 'package:get/get.dart';
import 'package:winter_store/data/repositories/brands/brand_repository.dart';
import 'package:winter_store/features/shop/models/brand_model.dart';
import 'package:winter_store/features/shop/models/product_model.dart';
import 'package:winter_store/utils/constants/image_strings.dart';
import 'package:winter_store/utils/loaders/loaders.dart';
import 'package:winter_store/utils/popups/full_screen_loader.dart';

class BrandController extends GetxController {
  static BrandController get instance => Get.find();

  // Variables
  RxBool isLoading = false.obs;
  RxList<BrandModel> featuredBrands = <BrandModel>[].obs;
  RxList<BrandModel> allBrands = <BrandModel>[].obs;
  final brandRepository = Get.put(BrandRepository());

  @override
  void onInit() {
    getFeaturedBrand();
    super.onInit();
  }

  // Load brands
  Future<void> getFeaturedBrand() async {
    try {
      // Start loading
      isLoading.value = true;

      // Fetch brands from API & assign to all brands
      final result = await brandRepository.fetchAllBrands();
      allBrands.assignAll(result);
      // Assign featured brands
      featuredBrands
          .assignAll(result.where((element) => element.isFeatured).take(4));
    } catch (e) {
      WLoader.errorSnackBar(title: 'Oh snap!', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  // Push all data to firebase storage
  Future<void> uploadAllBrands() async {
    try {
      // Start loading
      WFullScreenLoader.openLoadingDialog(
          'Processing...', TImages.docerAnimation);

      // Push all banners to firebase storage

      await brandRepository.pushAllBanners();

      // Show success message
      WLoader.successSnackBar(
          title: 'Success', message: 'All brands uploaded successfully');
    } catch (e) {
      WLoader.errorSnackBar(title: 'Oh snap!', message: e.toString());
    } finally {
      // Hide loading
      WFullScreenLoader.stopLoading();
    }
  }

  // Push all brand category relationship to firebase storage
  Future<void> pushAllBrandCategory() async {
    try {
      // Start loading
      WFullScreenLoader.openLoadingDialog(
          'Processing...', TImages.docerAnimation);

      // Push all brand category relationship to firebase storage
      await brandRepository.pushAllBrandCategory();

      // Show success message
      WLoader.successSnackBar(
          title: 'Success',
          message: 'All brand category relationship uploaded successfully');
    } catch (e) {
      WLoader.errorSnackBar(title: 'Oh snap!', message: e.toString());
    } finally {
      // Hide loading
      WFullScreenLoader.stopLoading();
    }
  }

  // Get brand specific products from API
  Future<List<ProductModel>> getBrandProducts(
      {required String brandId, int limit = -1}) async {
    try {
      final products = await brandRepository.getProductsForBrand(
          brandId: brandId, limit: limit);
      return products;
    } catch (e) {
      WLoader.errorSnackBar(title: 'Oh snap!', message: e.toString());
      return [];
    }
  }

  // Get brands by categoryId
  Future<List<BrandModel>> getBrandsByCategoryId(String categoryId) async {
    try {
      final brands = await brandRepository.getBrandsByCategoryId(categoryId);
      return brands;
    } catch (e) {
      WLoader.errorSnackBar(title: 'Oh snap!', message: e.toString());
      return [];
    }
  }
}
