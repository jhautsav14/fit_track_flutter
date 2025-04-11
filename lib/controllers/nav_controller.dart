import 'package:get/get.dart';

class NavController extends GetxController {
  var currentIndex = 2.obs;

  void changeTab(int index) {
    currentIndex.value = index;
  }
}
