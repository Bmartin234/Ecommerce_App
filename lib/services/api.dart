import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  // Local Compass URI use করতে হলে MongoDB Atlas বা Realm API ব্যবহার করো
  final String baseUrl = "YOUR_API_ENDPOINT";

  Future<List<dynamic>> getProducts() async {
    final response = await http.get(Uri.parse("$baseUrl/products"));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception("Failed to load products");
    }
  }
}
