// lib/models/cart_item.dart (সঠিক সংস্করণ)

import 'package:get/get.dart';
import 'product.dart'; // Products ক্লাসের ইমপোর্ট

// 🟢 সঠিক মডেল: quantity কে কনস্ট্রাক্টরের অংশ করুন
class CartItem {
  final Products product;
  final RxInt quantity; // quantity কে final RxInt হিসেবে ঘোষণা করুন

  // 🟢 কনস্ট্রাক্টরে quantity প্যারামিটারটি যোগ করুন
  CartItem({
    required this.product,
    required this.quantity, // এখন এটি একটি required named parameter
  });
}