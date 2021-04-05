import 'package:flutter/material.dart';
import 'package:profile/controller.dart';
import 'package:get/get.dart';
import 'package:profile/fetchdata.dart';
import 'package:profile/ui/screens/user_details_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final namc = TextEditingController();
    var datagets = FetchData();
    var controller = Get.put(Dataget());

    fetchuserdata() {
      // controller.setLoading(true);
      // controller.isloading=false;
      datagets.getData(username: namc.text);
      // controller.setLoading(true);
      // controller.isloading=false;

      // print(datagets.getData(username: namc.text));
    }

    final userNameController = TextEditingController();
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(
            'https://icon-library.com/images/github-icon-white/github-icon-white-6.jpg',
            height: 100,
            width: 100,
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              controller: namc,
              cursorColor: Colors.white,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: "Enter Your Github Username",
                fillColor: Colors.white,
                focusedBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Colors.white, width: 3.0)),
                enabledBorder: const OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white, width: 2.0),
                ),
                hintStyle: TextStyle(color: Colors.white),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 60),
            child: ElevatedButton(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Get Developer Details'),
                        controller.isloading?CircularProgressIndicator():""


                  ],
                ),
              ),
              onPressed: () async {
                await datagets.getData(username: namc.text);
                await datagets.getrespoData(username: namc.text);
                await Get.to(UserDetailsScreen(
                  userdata: controller.myFetchData,
               
                ));
               controller.isloading = false;

              },
            ),
          ),
       /*    GetBuilder<Dataget>(
              initState: (_) {},
              builder: (_) {
                return Column(
                  children: [
                    controller.isloading
                        ? CircularProgressIndicator()
                        : Text(
                            controller.myFetchData.login,
                            style: TextStyle(color: Colors.white),
                          ),
                  ],
                );
              }) */
        ],
      ),
    );
  }
}
