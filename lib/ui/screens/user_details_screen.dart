import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:profile/controller.dart';

import 'package:profile/usermodel.dart';
import 'package:url_launcher/url_launcher.dart';

class UserDetailsScreen extends StatelessWidget {
  Userdata userdata;

  UserDetailsScreen({this.userdata});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(Dataget());

    // print(userdata.bio);

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 50),
          ListTile(
            isThreeLine: true,
            leading: CircleAvatar(
              backgroundImage: NetworkImage(userdata.avatarUrl),
            ),
            title: Text(
              userdata.name,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              userdata.bio,
              // ""
              // userdata.bio.toUpperCase(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Row(
              children: [
                Text(
                  "Followers: ${userdata.followers.toString()}",
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Following: ${userdata.following.toString()}",
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              'Total Repositories ' + controller.respodata.length.toString(),
              style: TextStyle(fontSize: 25),
            ),
          ),
          GetBuilder<Dataget>(
            initState: (_) {},
            builder: (_) {
              return Expanded(
                child: ListView.builder(
                  // shrinkWrap: true,
                  itemCount: controller.respodata.length,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {
                        _launchInWebView(controller.respodata[index].htmlUrl);
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(left: 18, right: 18),
                        child: Container(
                            height: 50,
                            width: 50,
                            child: Card(
                                child: Center(
                                    child: Text(controller.respodata[index].name
                                        .toUpperCase())))),
                      ),
                    );
                  },
                ),
              );
            },
          )
        ],
      ),
    );
  }

  Future<void> _launchInWebView(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: true,
        forceWebView: true,
        headers: <String, String>{'my_header_key': 'my_header_value'},
      );
    } else {
      throw 'Could not launch $url';
    }
  }
}
