// import 'package:ecommerce_app/controllers/auth_controller.dart';
// import 'package:ecommerce_app/features/sign_up_screen.dart';
// import 'package:ecommerce_app/features/widgets/custom_textfield.dart';
// import 'package:ecommerce_app/utils/app_textstyles.dart';
// import 'package:ecommerce_app/features/main_screen.dart';
// import 'package:ecommerce_app/features/forgot_password_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// class SigninScreen extends StatelessWidget {
//   SigninScreen({super.key});
//
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     final isDark = Theme.of(context).brightness == Brightness.dark;
//
//     return Scaffold(
//       body: SafeArea(
//         child: SingleChildScrollView(
//           padding: const EdgeInsets.all(24),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const SizedBox(height: 40),
//               Text(
//                 'Welcome Back!',
//                 style: AppTextStyle.withColor(
//                   AppTextStyle.h1,
//                   Theme.of(context).textTheme.bodyLarge!.color!,
//                 ),
//               ),
//               const SizedBox(height: 8),
//               Text(
//                 'Sign in to continue shopping',
//                 style: AppTextStyle.withColor(
//                   AppTextStyle.bodyLarge,
//                   isDark ? Colors.grey[400]! : Colors.grey[600]!,
//                 ),
//               ),
//               const SizedBox(height: 40),
//
//               // Email TextField
//               CustomTextfield(
//                 label: 'Email',
//                 prefixIcon: Icons.email_outlined,
//                 keyboardType: TextInputType.emailAddress,
//                 controller: _emailController,
//               ),
//               const SizedBox(height: 16),
//
//               // Password TextField
//               CustomTextfield(
//                 label: 'Password',
//                 prefixIcon: Icons.lock_outline,
//                 keyboardType: TextInputType.visiblePassword,
//                 isPassword: true,
//                 controller: _passwordController,
//               ),
//               const SizedBox(height: 8),
//
//               // Forgot Password
//               Align(
//                 alignment: Alignment.centerRight,
//                 child: TextButton(
//                   onPressed: () => Get.to(() => ForgotPasswordScreen()),
//                   child: Text(
//                     'Forgot Password?',
//                     style: AppTextStyle.withColor(
//                       AppTextStyle.buttonMedium,
//                       Theme.of(context).primaryColor,
//                     ),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 24),
//
//               // Sign In Button
//               SizedBox(
//                 width: double.infinity,
//                 child: ElevatedButton(
//                   onPressed: _handleSignIn,
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Theme.of(context).primaryColor,
//                     padding: const EdgeInsets.symmetric(vertical: 16),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                   ),
//                   child: Text(
//                     'Sign In',
//                     style: AppTextStyle.withColor(
//                       AppTextStyle.buttonMedium,
//                       Colors.white,
//                     ),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 24),
//
//               // Sign Up TextButton
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     "Don't have an account?",
//                     style: AppTextStyle.withColor(
//                       AppTextStyle.bodyMedium,
//                       isDark ? Colors.grey[400]! : Colors.grey[600]!,
//                     ),
//                   ),
//                   TextButton(
//                     onPressed: () => Get.to(() => SignUpScreen()),
//                     child: Text(
//                       'Sign Up',
//                       style: AppTextStyle.withColor(
//                         AppTextStyle.buttonMedium,
//                         Theme.of(context).primaryColor,
//                       ),
//                     ),
//                   )
//                 ],
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   // Sign In Function
//   void _handleSignIn() async {
//     final email = _emailController.text.trim();
//     final password = _passwordController.text.trim();
//
//     // Validation
//     if (email.isEmpty) {
//       Get.snackbar(
//         'Error',
//         'Please enter your email',
//         snackPosition: SnackPosition.BOTTOM,
//         backgroundColor: Colors.red,
//         colorText: Colors.white,
//       );
//       return;
//     }
//
//     if (password.isEmpty) {
//       Get.snackbar(
//         'Error',
//         'Please enter your password',
//         snackPosition: SnackPosition.BOTTOM,
//         backgroundColor: Colors.red,
//         colorText: Colors.white,
//       );
//       return;
//     }
//
//     if (!GetUtils.isEmail(email)) {
//       Get.snackbar(
//         'Error',
//         'Please enter a valid email',
//         snackPosition: SnackPosition.BOTTOM,
//         backgroundColor: Colors.red,
//         colorText: Colors.white,
//       );
//       return;
//     }
//
//     final authController = Get.find<AuthController>();
//
//     // Show loading
//     Get.dialog(
//       const Center(child: CircularProgressIndicator()),
//       barrierDismissible: false,
//     );
//
//     try {
//       final result = await authController.signIn(email: email, password: password);
//
//       // Close loading
//       Get.back();
//
//       if (result.success) {
//         // Navigate to MainScreen
//         Get.offAll(() => MainScreen());
//         Get.snackbar(
//           'Success',
//           result.message,
//           snackPosition: SnackPosition.BOTTOM,
//           backgroundColor: Colors.green,
//           colorText: Colors.white,
//         );
//       } else {
//         Get.snackbar(
//           'Error',
//           result.message,
//           snackPosition: SnackPosition.BOTTOM,
//           backgroundColor: Colors.red,
//           colorText: Colors.white,
//         );
//       }
//     } catch (e) {
//       // Close loading
//       Get.back();
//       Get.snackbar(
//         'Error',
//         'An unexpected error occurred. Please try again',
//         snackPosition: SnackPosition.BOTTOM,
//         backgroundColor: Colors.red,
//         colorText: Colors.white,
//       );
//     }
//   }
// }
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
// // import 'package:ecommerce_app/utils/app_textstyles.dart';
// // import 'package:ecommerce_app/view/widgets/custom_textfield.dart';
// // import 'package:flutter/material.dart';
// // import 'package:get/get.dart';
// //
// //
// // class SigninScreen extends StatelessWidget {
// //   SigninScreen({super.key});
// //   final TextEditingController _controller = TextEditingController();
// //   final TextEditingController _passwordController = TextEditingController();
// //
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     final isDark = Theme.of(context).brightness == Brightness.dark;
// //
// //     return Scaffold(
// //       body: SafeArea(
// //         child: SingleChildScrollView(
// //           padding: const EdgeInsets.all(24),
// //           child: Column(
// //             crossAxisAlignment: CrossAxisAlignment.start,
// //             children: [
// //               const SizedBox(height: 40),
// //               Text(
// //                 'Welcome Back!',
// //                 style: AppTextStyle.withColor(
// //                   AppTextStyle.h1,
// //                   Theme.of(context).textTheme.bodyLarge!.color!,
// //                 ),
// //               ),
// //               const SizedBox(height: 8),
// //               Text(
// //                 'Sign in to continue shopping',
// //                 style: AppTextStyle.withColor(
// //                 AppTextStyle.bodyLarge,
// //                   isDark? Colors.grey[400]! : Colors.grey[600]!,
// //
// //                 ),
// //               ),
// //               const SizedBox(height: 40),
// //               //email textfield
// //               CustomTextfield(
// //                   label: 'Email',
// //                   prefixIcon: Icons.email_outlined,
// //                 keyboardType: TextInputType.emailAddress,
// //                 controller: _emailController,
// //                 validator: (value){
// //                     if(value == null || value.isEmpty){
// //                       return 'Please enter your email';
// //                     }
// //                     if(!GetUtils.isEmail(value)){
// //                       return 'P1ease enter a valid email';
// //                     }
// //                     return null;
// //                 },
// //               ),
// //               const SizedBox(height: 16),
// //               //password textfield
// //               CustomTextfield(
// //                 label: 'Password',
// //                 prefixIcon: Icons.lock_outline,
// //                 keyboardType: TextInputType.visiblePassword,
// //                 isPassword: true,
// //                 controller: _passwordController,
// //                 validator: (value){
// //                   if(value == null || value.isEmpty){
// //                     return 'Please enter your password';
// //                   }
// //
// //                   return null;
// //                 },
// //               ),
// //             ],
// //             const SizedBox(height: 8),
// //             //forgot password
// //             Align(
// //               alignment: Alignment.centerRight,
// //               child: TextButton(
// //                   onPressed: (){},
// //                   child: Text(
// //                     'Forgot Password?',
// //                     style: AppTextStyle.withColor(
// //                       AppTextStyle.buttonMedium,
// //                       Theme.of(context).primaryColor,
// //                     ),
// //                   ),
// //               ),
// //             )
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }
import 'package:ecommerce_app/controllers/auth_controller.dart';
import 'package:ecommerce_app/features/sign_up_screen.dart';
import 'package:ecommerce_app/features/widgets/custom_textfield.dart';
import 'package:ecommerce_app/utils/app_textstyles.dart';
import 'package:ecommerce_app/features/main_screen.dart';
import 'package:ecommerce_app/features/forgot_password_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SigninScreen extends StatelessWidget {
  SigninScreen({super.key});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

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
              const SizedBox(height: 40),
              Text(
                'Welcome Back!',
                style: AppTextStyle.withColor(
                  AppTextStyle.h1,
                  Theme.of(context).textTheme.bodyLarge!.color!,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Sign in to continue shopping',
                style: AppTextStyle.withColor(
                  AppTextStyle.bodyLarge,
                  isDark ? Colors.grey[400]! : Colors.grey[600]!,
                ),
              ),
              const SizedBox(height: 40),

              CustomTextfield(
                label: 'Email',
                prefixIcon: Icons.email_outlined,
                keyboardType: TextInputType.emailAddress,
                controller: _emailController,
              ),
              const SizedBox(height: 16),

              CustomTextfield(
                label: 'Password',
                prefixIcon: Icons.lock_outline,
                keyboardType: TextInputType.visiblePassword,
                isPassword: true,
                controller: _passwordController,
              ),
              const SizedBox(height: 8),

              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () => Get.to(() => ForgotPasswordScreen()),
                  child: Text(
                    'Forgot Password?',
                    style: AppTextStyle.withColor(
                      AppTextStyle.buttonMedium,
                      Theme.of(context).primaryColor,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _handleSignIn,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    'Sign In',
                    style: AppTextStyle.withColor(
                      AppTextStyle.buttonMedium,
                      Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account?",
                    style: AppTextStyle.withColor(
                      AppTextStyle.bodyMedium,
                      isDark ? Colors.grey[400]! : Colors.grey[600]!,
                    ),
                  ),
                  TextButton(
                    onPressed: () => Get.to(() => SignUpScreen()),
                    child: Text(
                      'Sign Up',
                      style: AppTextStyle.withColor(
                        AppTextStyle.buttonMedium,
                        Theme.of(context).primaryColor,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void _handleSignIn() async {
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();
    final authController = Get.find<AuthController>();

    // Validation
    if (email.isEmpty) {
      Get.snackbar('Error', 'Please enter your email',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
      return;
    }

    if (password.isEmpty) {
      Get.snackbar('Error', 'Please enter your password',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
      return;
    }

    if (!GetUtils.isEmail(email)) {
      Get.snackbar('Error', 'Please enter a valid email',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
      return;
    }

    // Show loading
    Get.dialog(const Center(child: CircularProgressIndicator()),
        barrierDismissible: false);

    try {
      final result = await authController.signIn(email: email, password: password);
      Get.back();

      if (result.success) {
        Get.offAll(() => MainScreen());
        Get.snackbar('Success', result.message,
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green,
            colorText: Colors.white);
      } else {
        Get.snackbar('Error', result.message,
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red,
            colorText: Colors.white);
      }
    } catch (e) {
      Get.back();
      Get.snackbar('Error', 'An unexpected error occurred. Please try again',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
    }
  }
}
