import 'package:ecommerce_app/controllers/auth_controller.dart';
import 'package:ecommerce_app/features/signin_screen.dart';
import 'package:ecommerce_app/features/widgets/custom_textfield.dart';
import 'package:ecommerce_app/utils/app_textstyles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () => Get.back(),
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: isDark ? Colors.white : Colors.black,
                ),
              ),

              const SizedBox(height: 20),

              Text(
                'Create Account',
                style: AppTextStyle.withColor(
                  AppTextStyle.h1,
                  Theme.of(context).textTheme.bodyLarge!.color!,
                ),
              ),
              const SizedBox(height: 8),

              Text(
                'Signup to get started',
                style: AppTextStyle.withColor(
                  AppTextStyle.bodyLarge,
                  isDark ? Colors.grey[400]! : Colors.grey[600]!,
                ),
              ),

              const SizedBox(height: 40),

              CustomTextfield(
                label: 'Full Name',
                prefixIcon: Icons.person_outline,
                keyboardType: TextInputType.name,
                controller: _nameController,
              ),
              const SizedBox(height: 16),

              CustomTextfield(
                label: 'E-mail',
                prefixIcon: Icons.email_outlined,
                keyboardType: TextInputType.emailAddress,
                controller: _emailController,
              ),
              const SizedBox(height: 16),

              CustomTextfield(
                label: 'Password',
                prefixIcon: Icons.lock_outline,
                isPassword: true,
                controller: _passwordController,
              ),
              const SizedBox(height: 16),

              CustomTextfield(
                label: 'Confirm Password',
                prefixIcon: Icons.lock_outline,
                isPassword: true,
                controller: _confirmPasswordController,
              ),

              const SizedBox(height: 24),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _handleSignUp, // FIXED
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    'Sign Up',
                    style: AppTextStyle.withColor(
                      AppTextStyle.buttonMedium,
                      Colors.black,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 24),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account?',
                    style: AppTextStyle.withColor(
                      AppTextStyle.bodyMedium,
                      isDark ? Colors.grey[400]! : Colors.grey[600]!,
                    ),
                  ),
                  TextButton(
                    onPressed: () => Get.off(() => SigninScreen()),
                    child: Text(
                      'Sign In',
                      style: AppTextStyle.withColor(
                        AppTextStyle.buttonMedium,
                        Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // FIXED SIGN UP METHOD
  Future<void> _handleSignUp() async {
    final name = _nameController.text.trim();
    final email = _emailController.text.trim();
    final pass = _passwordController.text.trim();
    final confirm = _confirmPasswordController.text.trim();

    // VALIDATIONS
    if (name.isEmpty) {
      _error("Please enter your name");
      return;
    }

    if (email.isEmpty) {
      _error("Please enter your email");
      return;
    }

    if (!GetUtils.isEmail(email)) {
      _error("Invalid email format");
      return;
    }

    if (pass.length < 6) {
      _error("Password must be at least 6 characters");
      return;
    }

    if (pass != confirm) {
      _error("Passwords do not match");
      return;
    }

    // Ensure AuthController is initialized/found
    AuthController auth;
    try {
      auth = Get.find<AuthController>();
    } catch (e) {
      // If controller is not initialized, you might need to call Get.put()
      // or ensure it's initialized somewhere (e.g., in main.dart)
      // For simplicity, we assume Get.find() works or we initialize it.
      // Get.lazyPut<AuthController>(() => AuthController()); // Uncomment if needed
      auth = Get.put<AuthController>(AuthController());
    }


    Get.dialog(
      const Center(child: CircularProgressIndicator()),
      barrierDismissible: false,
    );

    try {
      final result = await auth.signUp(
        email: email,
        password: pass,
        name: name,
      );

      Get.back(); // Close loading dialog

      if (result.success) {
        // Navigate to SigninScreen after successful registration
        Get.offAll(() => SigninScreen());
        Get.snackbar(
          'Success',
          result.message ?? "Account created successfully",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
      } else {
        _error(result.message ?? "Signup failed");
      }
    } catch (e) {
      Get.back(); // Close loading dialog
      _error("Unexpected error occurred: $e");
    }
  }

  void _error(String msg) {
    Get.snackbar(
      'Error',
      msg,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.red,
      colorText: Colors.white,
    );
  }
}
