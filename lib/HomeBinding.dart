

import 'package:game/HomeController.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(HomeController());
    // TODO: implement dependencies
  }

}