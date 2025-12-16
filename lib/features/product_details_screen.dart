// // lib/features/product_details_screen.dart
//
// import 'package:ecommerce_app/features/cart_screen.dart';
// import 'package:ecommerce_app/features/widgets/size_selector.dart';
// import 'package:ecommerce_app/models/product.dart';
// import 'package:ecommerce_app/utils/app_textstyles.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:share_plus/share_plus.dart';
// // NEW: CheckoutScreen ইমপোর্ট করুন (আপনার ফাইলের পাথ অনুযায়ী ঠিক করুন)
// //import 'package:ecommerce_app/features/checkout_screen.dart';
// // IMPORTANT: Ensure this path and class name (CartController) are correct.
// import '../controllers/cart_controller.dart';
// import 'CheckoutScreen.dart';
//
//
// class ProductDetailsScreen extends StatelessWidget {
//   final Products product;
//   // Use a standard constructor as Get.find() is used.
//   ProductDetailsScreen({super.key, required this.product});
//
//   // Retrieve the CartController instance
//   final CartController cartController = Get.find<CartController>();
//
//
//   @override
//   Widget build(BuildContext context) {
//     final screenSize = MediaQuery.of(context).size;
//     final screenHeight = screenSize.height;
//     final screenWidth = screenSize.width;
//     final isDark = Theme.of(context).brightness == Brightness.dark;
//
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           onPressed: () => Get.back(),
//           icon: Icon(
//             Icons.arrow_back,
//             color: isDark ? Colors.white : Colors.black,
//           ),
//         ),
//         title: Text(
//           'Details',
//           style: AppTextStyle.withColor(
//             AppTextStyle.h3,
//             isDark ? Colors.white : Colors.black,
//           ),
//         ),
//         actions: [
//           IconButton(
//             onPressed: () => _shareProduct(
//               context,
//               product.name,
//               product.description,
//             ),
//             icon: Icon(
//               Icons.share,
//               color: isDark ? Colors.white : Colors.black,
//             ),
//           ),
//         ],
//       ),
//
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             /// ---------- IMAGE ----------
//             Stack(
//               children: [
//                 AspectRatio(
//                   aspectRatio: 16 / 9,
//                   child: Image.asset(
//                     product.imageUrl,
//                     width: double.infinity,
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//                 Positioned(
//                   right: 12,
//                   top: 12,
//                   child: IconButton(
//                     onPressed: () {
//                       // Favorite toggle logic goes here
//                     },
//                     icon: Icon(
//                       product.isFavorite
//                           ? Icons.favorite
//                           : Icons.favorite_border,
//                       color: product.isFavorite
//                           ? Theme.of(context).primaryColor
//                           : (isDark ? Colors.white : Colors.black),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//
//             /// ---------- DETAILS ----------
//             Padding(
//               padding: EdgeInsets.all(screenWidth * 0.04),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Expanded(
//                         child: Text(
//                           product.name,
//                           style: AppTextStyle.withColor(
//                             AppTextStyle.h2,
//                             Theme.of(context)
//                                 .textTheme
//                                 .headlineMedium!
//                                 .color!,
//                           ),
//                         ),
//                       ),
//                       Text(
//                         '\$${product.price.toStringAsFixed(2)}',
//                         style: AppTextStyle.withColor(
//                           AppTextStyle.h2,
//                           Theme.of(context)
//                               .textTheme
//                               .headlineMedium!
//                               .color!,
//                         ),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 8),
//                   Text(
//                     product.description, // Assuming this shows category or a short line
//                     style: AppTextStyle.withColor(
//                       AppTextStyle.bodyMedium,
//                       isDark ? Colors.grey[400]! : Colors.grey[600]!,
//                     ),
//                   ),
//                   SizedBox(height: screenHeight * 0.02),
//
//                   Text(
//                     'Select Size',
//                     style: AppTextStyle.withColor(
//                       AppTextStyle.labelMedium,
//                       Theme.of(context).textTheme.bodyLarge!.color!,
//                     ),
//                   ),
//                   const SizedBox(height: 8),
//                   const SizeSelector(),
//
//                   SizedBox(height: screenHeight * 0.02),
//                   Text(
//                     'Description',
//                     style: AppTextStyle.withColor(
//                       AppTextStyle.labelMedium,
//                       Theme.of(context).textTheme.bodyLarge!.color!,
//                     ),
//                   ),
//                   const SizedBox(height: 8),
//                   Text(
//                     product.description,
//                     style: AppTextStyle.withColor(
//                       AppTextStyle.bodySmall,
//                       Theme.of(context).textTheme.bodyLarge!.color!,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//
//       /// ---------- BOTTOM BUTTONS (Buy Now fixed to CheckoutScreen) ----------
//       bottomNavigationBar: SafeArea(
//         child: Padding(
//           padding: EdgeInsets.all(screenWidth * 0.04),
//           child: Row(
//             children: [
//               Expanded(
//                 child: OutlinedButton(
//                   onPressed: () {
//                     // **ADD TO CART LOGIC**
//                     cartController.addToCart(product);
//
//                     // Feedback
//                     Get.snackbar(
//                       'Success',
//                       '${product.name} added to cart.',
//                       snackPosition: SnackPosition.BOTTOM,
//                       backgroundColor: Theme.of(context).primaryColor,
//                       colorText: Colors.white,
//                       duration: const Duration(seconds: 2),
//                     );
//
//                     // Navigate to CartScreen
//                     Get.to(() => CartScreen());
//                   },
//                   style: OutlinedButton.styleFrom(
//                     padding: EdgeInsets.symmetric(
//                       vertical: screenHeight * 0.02,
//                     ),
//                   ),
//                   child: Text(
//                     'Add to Cart',
//                     style: AppTextStyle.withColor(
//                       AppTextStyle.buttonMedium,
//                       Theme.of(context).textTheme.bodyLarge!.color!,
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(width: screenWidth * 0.04),
//               Expanded(
//                 child: ElevatedButton(
//                   onPressed: () {
//                     // 🚀 Buy Now Logic: সরাসরি My Order / Checkout স্ক্রিনে নেভিগেট করুন
//                     Get.snackbar(
//                       'Order Confirmed',
//                       'Redirecting to Checkout...',
//                       snackPosition: SnackPosition.TOP,
//                       backgroundColor: Colors.green,
//                       colorText: Colors.white,
//                       duration: const Duration(seconds: 2),
//                     );
//
//                     // Navigates to the CheckoutScreen (which serves as your My Order page)
//                     Get.to(() => const CheckoutScreen());
//                   },
//                   style: ElevatedButton.styleFrom(
//                     padding: EdgeInsets.symmetric(
//                       vertical: screenHeight * 0.02,
//                     ),
//                     backgroundColor: Theme.of(context).primaryColor,
//                   ),
//                   child: Text(
//                     'Buy Now',
//                     style: AppTextStyle.withColor(
//                       AppTextStyle.buttonMedium,
//                       Colors.white,
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   /// ---------- SHARE FUNCTION ----------
//   Future<void> _shareProduct(
//       BuildContext context,
//       String productName,
//       String description,
//       ) async {
//     const String shopLink = 'https://yourshop.com/product/item';
//     final String shareMessage =
//         'Check out this great product: $productName. $description\n\nShop now at $shopLink';
//
//     await Share.share(
//       shareMessage,
//       subject: productName,
//     );
//   }
// }
//




































































import 'package:ecommerce_app/features/widgets/size_selector.dart';
import 'package:ecommerce_app/models/product.dart';
import 'package:ecommerce_app/utils/app_textstyles.dart';
//import 'package:ecommerce_app/view/widgets/size_selector.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:share_plus/share_plus.dart';

class ProductDetailsScreen extends StatelessWidget {
  final Products product;
  const ProductDetailsScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height;
    final screenWidth = screenSize.width;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back,
            color: isDark ? Colors.white : Colors.black,
          ),
        ),
        title: Text(
          'Details',
          style: AppTextStyle.withColor(
              AppTextStyle.h3,
            isDark ? Colors.white: Colors.black,
          ),
        ),
        actions: [
          //share button
          IconButton(
              onPressed: () => _shareProduct(
                context,
                product.name,
                product.description,
              ),
              icon: Icon(
                Icons.share,
                color: isDark ? Colors.white : Colors.black,
              )
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                // image
                AspectRatio(
                aspectRatio: 16/9,
                child: Image.asset(
                  product.imageUrl,
                  width: double.infinity,
                  fit: BoxFit.cover,
                 ),
                ),

                // favorite button
                Positioned(
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      product.isFavorite?
                          Icons.favorite : Icons.favorite_border,
                      color: product.isFavorite
                        ? Theme.of(context).primaryColor: (isDark ? Colors.white: Colors.black),
                    ),
                  ),
                )
              ],
            ),
            //product details
            Padding(
              padding: EdgeInsets.all(screenWidth * 0.04),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          product.name,
                          style: AppTextStyle.withColor(
                            AppTextStyle.h2,
                            Theme.of(context).textTheme.headlineMedium!.color!,
                          ),
                        ),
                      ),
                      Text(
                        //product.name,
                        '\$${product.price.toStringAsFixed(2)}',
                        style: AppTextStyle.withColor(
                          AppTextStyle.h2,
                          Theme.of(context).textTheme.headlineMedium!.color!,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    product.name,
                    style: AppTextStyle.withColor(
                      AppTextStyle.h2,
                      isDark ? Colors.grey[400]! : Colors.grey[600]!,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  Text(
                    'Select Size',
                    style: AppTextStyle.withColor(
                      AppTextStyle.labelMedium,
                      Theme.of(context).textTheme.bodyLarge!.color!,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  //size selector
                  const SizeSelector(),
                  SizedBox(height: screenHeight * 0.02),
                  Text(
                    'Description',
                    style: AppTextStyle.withColor(
                      AppTextStyle.labelMedium,
                      Theme.of(context).textTheme.bodyLarge!.color!,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  Text(
                    'Description',
                    style: AppTextStyle.withColor(
                      AppTextStyle.bodySmall,
                      Theme.of(context).textTheme.bodyLarge!.color!,
                    ),
                  ),
                ],
             ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(screenWidth * 0.04),
          child: Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: (){},
                  style: OutlinedButton.styleFrom(
                    padding: EdgeInsets.symmetric(
                      vertical: screenHeight * 0.02,
                    ),
                    side: BorderSide(
                      color: isDark ? Colors.white70 : Colors.black12,
                    ),
                  ),
                  child: Text(
                      'Add to Cart',
                    style: AppTextStyle.withColor(
                      AppTextStyle.buttonMedium,
                      Theme.of(context).textTheme.bodyLarge!.color!,
                    ),
                  ),
                ),
              ),
              SizedBox( width: screenWidth * 0.04),
              Expanded(
                child: ElevatedButton(
                  onPressed: (){},
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(
                      vertical: screenHeight * 0.02,
                    ),
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                  child: Text(
                    'Buy Now',
                    style: AppTextStyle.withColor(
                      AppTextStyle.buttonMedium,
                    Colors.white,
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

  //share product
Future<void> _shareProduct(
    BuildContext context,
    String productName,
    String description,
    ) async{
    //get the render box for share position origin
  final box = context.findRenderObject()  as RenderBox?;

  const String shopLink = 'https:// yourshop.com/product/cotton-tshirt';
  final String shareMessage = '$description\n\nshop now at $shopLink';

  try{
    final ShareResult result = await Share.share(
      shareMessage,
      subject: productName,
      sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size,
    );
    if(result.status == ShareResultStatus.success){
      debugPrint('Thank you for sharing!');
    }
  }catch(e){
    debugPrint('Error Sharing: $e');
  }
}
}
