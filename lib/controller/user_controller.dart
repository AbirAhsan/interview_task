import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interview_task/model/user_details_model.dart';
import 'package:interview_task/services/network_service/user_api_service.dart';

import '../services/custom_eassy_loading.dart';

class UserController extends GetxController {
  //<=================================== User Details List
  RxList<UserDetailsModel?> userDetailsList =
      List<UserDetailsModel?>.empty(growable: true).obs;

  @override
  void onInit() {
    fetchUserList();
    super.onInit();
  }

//
//
  //<================================ Get User List

  Future<void> fetchUserList() async {
    try {
      CustomEassyLoading().startLoading();
      UserApiService.getUserList().then((resp) {
        userDetailsList.value = resp.toList();

        CustomEassyLoading().stopLoading();
      }, onError: (err) {
        CustomEassyLoading().stopLoading();
      });
    } on SocketException catch (e) {
      CustomEassyLoading().stopLoading();
      debugPrint('error $e');
    } catch (e) {
      CustomEassyLoading().stopLoading();
    }
  }
}
