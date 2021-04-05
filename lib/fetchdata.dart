import 'package:get/get.dart';

import 'package:http/http.dart' as http;
import 'package:profile/controller.dart';
import 'package:profile/respomodel.dart';
import 'package:profile/usermodel.dart';

class FetchData {
  var controller = Get.put(Dataget());

  Future getData({String username}) async {
    var url = "https://api.github.com/users/$username";

    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var controller = Get.put(Dataget());
      controller.updateData(userdataFromJson(response.body));
      return response.body;
    } else {
      throw response.body;
    }
  }


  Future getrespoData({String username}) async {
    var url = "https://api.github.com/users/$username/repos";

    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var controller = Get.put(Dataget());
      controller.updaterespo(respodataFromJson(response.body));
      return response.body;
    } else {
      throw response.body;
    }
  }
}
