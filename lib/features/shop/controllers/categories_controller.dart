import 'package:get/get.dart';
import 'package:winter_store/data/repositories/categories/categories_repository.dart';
import 'package:winter_store/features/shop/models/cagegory_model.dart';
import 'package:winter_store/utils/constants/image_strings.dart';
import 'package:winter_store/utils/loaders/loaders.dart';
import 'package:winter_store/utils/popups/full_screen_loader.dart';

class CategoriesController extends GetxController {
  // Singleton
  static CategoriesController get instance => Get.find();

  // Variables
  final _categoriesRepository = Get.put(CategoriesRepository());
  RxList<CategoryModel> categories = <CategoryModel>[].obs;
  RxList<CategoryModel> featuredCategories = <CategoryModel>[].obs;
  final isLoading = false.obs;

  @override
  void onInit() {
    fetchAllCategories();
    super.onInit();
  }

  // Fetch all categories
  Future<void> fetchAllCategories() async {
    try {
      // Show loader
      isLoading.value = true;
      // Fetch all categories from API
      final categories = await _categoriesRepository.getAllCategories();
      // update categories variable
      this.categories.assignAll(categories);

      // Filter featured categories
      featuredCategories.assignAll(categories
          .where((element) => element.isFeatured && element.parentID.isEmpty)
          .take(8)
          .toList());
    } catch (e) {
      WLoader.errorSnackBar(title: 'Oh snap!', message: e.toString());
    } finally {
      // Hide loader
      isLoading.value = false;
    }
  }

  // Push all data to firebase storage
  Future<void> uploadAllCategories() async {
    try {
      // Start loading
      WFullScreenLoader.openLoadingDialog(
          'Processing...', TImages.docerAnimation);

      // Push all categories to firebase storage
      await _categoriesRepository.pushAllCategories();

      // Show success message
      WLoader.successSnackBar(
          title: 'Success', message: 'All categories uploaded successfully');
    } catch (e) {
      WLoader.errorSnackBar(title: 'Oh snap!', message: e.toString());
    } finally {
      // Stop loading
      WFullScreenLoader.stopLoading();
    }
  }
}
