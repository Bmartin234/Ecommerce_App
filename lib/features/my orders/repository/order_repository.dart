import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/order.dart';

class OrderRepository {
  // আপনার পিসি বা সার্ভারের আইপি এখানে দিন
  final String baseUrl = "http://localhost:5000/api/orders";

  // সব অর্ডার নিয়ে আসার ফাংশন
  Future<List<Order>> getOrders() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/admin/all'));

      if (response.statusCode == 200) {
        List<dynamic> data = jsonDecode(response.body);
        return data.map((json) => Order(
          orderNumber: json['orderId'],
          itemCount: json['items'].length,
          totalAmount: double.parse(json['total'].toString()),
          status: _mapStatus(json['status']),
          imageUrl: 'assets/images/laptop.jpg',
          orderDate: DateTime.parse(json['createdAt']),
        )).toList();
      }
      return [];
    } catch (e) {
      print("Error: $e");
      return [];
    }
  }

  // স্ট্যাটাস ম্যাপিং লজিক
  OrderStatus _mapStatus(String status) {
    switch (status) {
      case 'Delivered': return OrderStatus.completed;
      case 'Cancelled': return OrderStatus.cancelled;
      default: return OrderStatus.active; // Pending, Processing, Shipped এর জন্য
    }
  }
}