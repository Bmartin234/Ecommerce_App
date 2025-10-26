import 'package:ecommerce_app/controllers/auth_controller.dart';
import 'package:ecommerce_app/view/main_screen.dart';
import 'package:ecommerce_app/view/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce_app/view/signin_screen.dart';


class SplashScreen extends StatelessWidget {
   SplashScreen({super.key});
  final AuthController authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    //navigate based on auth state after 2.5 sseconds
     Future.delayed(const Duration(milliseconds: 2500),(){
       if(authController.isFirstTime){
          Get.off(()=> const OnboardingScreen());
       }
       else if(authController.isLoggedIn){
         Get.off(()=> const MainScreen());
       }
       else{
          Get.off(()=> SigninScreen());
       }
     });

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Theme.of(context).primaryColor,
              Theme.of(context).primaryColor.withOpacity(0.8),
              Theme.of(context).primaryColor.withOpacity(0.6),
            ],
          ),
        ),
        child: Stack(
          children: [
            // Background pattern
            const Positioned.fill(
              child: Opacity(
                opacity: 0.05,
                child: GridPattern(
                  color: Colors.white,
                ),
              ),
            ),

            // Main content
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Animated logo container
                  TweenAnimationBuilder<double>(
                    tween: Tween(begin: 0.0, end: 1.0),
                    duration: const Duration(milliseconds: 1200),
                    builder: (context, value, child) {
                      return Opacity(
                        opacity: value,
                        child: Transform.translate(
                          offset: Offset(0, 20 * (1 - value)),
                          child: child,
                        ),
                      );
                    },
                    child: Column(
                      children: const [
                        Text(
                          "FASHION",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 32,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 8,
                          ),
                        ),
                        Text(
                          "STORE",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 32,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 4,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 32),

                  // Animated shopping bag icon
                  TweenAnimationBuilder<double>(
                    tween: Tween(begin: 0.0, end: 1.0),
                    duration: const Duration(milliseconds: 1200),
                    builder: (context, value, child) {
                      return Transform.scale(
                        scale: value,
                        child: Container(
                          padding: const EdgeInsets.all(24),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 20,
                                spreadRadius: 2,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Icon(
                            Icons.shopping_bag_outlined,
                            size: 48,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),

            // 🔹 Your original Positioned tagline part
            Positioned(
              bottom: 48,
              left: 0,
              right: 0,
              child: TweenAnimationBuilder<double>(
                tween: Tween(begin: 0.0, end: 1.0),
                duration: const Duration(milliseconds: 1200),
                builder: (context, value, child) {
                  return Opacity(
                    opacity: value,
                    child: child,
                  );
                },
                child: Text(
                  'Style Meets Simplicity',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.9),
                    fontSize: 14,
                    letterSpacing: 2,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// 🔹 Background grid pattern widget
class GridPattern extends StatelessWidget {
  final Color color;
  const GridPattern({Key? key, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: GridPainter(color: color),
    );
  }
}

// 🔹 Custom painter for grid pattern
class GridPainter extends CustomPainter {
  final Color color;
  const GridPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 0.5;
    const spacing = 20.0;

    // vertical lines
    for (var i = 0.0; i < size.width; i += spacing) {
      canvas.drawLine(Offset(i, 0), Offset(i, size.height), paint);
    }

    // horizontal lines
    for (var j = 0.0; j < size.height; j += spacing) {
      canvas.drawLine(Offset(0, j), Offset(size.width, j), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}














































//
// import 'package:flutter/material.dart';
//
// class  SplashScreen extends StatelessWidget {
//   const SplashScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//               colors: [
//                 Theme.of(context).primaryColor,
//                 Theme.of(context).primaryColor.withOpacity(0.8),
//                 Theme.of(context).primaryColor.withOpacity(0.6),
//               ]
//           )
//         ),
//         child: const Stack(
//           children: [
//             //background pattren
//             Positioned.fill(
//                 child: Opacity(opacity: 0.05,
//                 child: GridPattern(
//                   color: Colors.white,
//                   ),
//                 )
//             )),
//
//             //main content
//             Center(
//             child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children:[
//               //animated logo container
//                     TweenAnimationBuilder<double>(
//                     tween: Tween(begin: 0.0, end: 1.0),
//                     duration: const Duration(milliseconds: 1200),
//                     builder: (context, value,child){
//                       return  Opacity(opacity: value,
//                       child: Transform.translate(offset: Offset(0, 20 * (1-value)),
//                       child: child,
//                         ),
//                        );
//                       },
//                           child: Column(
//                           children: [
//                             Text(
//                           "FASHION",
//                           style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 32,
//                           fontWeight: FontWeight.w600,
//                           letterSpacing: 8,
//                           ),
//                           ),
//                           Text(
//                           "STORE",
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 32,
//                             fontWeight: FontWeight.w600,
//                             letterSpacing: 4,
//                              ),
//                             )
//                            ],
//                           ),
//                          ),
//                            //batton tagline
//
//
//
//                            // animated text
//
//
//     TweenAnimationBuilder<double>(
//     tween: Tween(begin: 0.0, end: 1.0),
//     duration: const Duration(milliseconds: 1200),
//     builder: (context, value,child){
//     return Transform.scale(
//     scale: value,
//     child: Container(
//     padding: const EdgeInsets.all(24),
//     decoration: BoxDecoration(
//     color: Colors.white,
//     shape: BoxShape.circle,
//     boxShadow: [
//     BoxShadow(
//     color: Colors.black.withOpacity(0.1),
//     blurRadius: 20,
//     spreadRadius: 2,
//     offset: const Offset(0, 4),
//     ),
//     ],
//     ),
//     child: Icon(Icons.shopping_bag_outlined,
//     size: 48,
//     color: Theme.of(context).primaryColor,
//     ),
//     ),
//     );
//     },
//     ),
//     const SizedBox(height: 32,)
//               ],
//              ),
//             ),
//                       Positioned(
//                       bottom: 48,
//                       left: 0,
//                       right: 0,
//                       child: TweenAnimationBuilder<double>(
//                       tween: Tween(begin: 0.0, end: 1.0),
//                       duration: const Duration(milliseconds: 1200),
//                       builder: (context, value,child){
//                       return  Opacity(
//                       opacity: value,
//                       child:  child,
//                       );
//                       },
//                       child: Text(
//                       'Style Meets Simplicity',
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                       color: Colors.white.withOpacity(0.9),
//                       fontSize: 14,
//                       letterSpacing: 2,
//                       fontWeight: FontWeight.w300,
//                       ),
//                       )
//                       ),
//                       ),
//           ],
//         ),
//       );
//     //);
//   }
// }
//
//
// class GridPattern extends StatelessWidget {
//   final Color color;
//   const GridPattern({
//     Key? key,
//     required this.color,
//   }): super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return CustomPaint(
//       painter: GridPainter(color: color),
//     );
//   }
// }
//
//
// class GridPainter extends StatelessWidget {
//   final Color color;
//   const GridPainter({required this.color});
//
//   @override
//    void paint(Canvas canvas, Size size){
//     final paint = Paint()
//         ..color = color
//         ..strokeWidth = 0.5;
//     final spacing = 20.0;
//     for(var i= 0.0; i<size.width; i+= spacing){
//       canvas.drawLine(
//           Offset(i,0),
//           Offset(i, size.height),
//           paint);
//     }
//
//     for(var i= 0.0; i<size.width; i+= spacing){
//       canvas.drawLine(
//           Offset(i,0),
//           Offset(i, size.height),
//           paint);
//     }
//   }
//   @override
//   bool shuldRepaint(covariant CustomPainter oldDeletate ) => false;
// }
//
