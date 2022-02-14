import 'package:b_store/core/viewmodel/auth_view_model.dart';
import 'package:b_store/core/viewmodel/cart_viewmodel.dart';
import 'package:b_store/core/viewmodel/control_view_model.dart';
import 'package:b_store/core/viewmodel/home_view_model.dart';
import 'package:b_store/helper/local_storage_data.dart';
import 'package:get/get.dart';

class Binding extends Bindings{
  @override
  void dependencies() {
   Get.lazyPut(() => AuthViewModel());
   Get.lazyPut(() => ControlViewModel());
   Get.lazyPut(() => HomeViewModel());
   Get.lazyPut(() => CartViewModel());
   Get.lazyPut(() => LocalStorageData());

  }

}