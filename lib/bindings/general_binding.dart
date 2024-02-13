import 'package:get/get.dart';
import 'package:winter_store/features/shop/controllers/variation_controller.dart';
import 'package:winter_store/utils/helpers/network_manager.dart';

class GeneralBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(NetworkManager());
    Get.put(VariationController());
  }
}
