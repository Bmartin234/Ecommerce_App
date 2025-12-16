import 'package:ecommerce_app/controllers/checkout_controller.dart';
import 'package:ecommerce_app/utils/app_textstyles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentMethodCard extends StatelessWidget {
  const PaymentMethodCard({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final checkoutController = Get.find<CheckoutController>();

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
      child: Column(
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.blue[50],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Obx(() => Image.asset(
                  checkoutController.paymentMethod.value == "COD"
                      ? 'assets/images/cash_on_delivery.png'
                      : 'assets/images/mastercard.png',
                  height: 24,
                  errorBuilder: (context, error, stackTrace) => const Icon(Icons.payment),
                )),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Obx(() => Text(
                      checkoutController.paymentMethod.value == "COD"
                          ? "Cash on Delivery"
                          : checkoutController.paymentDetail.value,
                      style: AppTextStyle.withColor(
                        AppTextStyle.h3,
                        Theme.of(context).textTheme.bodyLarge!.color!,
                      ),
                    )),
                    const SizedBox(height: 4),
                    Obx(() => Text(
                      checkoutController.paymentMethod.value == "COD"
                          ? "Pay when you receive"
                          : "Expires 12/24",
                      style: AppTextStyle.withColor(
                        AppTextStyle.h3,
                        isDark ? Colors.grey[400]! : Colors.grey[600]!,
                      ),
                    )),
                  ],
                ),
              ),
              IconButton(
                onPressed: () {
                  Get.defaultDialog(
                    title: "Select Payment",
                    content: Column(
                      children: [
                        ListTile(
                          leading: const Icon(Icons.money),
                          title: const Text("Cash on Delivery"),
                          onTap: () {
                            checkoutController.selectPaymentMethod("COD", "Pay when you receive");
                            Get.back();
                          },
                        ),
                        ListTile(
                          leading: const Icon(Icons.credit_card),
                          title: const Text("Mastercard"),
                          onTap: () {
                            checkoutController.selectPaymentMethod("Mastercard", "Visa ending 4242");
                            Get.back();
                          },
                        ),
                      ],
                    ),
                  );
                },
                icon: Icon(
                  Icons.edit_outlined,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}