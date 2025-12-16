import 'package:get/get.dart';
import '../models/product.dart'; // Ensure correct path to Products model
import '../models/cart_item.dart'; // Ensure correct path to CartItem model

class CartController extends GetxController {
  // 1. Reactive List to hold cart items (CartItem is defined below)
  final cartItems = <CartItem>[].obs;

  // 2. Reactive calculation for Total Price
  // .obs ensures that any widget wrapped in Obx/GetBuilder listening to this
  // will update automatically when cartItems change.
  RxDouble get totalPrice => cartItems.fold(
      0.0.obs,
          (sum, item) => (sum.value + (item.product.price * item.quantity.value)).obs
  );


  // ------------------------------------
  // --- CORE CART LOGIC ---
  // ------------------------------------

  // 1. Add Product to Cart
  void addToCart(Products product) {
    // Check if the product already exists in the cart by its ID
    var existingItem = cartItems.firstWhereOrNull(
          (item) => item.product.id == product.id,
    );

    if (existingItem != null) {
      // If product exists, just increase the quantity
      existingItem.quantity.value++;
      update(); // Optional: Forces GetBuilder/GetX to update immediately
    } else {
      // If product is new, create a new CartItem and add it to the list
      cartItems.add(
        CartItem(
          product: product,
          quantity: 1.obs, // Quantity starts at 1
        ),
      );
    }
  }

  // 2. Remove Item from Cart
  void removeItem(CartItem item) {
    cartItems.remove(item);
  }

  // 3. Increase Quantity
  void increaseQuantity(CartItem item) {
    item.quantity.value++;
    // No need to manually update cartItems list, only the item.quantity is reactive
  }

  // 4. Decrease Quantity
  void decreaseQuantity(CartItem item) {
    if (item.quantity.value > 1) {
      item.quantity.value--;
    } else {
      // If quantity is 1 and we decrease, remove the item entirely
      removeItem(item);
    }
  }

  // 5. Clear Cart (for checkout confirmation)
  void clearCart() {
    cartItems.clear();
  }
}