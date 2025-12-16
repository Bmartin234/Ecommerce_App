import 'package:ecommerce_app/features/widgets/size_selector.dart';
import 'package:ecommerce_app/models/product.dart';
import 'package:ecommerce_app/utils/app_textstyles.dart';
//import 'package:ecommerce_app/view/widgets/size_selector.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:share_plus/share_plus.dart';
//import 'package:ecommerce_app/lib/features/cart_screen.dart';

import '../../controllers/cart_controller.dart';
import '../cart_screen.dart';

class ProductDetailsScreen extends StatelessWidget {
  final Products product;
  const ProductDetailsScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height;
    final screenWidth = screenSize.width;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final CartController cartController = Get.find<CartController>();
    
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
                    "Description AMD Ryzen 7 7700X ProcessorThis high-performance gaming PC features top-tier components for excellent gaming and multitasking. At its heart is the AMD Ryzen 7 7700X processor, with 8 cores and 16 threads, ensuring rapid performance. It pairs seamlessly with the MSI B650M PROJECT ZERO m-ATX motherboard, which supports PCIe 5.0 and DDR5 memory, providing robust connectivity and reliable power delivery. The build includes 16GB of Corsair VENGEANCE DDR5 RAM running at 6000MHz for smooth multitasking, and a Western Digital SN7100 1TB NVMe PCIe Gen 4.0 SSD for rapid storage access. "
                        "Graphics are handled by the MSI GeForce RTX 3060 VENTUS 2X OC with 12GB of memory, delivering stunning visuals and smooth gameplay. Cooling is managed by the Corsair NAUTILUS 240 RS ARGB 240mm Liquid CPU Cooler, ensuring efficient heat management. All components are housed in the sleek MSI MAG PANO M100R PZ Micro- ATX Tower Gaming Case, which offers excellent airflow and space for expansion. Power is supplied by the MSI MAG A750GL PCIE5 750W 80 Plus Gold Full Modular Power Supply, ensuring reliable and efficient power delivery with low noise. This combination of advanced components makes for a powerful and responsive gaming PC suitable for high-performance tasks and immersive gaming experiences.",
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
                  onPressed: (){
                    cartController.addToCart(product);

                    // 🟢 তারপর ইউজারকে একটি মেসেজ দিন (অপশনাল কিন্তু ভালো)
                    Get.snackbar(
                      'Success',
                      '${product.name} added to cart!',
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor: Colors.green,
                      colorText: Colors.white,
                      duration: const Duration(seconds: 1),
                    );
                    Get.to(() =>  CartScreen());
                  },
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
                    'Order Now',
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
