import 'package:get/get.dart';
import 'package:winter_store/data/repositories/banners/banners_repository.dart';
import 'package:winter_store/features/shop/models/banner_model.dart';
import 'package:winter_store/utils/constants/image_strings.dart';
import 'package:winter_store/utils/loaders/loaders.dart';
import 'package:winter_store/utils/popups/full_screen_loader.dart';

class BannerController extends GetxController {
  // Singleton
  static BannerController get instance => Get.find();

  // Variables
  final isLoading = false.obs;
  final carouselCurrentIndex = 0.obs;
  RxList<BannerModel> banners = <BannerModel>[].obs;

  @override
  void onInit() {
    fetchBanners();
    super.onInit();
  }

  void updatePageIndicator(index) {
    carouselCurrentIndex.value = index;
  }

  Future<void> fetchBanners() async {
    try {
      // Show loading
      isLoading.value = true;
      // Fetch banners from API
      final bannerRepository = Get.put(BannerRepository());
      final banners = await bannerRepository.getBanners();
      // Update banners variable
      this.banners.assignAll(banners);
    } catch (e) {
      WLoader.errorSnackBar(title: 'Oh snap!', message: e.toString());
    } finally {
      // Remove loading
      isLoading.value = false;
    }
  }

  // Push all data to firebase storage
  Future<void> uploadAllBanners() async {
    try {
      // Start loading
      WFullScreenLoader.openLoadingDialog(
          'Processing...', TImages.docerAnimation);

      // Push all banners to firebase storage
      final bannerRepository = Get.put(BannerRepository());
      await bannerRepository.pushAllBanners();

      // Show success message
      WLoader.successSnackBar(
          title: 'Success', message: 'All banners uploaded successfully');
    } catch (e) {
      WLoader.errorSnackBar(title: 'Oh snap!', message: e.toString());
    } finally {
      // Hide loading
      WFullScreenLoader.stopLoading();
    }
  }
}
