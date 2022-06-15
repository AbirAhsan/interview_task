import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:interview_task/views/variables/icon_variables.dart';

import '../../controller/screen_controller.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ScreenController screenCtrl = Get.put(ScreenController());
    screenCtrl.splashDelay();
    return Scaffold(
      body: Center(
        child: Image.asset(CustomImages.splashImage),
      ),
    );
  }
}
