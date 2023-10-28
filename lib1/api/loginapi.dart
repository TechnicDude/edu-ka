import 'package:edukaapp/api/api.dart';
import 'package:edukaapp/api/network.dart';
import 'package:edukaapp/main.dart';
import 'package:edukaapp/utils/app_helper.dart';

class LoginApi {
  final Map<String, dynamic> body;
  LoginApi(this.body);

  Future register() async {
    ServiceWithHeaderWithbody service =
        new ServiceWithHeaderWithbody(APIURL.registration, body);
    var data = await service.data();
    return data;
  }

  Future login() async {
    ServiceWithHeaderWithbody service =
        new ServiceWithHeaderWithbody(APIURL.login, body);
    var data = await service.data();
    return data;
  }

  Future factokenregister() async {
    ServiceWithHeaderWithbody service =
        ServiceWithHeaderWithbody(APIURL.registerfcmtoken, body);
    var data = await service.postdatawithoutbody();
    return data;
  }

  Future sentotp() async {
    ServiceWithHeaderWithbody service =
        new ServiceWithHeaderWithbody(APIURL.forgetverifyotp, body);
    var data = await service.data();
    return data;
  }

  Future verifyOtp() async {
    ServiceWithHeaderWithbody service =
        new ServiceWithHeaderWithbody(APIURL.verifyotp, body);
    var data = await service.data();
    return data;
  }

  Future verifyForgot() async {
    ServiceWithHeaderWithbody service =
        new ServiceWithHeaderWithbody(APIURL.verifyforgot, body);
    var data = await service.data();
    return data;
  }

  Future forgetpassword() async {
    Service service = new Service(APIURL.forgetpassword, body);
    var data = await service.formdata();
    return data;
  }

  Future changepassword() async {
    ServiceWithHeaderWithbody service =
        ServiceWithHeaderWithbody(APIURL.changepassword, body);
    var data = await service.postdatawithoutbody();
    return data;
  }

  Future socialmedialogin() async {
    Service service = new Service(APIURL.socialmediaLOGIN, body);
    var data = await service.formdata();
    return data;
  }

  Future appleocialmedialogin() async {
    Service service = new Service(APIURL.applesocialmediaLOGIN, body);
    var data = await service.formdata();
    return data;
  }

  Future googlesocialmedialogin() async {
    Service service = new Service(APIURL.googlesocialmediaLOGIN, body);
    var data = await service.formdata();
    return data;
  }

  Future facebooksocialmedialogin() async {
    Service service = new Service(APIURL.facebooksocialmediaLOGIN, body);
    var data = await service.formdata();
    return data;
  }

  Future userprofile() async {
    Service service = new Service(APIURL.userprofile, body);
    var data = await service.formdata();
    return data;
  }

  Future updateprofile() async {
    var url = APIURL.userprofileupdate;
    ServicePOST service = new ServicePOST(url, body);
    var data = await service.formdata();
    return data;
  }
}
