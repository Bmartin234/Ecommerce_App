import 'package:ecommerce_app/controllers/checkout_controller.dart';
import 'package:ecommerce_app/utils/app_textstyles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressCard extends StatelessWidget {
  const AddressCard({super.key});

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
      child: Row(
        children: [
          Icon(
            Icons.location_on_outlined,
            color: Theme.of(context).primaryColor,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Obx(() => Text(
                  checkoutController.addressTitle.value,
                  style: AppTextStyle.withColor(
                    AppTextStyle.bodyLarge,
                    Theme.of(context).textTheme.bodyLarge!.color!,
                  ),
                )),
                const SizedBox(height: 4),
                Obx(() => Text(
                  checkoutController.address.value,
                  style: AppTextStyle.withColor(
                    AppTextStyle.bodySmall,
                    isDark ? Colors.grey[400]! : Colors.grey[600]!,
                  ),
                )),
              ],
            ),
          ),
          IconButton(
            onPressed: () {
              _showEditAddressDialog(context, checkoutController);
            },
            icon: Icon(
              Icons.edit_outlined,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ],
      ),
    );
  }

  void _showEditAddressDialog(BuildContext context, CheckoutController controller) {
    final titleController = TextEditingController(text: controller.addressTitle.value);
    final addressController = TextEditingController(text: controller.address.value);

    Get.defaultDialog(
      title: "Edit Address",
      content: Column(
        children: [
          TextField(
            controller: titleController,
            decoration: const InputDecoration(labelText: "Address Title (e.g. Home)"),
          ),
          TextField(
            controller: addressController,
            decoration: const InputDecoration(labelText: "Full Address"),
          ),
        ],
      ),
      confirm: ElevatedButton(
        onPressed: () {
          controller.updateAddress(titleController.text, addressController.text);
          Get.back();
        },
        child: const Text("Save"),
      ),
      cancel: OutlinedButton(
        onPressed: () => Get.back(),
        child: const Text("Cancel"),
      ),
    );
  }
}