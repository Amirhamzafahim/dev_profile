import 'package:get/get.dart';
import 'package:profile/respomodel.dart';
import 'package:profile/usermodel.dart';

class Dataget extends GetxController {
  var myFetchData = Userdata();
  // ignore: deprecated_member_use
  var respodata = List<Respodata>();


  bool isloading = true;

  updateData(value) {
    myFetchData = value;

    update();
  }

  updaterespo(value){
    respodata =value;


  }
}
