import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interview_task/model/post_details_model.dart';
import 'package:interview_task/model/user_details_model.dart';

import '../../controller/user_controller.dart';

class PostScreen extends StatelessWidget {
  final PostDetails postDetails;
  final UserDetailsModel userDetails;
  const PostScreen(
      {Key? key, required this.postDetails, required this.userDetails})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    final UserController postCtrl = Get.put(UserController());

    postCtrl.fetchPostDetails(postDetails.id!);
    postCtrl.postDetails.value = PostDetails();
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: _height,
          width: _width,
          padding: const EdgeInsets.all(10.0),
          child: Card(
            elevation: 10.0,
            child: Obx(
              () => ListView(
                physics: const ScrollPhysics(),
                padding: const EdgeInsets.all(15.0),
                children: [
                  Text(
                    postCtrl.postDetails.value!.title ?? "",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  postCtrl.postDetails.value!.title != null
                      ? Text(
                          "Posted by : ${userDetails.name}",
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                        )
                      : Container(),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    postCtrl.postDetails.value!.body ?? "",
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
