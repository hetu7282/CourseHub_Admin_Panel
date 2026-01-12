import 'package:get/get.dart';

class SideMenuController extends GetxController{
   RxInt selectedDestination = 0.obs;

   
 @override
  void onInit() async {
    selectedDestination.value = 0;
    super.onInit();
  }
     void selectdestination(int index) {
 
      selectedDestination.value = index;
      update();

  }
  
}