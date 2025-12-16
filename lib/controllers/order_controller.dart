import 'package:get/get.dart';
import '../features/my orders/model/order.dart';
import '../features/my orders/repository/order_repository.dart';

class OrderController extends GetxController {
  var orders = <Order>[].obs;
  // ডাটা লোড হচ্ছে কি না তা বোঝার জন্য একটি ভেরিয়েবল
  var isLoading = true.obs;
  final OrderRepository _repository = OrderRepository();

  @override
  void onInit() {
    super.onInit();
    loadOrders();
  }

  // এখানে async যুক্ত করা হয়েছে যাতে ডাটার জন্য অপেক্ষা করা যায়
  void loadOrders() async {
    try {
      isLoading(true);
      // await ব্যবহার করা হয়েছে যাতে Future শেষ হওয়া পর্যন্ত অপেক্ষা করে
      var data = await _repository.getOrders();
      orders.assignAll(data);
    } catch (e) {
      print("Error loading orders: $e");
    } finally {
      isLoading(false);
    }
  }

  void placeNewOrder(Order newOrder) {
    orders.insert(0, newOrder);
  }

  List<Order> getOrdersByStatus(OrderStatus status) {
    return orders.where((order) => order.status == status).toList();
  }
}