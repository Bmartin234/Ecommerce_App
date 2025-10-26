import 'package:ecommerce_app/utils/app_textstyles.dart';
import 'package:ecommerce_app/view/widgets/custom_textfield.dart';
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

              // email textfield
              CustomTextfield(
                label: 'Email',
                prefixIcon: Icons.email_outlined,
                keyboardType: TextInputType.emailAddress,
                controller: _emailController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                     'Please enter your email';
                  }
                  if (!GetUtils.isEmail(value)) {
                     'Please enter a valid email';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 16),

              // password textfield
              CustomTextfield(
                label: 'Password',
                prefixIcon: Icons.lock_outline,
                keyboardType: TextInputType.visiblePassword,
                isPassword: true,
                controller: _passwordController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    'Please enter your password';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 8),

              // forgot password
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'Forgot Password?',
                    style: AppTextStyle.withColor(
                      AppTextStyle.buttonMedium,
                      Theme.of(context).primaryColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}














































// import 'package:ecommerce_app/utils/app_textstyles.dart';
// import 'package:ecommerce_app/view/widgets/custom_textfield.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
//
// class SigninScreen extends StatelessWidget {
//   SigninScreen({super.key});
//   final TextEditingController _controller = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//
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
//                 AppTextStyle.bodyLarge,
//                   isDark? Colors.grey[400]! : Colors.grey[600]!,
//
//                 ),
//               ),
//               const SizedBox(height: 40),
//               //email textfield
//               CustomTextfield(
//                   label: 'Email',
//                   prefixIcon: Icons.email_outlined,
//                 keyboardType: TextInputType.emailAddress,
//                 controller: _emailController,
//                 validator: (value){
//                     if(value == null || value.isEmpty){
//                       return 'Please enter your email';
//                     }
//                     if(!GetUtils.isEmail(value)){
//                       return 'P1ease enter a valid email';
//                     }
//                     return null;
//                 },
//               ),
//               const SizedBox(height: 16),
//               //password textfield
//               CustomTextfield(
//                 label: 'Password',
//                 prefixIcon: Icons.lock_outline,
//                 keyboardType: TextInputType.visiblePassword,
//                 isPassword: true,
//                 controller: _passwordController,
//                 validator: (value){
//                   if(value == null || value.isEmpty){
//                     return 'Please enter your password';
//                   }
//
//                   return null;
//                 },
//               ),
//             ],
//             const SizedBox(height: 8),
//             //forgot password
//             Align(
//               alignment: Alignment.centerRight,
//               child: TextButton(
//                   onPressed: (){},
//                   child: Text(
//                     'Forgot Password?',
//                     style: AppTextStyle.withColor(
//                       AppTextStyle.buttonMedium,
//                       Theme.of(context).primaryColor,
//                     ),
//                   ),
//               ),
//             )
//           ),
//         ),
//       ),
//     );
//   }
// }
