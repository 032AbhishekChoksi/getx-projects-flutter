import 'package:get/get.dart';
import 'package:get_connect_with_state_mixin/app/modules/home/providers/user_provider.dart';
import 'package:get_connect_with_state_mixin/app/modules/home/user_model.dart';

class HomeController extends GetxController with StateMixin<List<dynamic>> {
  //TODO: Implement HomeController

  final count = 0.obs;

  @override
  void onInit() {
    super.onInit();
    UserProvider().getUser().then((resp) {
      change(resp, status: RxStatus.success());
    }, onError: (err) {
      change(
        null,
        status: RxStatus.error(err.toString()),
      );
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
