import 'package:ecommerce_app/controllers/navigation_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/widgets.dart';
import 'package:ecommerce_app/view/main_screen.dart';

class CustomBottomNavbar extends StatelessWidget {
  const CustomBottomNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    final NavigationsController navigationController =
    Get.find<NavigationsController>();

    return Obx(
          () => BottomNavigationBar(
        currentIndex: navigationController.currentIndex.value,
        onTap: (index) => navigationController.changeIndex(index),

        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,

        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_outlined),
            label: 'Shopping',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: 'Wishlist',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Account',
          ),
        ],
      ),
    );
  }
}
















































































































// //import 'package:flutter/foundation.dart';
// import 'package:ecommerce_app/controllers/navigation_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:get/get.dart';
//
// class CustomBottomNavbar extends StatelessWidget {
//   const CustomBottomNavbar ({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final NavigationsController navigationsController =
//         Get.find<NavigationsController>();
//     return Obx(
//         ()=> BottomNavigationBar(
//           currentIndex: navigationsController.currentIndex.value,
//           onTap: (index) => navigationsController.changeIndex(index),
//             items: const[
//               BottomNavigationBarItem(
//                 icon: Icon(Icons.home_outlined),
//                 label: 'Home',
//               ),
//               BottomNavigationBarItem(
//                 icon: Icon(Icons.shopping_bag_outlined),
//                 label: 'Shopping',
//               ),
//               BottomNavigationBarItem(
//                 icon: Icon(Icons.favorite_border),
//                 label: 'Wishlist',
//               ),
//               BottomNavigationBarItem(
//                 icon: Icon(Icons.person_outline),
//                 label: 'Account',
//               ),
//
//             ],
//         )
//     );
//   }
// }
