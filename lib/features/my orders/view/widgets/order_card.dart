import 'package:flutter/material.dart';
import 'package:ecommerce_app/features/my%20orders/model/order.dart';
import 'package:get/get.dart';
import '../../../../utils/app_textstyles.dart';
import '../screens/order_details_screen.dart';

class OrderCard extends StatelessWidget {
  final Order order;
  final VoidCallback onViewDetails;

  const OrderCard({
    super.key,
    required this.order,
    required this.onViewDetails,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: isDark ? Colors.black.withOpacity(0.2) : Colors.grey.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Image.asset(order.imageUrl, width: 80, height: 80, fit: BoxFit.cover),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Order #${order.orderNumber}', style: AppTextStyle.h3),
                      Text('\$${order.totalAmount.toStringAsFixed(2)}', style: AppTextStyle.bodyMedium),
                      _buildStatusChip(context, order.statusString),
                    ],
                  ),
                ),
              ],
            ),
          ),
          InkWell(
            onTap: () => Get.to(() => OrderDetailsScreen(order: order)),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Text('View Details', style: TextStyle(color: Theme.of(context).primaryColor)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatusChip(BuildContext context, String type) {
    Color color = type == 'active' ? Colors.blue : (type == 'completed' ? Colors.green : Colors.red);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(color: color.withOpacity(0.1), borderRadius: BorderRadius.circular(20)),
      child: Text(type.capitalize!, style: TextStyle(color: color, fontSize: 12)),
    );
  }
}