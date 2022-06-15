import 'package:get/get.dart';
import 'package:interview_task/views/home/home_screen.dart';

import '../services/page_navigation.dart';

class ScreenController extends GetxController {
  void splashDelay() {
    Future.delayed(const Duration(seconds: 3)).then((value) {
      PageNavigationService.removeAllAndNavigate(const HomeScreen());
    });
  }
}
