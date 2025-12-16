import 'package:flutter/material.dart';
import '../../model/order.dart';
//import '../model/order.dart';
import '../../../../utils/app_textstyles.dart';

class OrderDetailsScreen extends StatelessWidget {
  final Order order;
  const OrderDetailsScreen({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Track Order', style: AppTextStyle.h3),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Order Number: #${order.orderNumber}', style: AppTextStyle.h3),
            const SizedBox(height: 20),
            Stepper(
              physics: const NeverScrollableScrollPhysics(),
              currentStep: order.currentStep,
              controlsBuilder: (context, details) => const SizedBox.shrink(),
              steps: [
                Step(
                  title: const Text('Order Placed'),
                  content: Text('Date: ${order.orderDate.toString().split(' ')[0]}'),
                  isActive: true,
                  state: StepState.complete,
                ),
                Step(
                  title: const Text('Processing'),
                  content: const Text('Your order is being prepared.'),
                  isActive: order.status != OrderStatus.cancelled,
                  state: order.status == OrderStatus.active ? StepState.editing : StepState.complete,
                ),
                Step(
                  title: const Text('Delivered'),
                  content: const Text('Order has been delivered.'),
                  isActive: order.status == OrderStatus.completed,
                  state: order.status == OrderStatus.completed ? StepState.complete : StepState.indexed,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}