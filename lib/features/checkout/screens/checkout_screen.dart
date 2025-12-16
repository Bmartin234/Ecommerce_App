import 'package:ecommerce_app/controllers/checkout_controller.dart';
import 'package:ecommerce_app/controllers/cart_controller.dart';
import 'package:ecommerce_app/features/checkout/widgets/address_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/app_textstyles.dart';
import '../../order confirmation/screens/order_confirmation_screen.dart';
import '../widgets/checkout_bottom_bar.dart';
import '../widgets/order_summary_card.dart';
import '../widgets/payment_method_card.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final checkoutController = Get.put(CheckoutController());
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final cartController = Get.find<CartController>();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(
            Icons.arrow_back_ios,
            color: isDark ? Colors.white : Colors.black,
          ),
        ),
        title: Text(
          'Checkout',
          style: AppTextStyle.withColor(
            AppTextStyle.h3,
            isDark ? Colors.white : Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle(context, 'Shipping Address'),
            const SizedBox(height: 16),
            const AddressCard(),
            const SizedBox(height: 24),
            _buildSectionTitle(context, 'Payment Method'),
            const SizedBox(height: 16),
            const PaymentMethodCard(),
            const SizedBox(height: 24),
            _buildSectionTitle(context, 'Order Summary'),
            const SizedBox(height: 16),
            const OrderSummaryCard(),
          ],
        ),
      ),
      bottomNavigationBar: Obx(() {
        final double subtotal = cartController.totalPrice.value;
        final double shipping = 10.00;
        final double tax = subtotal * 0.05;
        final double totalAmount = subtotal + shipping + tax;

        return CheckoutBottomBar(
          totalAmount: totalAmount,
          onPlaceOrder: checkoutController.isProcessing.value
              ? () {}
              : () async {
            bool success = await checkoutController.placeOrder(
              subtotal: subtotal,
              items: cartController.cartItems
                  .map((item) => {
                "productName": item.product.name,
                "price": item.product.price,
                "quantity": item.quantity.value,
              })
                  .toList(),
              totalAmount: totalAmount,
            );

            if (success) {
              final orderNumber =
                  'ORD${DateTime.now().millisecondsSinceEpoch.toString().substring(7)}';
              cartController.clearCart();
              Get.to(() => OrderConfirmationScreen(
                orderNumber: orderNumber,
                totalAmount: totalAmount,
              ));
            } else {
              Get.snackbar(
                "Order Failed",
                "Please check your server connection",
                backgroundColor: Colors.red,
                colorText: Colors.white,
              );
            }
          },
        );
      }),
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Text(
      title,
      style: AppTextStyle.withColor(
        AppTextStyle.h3,
        Theme.of(context).textTheme.bodyLarge!.color!,
      ),
    );
  }
}