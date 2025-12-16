import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:ecommerce_app/controllers/theme_controller.dart';
import 'package:ecommerce_app/features/widgets/category_chips.dart';
import 'package:ecommerce_app/features/widgets/custom_search_bar.dart';
import 'package:ecommerce_app/features/widgets/product_grid.dart';
import 'package:ecommerce_app/features/widgets/sale_banner.dart';

import 'all_products_screen.dart';
import 'cart_screen.dart';
import 'notifications/view/notifications_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            /// ================= HEADER =================
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 20,
                    backgroundImage:
                    AssetImage('assets/images/avatar.jpg'),
                  ),
                  const SizedBox(width: 12),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Hello Alex',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        'Good Morning',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),

                  const Spacer(),

                  /// -------- Notification ----------
                  IconButton(
                    onPressed: () =>
                        Get.to(() => NotificationsScreen()),
                    icon: const Icon(Icons.notifications_outlined),
                  ),

                  /// -------- Cart ----------
                  IconButton(
                    onPressed: () =>
                        Get.to(() => CartScreen()),
                    icon: const Icon(Icons.shopping_bag_outlined),
                  ),

                  /// -------- Theme Toggle ----------
                  GetBuilder<ThemeController>(
                    builder: (controller) => IconButton(
                      onPressed: () {
                        controller.toggleTheme(); //
                      },
                      icon: Icon(
                        controller.isDarkMode
                            ? Icons.light_mode
                            : Icons.dark_mode,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            /// ================= SEARCH =================
            const CustomSearchBar(),

            /// ================= CATEGORY =================
            const CategoryChips(),

            /// ================= SALE BANNER =================
            const SaleBanner(),

            /// ================= POPULAR PRODUCT TITLE =================
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Popular Product',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  GestureDetector(
                    onTap: () =>
                        Get.to(() => const AllProductsScreen()),
                    child: Text(
                      'See All',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            /// ================= PRODUCT GRID =================
            const Expanded(
              child: ProductGrid(),
            ),
          ],
        ),
      ),
    );
  }
}
