

import 'package:ecommerce_app/models/product.dart';
import 'package:ecommerce_app/view/widgets/product_card.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/scroll_view.dart';
import 'package:ecommerce_app/view/widgets/product_details_screen.dart';

class ProductGrid extends StatelessWidget {
  const ProductGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.75,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemCount: products.length,
      itemBuilder: (context, index){
        final product = products[index];
        return GestureDetector(
          onTap: ()=> Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ProductDetailsScreen(
              product: product
               ),
              ),
            ),
          child: ProductCard(
            product: product,
          ),
        );
      },
    );
  }
}























































//
// import 'package:flutter/material.dart';
//
// class ProductGrid extends StatelessWidget {
//   const ProductGrid({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return GridView.builder(
//       padding: const EdgeInsets.all(16),
//       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: 2,
//         childAspectRatio: 0.75,
//         crossAxisSpacing: 16,
//         mainAxisSpacing: 16,
//       ),
//       itemCount: 6,
//       itemBuilder: (context, index) {
//         return Container(
//           decoration: BoxDecoration(
//             color: Colors.grey[200],
//             borderRadius: BorderRadius.circular(12),
//           ),
//           child: Center(
//             child: Text("Product ${index + 1}"),
//           ),
//         );
//       },
//     );
//   }
// }



