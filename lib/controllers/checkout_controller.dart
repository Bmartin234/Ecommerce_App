import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CheckoutController extends GetxController {
  var address = "123 Main Street, Apt 48, New York, NY 10001".obs;
  var addressTitle = "Home".obs;
  var paymentMethod = "Mastercard".obs;
  var paymentDetail = "Visa ending in 4242".obs;
  var isProcessing = false.obs;

  void updateAddress(String title, String newAddress) {
    addressTitle.value = title;
    address.value = newAddress;
  }

  void selectPaymentMethod(String method, String detail) {
    paymentMethod.value = method;
    paymentDetail.value = detail;
  }

  Future<bool> placeOrder({
    required List items,
    required double subtotal,
    required double totalAmount,
  }) async {
    isProcessing.value = true;

    const String apiUrl = "http://localhost:5000/api/orders";

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "orderId": "ORD${DateTime.now().millisecondsSinceEpoch}",
          "customer": {
            "name": "Guest User",
            "phone": "01700000000",
            "area": addressTitle.value,
            "city": "Dhaka",
            "postalCode": "1200",
            "notes": address.value
          },
          "items": items,
          "subtotal": subtotal,
          "deliveryFee": 10.0,
          "discount": 0.0,
          "total": totalAmount,
        }),
      );

      if (response.statusCode == 201) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    } finally {
      isProcessing.value = false;
    }
  }
}