import 'package:get/get.dart';

mixin NavigationManager {
  void handleNavigation(Stream<String?> stream) {
    stream.listen((page) {
      if (page != null && page.isNotEmpty) {
        if (page != '/initial' && page != '/login') {
          Get.toNamed(page);
        } else {
          Get.offAllNamed(page);
        }
      }
    });
  }
}