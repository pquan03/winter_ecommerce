import 'package:get/get.dart';
import 'package:winter_store/features/shop/controllers/variation_controller.dart';
import 'package:winter_store/features/shop/models/cart_item_model.dart';
import 'package:winter_store/features/shop/models/product_model.dart';
import 'package:winter_store/utils/constants/colors.dart';
import 'package:winter_store/utils/loaders/loaders.dart';
import 'package:winter_store/utils/local_storage/storage_utility.dart';

class CartController extends GetxController {
  // Singleton
  static CartController get instance => Get.find();

  // Variables
  RxInt cartCount = 0.obs;
  RxInt cartTotalItems = 1.obs;
  RxDouble cartTotalPrice = 0.0.obs;
  RxList<CartItemModel> cartItems = <CartItemModel>[].obs;
  final variationController = VariationController.instance;

  @override
  void onInit() {
    loadCartItems();
    super.onInit();
  }

  void addToCart(ProductModel product) {
    // Quantity check
    if (cartTotalItems.value < 1) {
      WLoader.waringSnackbar(
          title: 'Oh snap!', message: 'Please select quantity');
      return;
    }

    // Variation check
    if (variationController.selectedVariation.value.id.isEmpty) {
      WLoader.waringSnackbar(
          title: 'Oh snap!', message: 'Please select variation');
      return;
    }

    // Check stock status
    if (product.productVariations == null) {
      if (product.stock < 1) {
        WLoader.waringSnackbar(
            title: 'Oh snap!', message: 'Product out of stock');
        return;
      }
    } else {
      final variation = variationController.selectedVariation.value;
      if (variation.stock! < 1) {
        WLoader.waringSnackbar(
            title: 'Oh snap!', message: 'Variation out of stock');
        return;
      }
    }

    final selectedCartItem = convertToCartItem(product, cartTotalItems.value);

    // Check if item already exists
    final index = cartItems.indexWhere((element) =>
        element.productId == selectedCartItem.productId &&
        element.variationId == selectedCartItem.variationId);

    if (index >= 0) {
      // Cart item already exists
      cartItems[index].quantity = selectedCartItem.quantity;
    } else {
      cartItems.add(selectedCartItem);
    }
    updateCart();
  }

  void updateCart() {
    updateCartTotal();
    saveCartItems();
    cartItems.refresh();
  }

  void updateCartTotal() {
    double totalPrice = 0.0;
    int totalItems = 0;

    for (final item in cartItems) {
      totalPrice += item.price * item.quantity;
      totalItems += item.quantity;
    }

    cartTotalPrice.value = totalPrice;
    cartTotalItems.value = totalItems;
  }

  void saveCartItems() {
    final cartJson = cartItems.map((e) => e.toJson()).toList();
    TLocalStorage.instance().saveData('cartItems', cartJson);
  }

  void loadCartItems() {
    final cartJson =
        TLocalStorage.instance().readData<List<dynamic>>('cartItems');
    if (cartJson != null) {
      cartItems.assignAll(
          cartJson.map((item) => CartItemModel.fromJson(item as dynamic)));
      updateCart();
    }
  }

  void addOneItemToCart(CartItemModel newItem) {
    // Check if item already exists
    final index = cartItems.indexWhere((element) =>
        element.productId == newItem.productId &&
        element.variationId == newItem.variationId);

    if (index >= 0) {
      cartItems[index].quantity += 1;
    } else {
      cartItems.add(newItem);
    }
    updateCart();
  }

  void removeOneItemFromCart(CartItemModel item) {
    // Check if item already exists
    final index = cartItems.indexWhere((element) =>
        element.productId == item.productId &&
        element.variationId == item.variationId);

    if (index >= 0) {
      if (cartItems[index].quantity > 1) {
        cartItems[index].quantity -= 1;
      } else {
        cartItems[index].quantity == 1
            ? removeCartDialog(index)
            : cartItems.removeAt(index);
      }
    }
    updateCart();
  }

  void removeCartDialog(int index) {
    Get.defaultDialog(
      title: 'Remove Item',
      middleText: 'Are you sure you want to remove this item?',
      textConfirm: 'Yes',
      textCancel: 'No',
      backgroundColor: TColors.white,
      confirmTextColor: Get.theme.primaryColor,
      onConfirm: () {
        cartItems.removeAt(index);
        updateCart();
        Get.back();
      },
      onCancel: () => Get.back(),
    );
  }

  void clearCart() {
    cartTotalItems.value = 1;
    cartItems.clear();
    updateCart();
  }

  // Convert ProductModel to CartItemModel
  CartItemModel convertToCartItem(ProductModel product, int quantity) {
    final variation = variationController.selectedVariation.value;
    final isVariation = variation.id.isNotEmpty;
    final price = isVariation
        ? variation.salePrice! > 0
            ? variation.salePrice
            : variation.price
        : product.salePrice! > 0
            ? product.salePrice
            : product.price;

    return CartItemModel(
        productId: product.id,
        title: product.title,
        price: price ?? 0.0,
        image: product.thumbnail,
        quantity: quantity,
        variationId: variation.id,
        brandName: product.brand == null ? '' : product.brand!.name,
        selectedVariation: isVariation ? variation.attributes : null);
  }
}
