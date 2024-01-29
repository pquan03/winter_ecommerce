import 'package:get/get.dart';
import 'package:winter_store/data/repositories/banners/banners_repository.dart';
import 'package:winter_store/features/shop/models/banner_model.dart';
import 'package:winter_store/utils/loaders/loaders.dart';

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
}
