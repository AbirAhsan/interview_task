import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interview_task/model/post_details_model.dart';
import 'package:interview_task/model/user_details_model.dart';
import 'package:interview_task/services/network_service/user_api_service.dart';

import '../services/custom_eassy_loading.dart';

class UserController extends GetxController {
  //<=================================== User Details List
  RxList<UserDetailsModel?> userDetailsList =
      List<UserDetailsModel?>.empty(growable: true).obs;
  //<=================================== Post Details List
  RxList<PostDetails?> postDetailsList =
      List<PostDetails?>.empty(growable: true).obs;

  Rx<PostDetails?> postDetails = PostDetails().obs;

  @override
  void onInit() {
    fetchUserList();
    fetchPostList();
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
//
//
  //<================================ Get User List

  Future<void> fetchPostList() async {
    try {
      CustomEassyLoading().startLoading();
      UserApiService.getPostList().then((resp) {
        postDetailsList.value = resp.toList();

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

  //
//
  //<================================ Get User List

  Future<void> fetchPostDetails(int postID) async {
    try {
      CustomEassyLoading().startLoading();
      UserApiService.getPostDetails(postID).then((resp) {
        postDetails.value = resp;

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
