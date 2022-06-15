import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class PageNavigationService {
  static generalNavigation(Widget nextScreen) {
    Get.to(nextScreen);
  }

  static removeAndNavigate(Widget nextScreen) {
    Get.off(nextScreen);
  }

  static removeAllAndNavigate(Widget nextScreen) {
    Get.offAll(nextScreen);
  }

  static backScreen() {
    Get.back(result: false);
  }
}
