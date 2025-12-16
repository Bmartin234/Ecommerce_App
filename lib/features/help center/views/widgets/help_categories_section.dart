//import 'package:ecommerce_app/utils/app_textstyle.dart';
import 'package:flutter/material.dart';

import '../../../../utils/app_textstyles.dart';
import 'category_card.dart';

class HelpCatagoriesSection extends StatelessWidget {
  const HelpCatagoriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final catagories = [
      {'icon': Icons.shopping_bag_outlined, 'title': 'Orders'},
      {'icon': Icons.payment_outlined, 'title': 'Payments'},
      {'icon': Icons.local_shipping_outlined, 'title': 'Shipping'},
      {'icon': Icons.assignment_return_outlined, 'title': 'Returns'},
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Help Categories',
            style: AppTextStyle.withColor(
              AppTextStyle.h3,
              Theme.of(context).textTheme.bodyLarge!.color!,
            ),
          ),
          const SizedBox(height: 16),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 1.5,
            ),
            itemCount: catagories.length,
            itemBuilder: (context, index) {
              return CategoryCard(
                title: catagories[index]['title'] as String,
                icon: catagories[index]['icon'] as IconData,
              );
            },
          ),
        ],
      ),
    );
  }
}



















































































// //import 'package:ecommerce_app/utils/app_textstyle.dart';
// import 'package:flutter/material.dart';
//
// import '../../../../utils/app_textstyles.dart';
//
// class HelpCatagoriesSection extends StatelessWidget {
//   const HelpCatagoriesSection({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final catagories = [
//       {'icon': Icons.shopping_bag_outlined, 'title': 'Orders'},
//       {'icon': Icons.payment_outlined, 'title': 'Payments'},
//       {'icon': Icons.local_shipping_outlined, 'title': 'Shipping'},
//       {'icon': Icons.assignment_return_outlined, 'title': 'Returns'},
//     ];
//
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 16),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             'Help Categories',
//             style: AppTextStyle.withColor(
//               AppTextStyle.h3,
//               Theme.of(context).textTheme.bodyLarge!.color!,
//             ),
//           ),
//           const SizedBox(height: 16),
//           GridView.builder(
//             shrinkWrap: true,
//             physics: const NeverScrollableScrollPhysics(),
//             gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//               crossAxisCount: 2,
//               crossAxisSpacing: 16,
//               mainAxisSpacing: 16,
//               childAspectRatio: 1.5,
//             ),
//             itemCount: catagories.length,
//             itemBuilder: (context, index) {
//               return CategoryCard(
//                 title: catagories[index]['title'] as String,
//                 icon: catagories[index]['icon'] as IconData,
//               );
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }
