import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interview_task/model/user_details_model.dart';

import '../../controller/user_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UserController userCtrl = Get.put(UserController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("User List"),
      ),
      body: Obx(
        () => ListView.builder(
          padding: const EdgeInsets.all(15.0),
          itemCount: userCtrl.userDetailsList.length,
          itemBuilder: (buildContext, index) {
            UserDetailsModel? userDetails = userCtrl.userDetailsList[index];
            return Padding(
              padding: const EdgeInsets.all(5.0),
              child: Card(
                  elevation: 15.0,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextWithIcon(
                          iconData: Icons.person,
                          userDetails:
                              "${userDetails!.name} (${userDetails.username})",
                        ),
                        TextWithIcon(
                          iconData: Icons.email,
                          userDetails: userDetails.email,
                        ),
                        TextWithIcon(
                          iconData: Icons.location_on_outlined,
                          userDetails:
                              "${userDetails.address!.suite} ${userDetails.address!.street} ${userDetails.address!.city} ${userDetails.address!.zipcode}",
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextWithIcon(
                          iconData: Icons.call,
                          userDetails: "${userDetails.phone}",
                        ),
                        TextWithIcon(
                          iconData: Icons.wordpress,
                          userDetails: "${userDetails.website}",
                        ),
                        TextWithIcon(
                          iconData: Icons.work_outline,
                          userDetails: "${userDetails.company!.name}",
                        ),
                      ],
                    ),
                  )),
            );
          },
        ),
      ),
    );
  }
}

class TextWithIcon extends StatelessWidget {
  const TextWithIcon({
    Key? key,
    required this.userDetails,
    this.iconData,
  }) : super(key: key);

  final String? userDetails;
  final IconData? iconData;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          iconData,
          color: Colors.grey,
        ),
        const SizedBox(
          width: 5,
        ),
        Flexible(
          child: Text(
            "$userDetails",
          ),
        ),
      ],
    );
  }
}
