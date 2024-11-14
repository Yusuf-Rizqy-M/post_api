import 'package:get/get.dart';
import 'package:post_api/controller/dashboard_controllers.dart';

class MyBindings extends Bindings {
  @override
  void dependencies(){
    Get.lazyPut(() => DashboardControllers());
  }
}