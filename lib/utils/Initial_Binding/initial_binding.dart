import 'package:get/get.dart';

import '../../src/Database/Controller/details_controller.dart';


class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailsController>(() => DetailsController());
  }
}

