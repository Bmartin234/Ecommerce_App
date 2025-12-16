class RegistrationResult {
  final bool success;
  final String? message;

  RegistrationResult({required this.success, this.message});

  factory RegistrationResult.fromJson(Map<String, dynamic> json) {
    // API রেসপন্স অনুযায়ী এই লজিক পরিবর্তন হতে পারে।
    // ধরে নিচ্ছি যদি 'success' true হয়, তবে সফল।
    return RegistrationResult(
      success: json['success'] ?? false,
      message: json['message'] ?? (json['success'] ? 'Registration Successful' : 'Registration Failed'),
    );
  }
}