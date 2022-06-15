import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:interview_task/model/post_details_model.dart';
import 'dart:convert';

import 'package:interview_task/model/user_details_model.dart';

import '../../app_config.dart';

abstract class UserApiService {
  static Future<List<UserDetailsModel?>> getUserList() async {
    Uri url = Uri.parse("${AppConfig.rawBaseUrl}/users");

    var response = await http.get(
      url,
      headers: {
        'Content-Type': 'application/json',
        "Accept": 'application/json',
      },
    );
    debugPrint("${response.statusCode} ${url}");
    if (response.statusCode == 200) {
      var jsonResponse = response.body;
      List decoded = json.decode(jsonResponse);

      List<UserDetailsModel?> mapdatalist = decoded
          .map<UserDetailsModel?>((b) => UserDetailsModel.fromJson(b))
          .toList();
      print(mapdatalist);
      return mapdatalist;
    } else {
      throw {
        "code": response.statusCode,
        "body": response.body,
      };
    }
  }

  static Future<List<PostDetails?>> getPostList() async {
    Uri url = Uri.parse("${AppConfig.rawBaseUrl}/posts");

    var response = await http.get(
      url,
      headers: {
        'Content-Type': 'application/json',
        "Accept": 'application/json',
      },
    );
    debugPrint("${response.statusCode} ${url}");
    if (response.statusCode == 200) {
      var jsonResponse = response.body;
      List decoded = json.decode(jsonResponse);

      List<PostDetails?> mapdatalist =
          decoded.map<PostDetails?>((b) => PostDetails.fromJson(b)).toList();
      print(mapdatalist);
      return mapdatalist;
    } else {
      throw {
        "code": response.statusCode,
        "body": response.body,
      };
    }
  }
}
