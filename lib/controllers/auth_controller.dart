import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthController extends GetxController{
  final _strorage = GetStorage();

  final RxBool _isFirstTime = true.obs;
  final RxBool _isLoggedIN = false.obs;

  bool get isFirstTime => _isFirstTime.value;
  bool get isLoggedIn => _isLoggedIN.value;

  @override
   void onInit(){
    super.onInit();
    _loadInitialState();
  }

  void _loadInitialState(){
    _isFirstTime.value = _strorage.read('isFirstTime')?? true;
    _isLoggedIN.value = _strorage.read('isLoggedIn')?? false;
  }
  void setFirstTimeDone(){
    _isFirstTime.value = false;
    _strorage.write('isFirstTime', false);
  }
  void login(){
    _isLoggedIN.value = true;
    _strorage.write('isLoggedIn', true);
  }

  void logout(){
    _isLoggedIN.value = false;
    _strorage.write('isLogged', false);
  }

}