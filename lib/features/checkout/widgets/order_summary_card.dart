import 'package:ecommerce_app/controllers/cart_controller.dart';
import 'package:ecommerce_app/utils/app_textstyles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderSummaryCard extends StatelessWidget {
  const OrderSummaryCard({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final cartController = Get.find<CartController>();

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: isDark
                ? Colors.black.withOpacity(0.2)
                : Colors.grey.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Obx(() {
        final  subtotal = cartController.totalPrice;
        final double shipping = 10.00;
        final double tax = subtotal * 0.05;
        final  total = subtotal + shipping + tax;

        return Column(
          children: [
            _buildSummaryRow(
              context,
              'Subtotal',
              '\$${subtotal.toStringAsFixed(2)}',
            ),
            const SizedBox(height: 8),
            _buildSummaryRow(
              context,
              'Shipping',
              '\$${shipping.toStringAsFixed(2)}',
            ),
            const SizedBox(height: 8),
            _buildSummaryRow(
              context,
              'Tax (5%)',
              '\$${tax.toStringAsFixed(2)}',
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 12),
              child: Divider(),
            ),
            _buildSummaryRow(
              context,
              'Total',
              '\$${total.toStringAsFixed(2)}',
              isTotal: true,
            ),
          ],
        );
      }),
    );
  }

  Widget _buildSummaryRow(BuildContext context, String label, String value,
      {bool isTotal = false}) {
    final textStyle = isTotal ? AppTextStyle.h3 : AppTextStyle.bodyLarge;
    final color = isTotal
        ? Theme.of(context).primaryColor
        : Theme.of(context).textTheme.bodyLarge!.color!;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: AppTextStyle.withColor(textStyle, color),
        ),
        Text(
          value,
          style: AppTextStyle.withColor(textStyle, color),
        ),
      ],
    );
  }
}