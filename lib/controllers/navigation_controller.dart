import 'package:get/get.dart';

class NavigationsController extends GetxController{
  final RxInt currentIndex = 0.obs;

  void changeIndex(int index){
    currentIndex.value = index;
  }
}