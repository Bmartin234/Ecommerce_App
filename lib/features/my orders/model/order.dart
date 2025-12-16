enum OrderStatus { active, completed, cancelled }

class Order {
  final String orderNumber;
  final int itemCount;
  final double totalAmount;
  final OrderStatus status;
  final String imageUrl;
  final DateTime orderDate;

  Order({
    required this.orderNumber,
    required this.itemCount,
    required this.totalAmount,
    required this.status,
    required this.imageUrl,
    required this.orderDate,
  });

  String get statusString => status.name;

  int get currentStep {
    switch (status) {
      case OrderStatus.active:
        return 1;
      case OrderStatus.completed:
        return 2;
      default:
        return 0;
    }
  }
}








































// enum OrderStatus { active, completed, cancelled}
//
// class Order {
//   final String orderNumber;
//   final int itemCount;
//   final double totalAmount;
//   final OrderStatus status;
//   final String imageUrl;
//   final DateTime orderDate;
//
//   Order({
//     required this.orderNumber,
//     required this.itemCount,
//     required this.totalAmount,
//     required this.status,
//     required this.imageUrl,
//     required this.orderDate,
//   });
//
//   String get statusString => status.name;
//
// }