import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interview_task/model/user_details_model.dart';

import '../../controller/user_controller.dart';
import '../../model/post_details_model.dart';

class UserPostListScreen extends StatelessWidget {
  final UserDetailsModel? userDetails;
  const UserPostListScreen({Key? key, @required this.userDetails})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UserController userCtrl = Get.put(UserController());
    return Scaffold(
      appBar: AppBar(
        title: Text("${userDetails!.name}'s Posts"),
      ),
      body: Obx(
        () => ListView.builder(
          padding: const EdgeInsets.all(15.0),
          itemCount: userCtrl.postDetailsList
              .where((element) => element!.userId == userDetails!.id)
              .toList()
              .length,
          itemBuilder: (buildContext, index) {
            PostDetails? postDetails = userCtrl.postDetailsList
                .where((element) => element!.userId == userDetails!.id)
                .toList()[index];
            return Padding(
                padding: const EdgeInsets.all(5.0),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ListTile(
                      leading: CircleAvatar(
                        child: Icon(Icons.comment),
                      ),
                      title: Text(
                        "${postDetails!.title}",
                        maxLines: 1,
                      ),
                      subtitle: Text(
                        "${postDetails.body}",
                        maxLines: 2,
                      ),
                    ),
                  ),
                ));
          },
        ),
      ),
    );
  }
}
