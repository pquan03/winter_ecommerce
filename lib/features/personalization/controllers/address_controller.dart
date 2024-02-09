import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:winter_store/data/repositories/address/address_repository.dart';
import 'package:winter_store/features/personalization/models/address_model.dart';
import 'package:winter_store/utils/constants/image_strings.dart';
import 'package:winter_store/utils/helpers/network_manager.dart';
import 'package:winter_store/utils/loaders/loaders.dart';
import 'package:winter_store/utils/popups/full_screen_loader.dart';

class AddressController extends GetxController {
  // Singleton
  static AddressController get instance => Get.find();

  // Variables
  final addressRepostory = Get.put(AddressRepository());
  final Rx<AddressModel> defaultAddress = AddressModel.empty().obs;
  RxBool isRefreshData = true.obs;
  // --- FORM
  final name = TextEditingController();
  final phoneNum = TextEditingController();
  final street = TextEditingController();
  final city = TextEditingController();
  final state = TextEditingController();
  final country = TextEditingController();
  final postalCode = TextEditingController();
  GlobalKey<FormState> addressFormKey = GlobalKey<FormState>();

  Future<List<AddressModel>> getAllUserAddress() async {
    try {
      final addresses = await addressRepostory.fetchAllUserAddress();
      defaultAddress.value = addresses.firstWhere(
          (element) => element.isDefault,
          orElse: () => AddressModel.empty());
      return addresses;
    } catch (e) {
      WLoader.errorSnackBar(title: 'Oh snap!', message: e.toString());
      return [];
    }
  }

  Future<void> setDefaultAddress(AddressModel newDefaultAddress) async {
    try {
      // Not selected old default address
      if (defaultAddress.value.id.isNotEmpty) {
        await addressRepostory.updateSelectedField(
            defaultAddress.value.id, false);
      }

      // Assign new default address
      newDefaultAddress.isDefault = true;
      defaultAddress.value = newDefaultAddress;

      // Update in database
      await addressRepostory.updateSelectedField(defaultAddress.value.id, true);
    } catch (e) {
      WLoader.errorSnackBar(title: 'Oh snap!', message: e.toString());
    }
  }

  Future<void> addNewAddress() async {
    try {
      // Start loader
      WFullScreenLoader.openLoadingDialog(
          'Processing store address...', TImages.docerAnimation);

      // Check Internet is available
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        WFullScreenLoader.stopLoading();
        WLoader.errorSnackBar(
            title: 'No Internet Connection',
            message: 'Please check your internet connection and try again');
        return;
      }

      // Check form validation
      if (!addressFormKey.currentState!.validate()) {
        WFullScreenLoader.stopLoading();
        return;
      }

      // Save to database
      final newAddress = AddressModel(
        id: '',
        name: name.text,
        phoneNumber: phoneNum.text,
        street: street.text,
        city: city.text,
        state: state.text,
        postalCode: postalCode.text,
        country: country.text,
        isDefault: false,
      );

      await addressRepostory.addNewAddress(newAddress);

      // Get all addresses again
      isRefreshData.toggle();

      // Show alert
      WLoader.successSnackBar(
          title: 'Address added successfully',
          message: 'Your address has been added successfully');

      // Reset form fields
      resetFormFields();

      // Go back
      Navigator.of(Get.context!).pop();
    } catch (e) {
      WLoader.errorSnackBar(title: 'Oh snap!', message: e.toString());
    } finally {
      // Stop loader
      WFullScreenLoader.stopLoading();
    }
  }

  void resetFormFields() {
    name.clear();
    phoneNum.clear();
    street.clear();
    city.clear();
    state.clear();
    postalCode.clear();
    country.clear();
  }
}
