import 'package:get/get.dart';
import 'package:winter_store/features/shop/controllers/image_controller.dart';
import 'package:winter_store/features/shop/models/product_model.dart';
import 'package:winter_store/features/shop/models/product_variation_model.dart';

class VariationController extends GetxController {
  // Singleton
  static VariationController get instance => Get.find();

  // Variables
  RxMap selectedAttributes = {}.obs;
  RxString variationStockStatus = ''.obs;
  Rx<ProductVariationModel> selectedVariation =
      ProductVariationModel.empty().obs;

  // Select Attribute, and Variation
  void onAttributeSelected(
      ProductModel product, String attributeName, String attributeValue) {
    // Add selected attribute in first from product attributes
    final selectedAttributes =
        Map<String, dynamic>.from(this.selectedAttributes);
    selectedAttributes[attributeName] = attributeValue;
    this.selectedAttributes[attributeName] = attributeValue;

    // Check if selected attributes is same as variation attributes
    final selectedVariation = product.productVariations!.firstWhere(
        (variation) =>
            _isSameAttributesValue(variation.attributes, selectedAttributes),
        orElse: () => ProductVariationModel.empty());

    // Update image from Main Product Details
    if (selectedVariation.image != null) {
      ImagesController.instance.selectedProductImage.value =
          selectedVariation.image!;
    }

    // Assign selected variation
    this.selectedVariation.value = selectedVariation;
    getProductVariationStockStatus();
  }

  // Check if selectedAttributes is same as variation attributes
  bool _isSameAttributesValue(Map<String, dynamic> variationAttributes,
      Map<String, dynamic> selectedAttributes) {
    // If variation attributes length is not same as selected attributes length
    if (variationAttributes.length != selectedAttributes.length) return false;

    // Check all keys and values
    for (final key in variationAttributes.keys) {
      if (variationAttributes[key] != selectedAttributes[key]) return false;
    }

    return true;
  }

  // Get attrivute availability / Stock in variation
  Set<String?> getAttributeAvailabilityInVariation(
      List<ProductVariationModel> variations, String attributeName) {
    final availableVariationAttributesValue = variations
        .where((variation) =>
            variation.attributes[attributeName] != null &&
            variation.attributes[attributeName]!.isNotEmpty &&
            variation.stock! > 0)
        .map((variation) => variation.attributes[attributeName])
        .toSet();

    return availableVariationAttributesValue;
  }

  // Check Product Variation Stock Status
  void getProductVariationStockStatus() {
    variationStockStatus.value =
        selectedVariation.value.stock! > 0 ? 'In Stock' : 'Out of Stock';
  }

  // Reset all selected attributes
  void resetSelectedAttribute() {
    selectedAttributes.value = {};
    variationStockStatus.value = '';
    selectedVariation.value = ProductVariationModel.empty();
  }
}
