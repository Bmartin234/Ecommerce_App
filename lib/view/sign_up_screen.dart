import 'package:ecommerce_app/utils/app_textstyles.dart';
import 'package:ecommerce_app/view/main_screen.dart';
import 'package:ecommerce_app/view/signin_screen.dart';
import 'package:ecommerce_app/view/widgets/custom_textfield.dart';
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
              // back button
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

              // Full Name
              CustomTextfield(
                label: 'Full Name',
                prefixIcon: Icons.person_outline,
                keyboardType: TextInputType.name,
                controller: _nameController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your full name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Email
              CustomTextfield(
                label: 'E-mail',
                prefixIcon: Icons.email_outlined,
                keyboardType: TextInputType.emailAddress,
                controller: _emailController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  if (!GetUtils.isEmail(value)) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Password
              CustomTextfield(
                label: 'Password',
                prefixIcon: Icons.lock_outline,
                keyboardType: TextInputType.visiblePassword,
                isPassword: true,
                controller: _passwordController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Confirm Password
              CustomTextfield(
                label: 'Confirm Password',
                prefixIcon: Icons.lock_outline,
                keyboardType: TextInputType.visiblePassword,
                isPassword: true,
                controller: _confirmPasswordController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please confirm your password';
                  }
                  if (value != _passwordController.text) {
                    return 'Passwords do not match';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),

              // Sign Up Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Get.off(() => const MainScreen()),
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

              // Sign In TextButton
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
}
































































// import 'package:ecommerce_app/utils/app_textstyles.dart';
// import 'package:ecommerce_app/view/main_screen.dart';
// import 'package:ecommerce_app/view/signin_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:ecommerce_app/view/widgets/custom_textfield.dart';
// import 'package:get/get.dart';
//
// class SignUpScreen extends StatelessWidget {
//    SignUpScreen({super.key});
//
//    final TextEditingController _nameController = TextEditingController();
//    final TextEditingController _emailController = TextEditingController();
//    final TextEditingController _passwordController = TextEditingController();
//    final TextEditingController _confirmPasswordController = TextEditingController();
//
//
//    @override
//   Widget build(BuildContext context) {
//     final isDark = Theme.of(context).brightness == Brightness.dark;
//
//     return Scaffold(
//       body: SafeArea(
//           child: SingleChildScrollView(),
//         padding: EdgeInsets.all(24),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             //back button
//             IconButton(
//                 onPressed: (){},
//                 icon: Icon(
//                     Icons.arrow_back_ios,
//                   color: isDark ? Colors.white: Colors.black,
//                 ),
//             ),
//
//             const SizedBox(height: 20),
//             Text(
//               'Create Account',
//               style: AppTextStyle.withColor(
//                   AppTextStyle.h1,
//                   Theme.of(context).textTheme.bodyLarge!.color!,
//               ),
//             ),
//             const SizedBox(height: 8),
//             Text(
//               'Signup to get started',
//               style: AppTextStyle.withColor(
//                 AppTextStyle.bodyLarge,
//                 isDark ? Colors.grey[400]!:Colors.grey[600]!,
//               ),
//             ),
//             const SizedBox(height: 40),
//
//             //full name textfield
//             CustomTextfield(
//               label: 'Full Name',
//               prefixIcon: Icons.person_outline,
//               keyboardType: TextInputType.name,
//               isPassword: true,
//               controller: _nameController,
//               validator: (value) {
//                 if (value == null || value.isEmpty) {
//                   'Please enter your password';
//                 }
//                 return null;
//               },
//             ),
//             const SizedBox(height: 16),
//
//             // email textfeild
//             CustomTextfield(
//               label: 'E-mail',
//               prefixIcon: Icons.email_outlined,
//               keyboardType: TextInputType.emailAddress,
//               isPassword: true,
//               controller: _emailController,
//               validator: (value) {
//                 if (value == null || value.isEmpty) {
//                   'Please enter your email';
//                 }
//                 if(!GetUtils.isEmail(value)){
//                   return 'please enter a valid email';
//                 }
//                 return null;
//               },
//             ),
//
//             const SizedBox(height: 16),
//             //password textfield
//             CustomTextfield(
//               label: 'Password',
//               prefixIcon: Icons.lock_outline,
//               keyboardType: TextInputType.visiblePassword,
//               isPassword: true,
//               controller: _passwordController,
//               validator: (value) {
//                 if (value == null || value.isEmpty) {
//                   'Please enter your password';
//                 }
//                 return null;
//               },
//             ),
//
//             const SizedBox(height: 16),
//             //confirm password textfield
//             CustomTextfield(
//               label: 'Confirm Password',
//               prefixIcon: Icons.lock_outline,
//               keyboardType: TextInputType.visiblePassword,
//               isPassword: true,
//               controller: _confirmPasswordController,
//               validator: (value) {
//                 if (value == null || value.isEmpty) {
//                   'Please confirm your password';
//                 }if(value != null || value.isEmpty){
//                   return 'please confirm your password';
//                 }
//                 if(value != _passwordController.text){
//                   return 'Passwords do not match';
//                 }
//                 return null;
//               },
//             ),
//
//             const SizedBox(height: 24),
//             //signup button
//             SizedBox(
//               width: double.infinity,
//               child: ElevatedButton(
//                   onPressed: () =>Get.off(()=> const MainScreen()),
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Theme.of(context).primaryColor,
//                     padding: const EdgeInsets.symmetric(vertical: 16),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(12),
//                      ),
//                     ),
//                   ),
//                   child: Text(
//                     'Sign Up',
//                     style: AppTextStyle.withColor(
//                       AppTextStyle.buttonMedium,
//                       Colors.black
//                     ),
//                   )
//               ),
//               const SizedBox(height: 24),
//               //sign textbutton
//               Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text(
//                 'Already have an account?',
//                    style: AppTextStyle.withColor(
//                    AppTextStyle.bodyMedium,
//                    isDark ? Colors.grey[400]!: Colors.grey[600]!,
//                    ),
//                   ),
//                        TextButton(
//                        onPressed: ()=> Get.off(()=> SigninScreen()),
//                        child: Text(
//                        'Sign In',
//                        style: AppTextStyle.withColor(
//                        AppTextStyle.buttonMedium,
//                        Theme.of(context).primaryColor,
//                          ),
//                         ),
//                        ),
//                 ],
//               ),
//             ),
//           ],
//         )
//       ),
//     );
//   }
// }
