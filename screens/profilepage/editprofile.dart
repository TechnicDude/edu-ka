import 'dart:convert';
import 'dart:io';
import 'package:edukaapp/api/api.dart';
import 'package:edukaapp/api/loginapi.dart';
import 'package:edukaapp/localization/Language/languages.dart';
import 'package:edukaapp/main.dart';
import 'package:edukaapp/model/api_models/profile_model.dart';
import 'package:edukaapp/utils/app_helper.dart';
import 'package:edukaapp/utils/app_validator.dart';
import 'package:edukaapp/utils/appbar.dart';
import 'package:edukaapp/utils/appcolors.dart';
import 'package:edukaapp/utils/appimages.dart';
import 'package:edukaapp/utils/appstyle.dart';
import 'package:edukaapp/utils/backbutton.dart';
import 'package:edukaapp/utils/buttonwidget.dart';
import 'package:edukaapp/utils/buttonwidgetloader.dart';
import 'package:edukaapp/utils/dialog_helper.dart';
import 'package:edukaapp/utils/textform.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:http/http.dart' as http;

class EditProfile extends StatefulWidget {
  final List<ProfileUserData>? profileuserdata;
  const EditProfile({Key? key, this.profileuserdata}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;
  TextEditingController firstnameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    if (widget.profileuserdata!.isNotEmpty) {
      firstnameController.text = widget.profileuserdata![0].fullName ?? '';
      lastnameController.text = widget.profileuserdata![0].roleName ?? '';
      emailController.text = widget.profileuserdata![0].email ?? '';
      mobileController.text = widget.profileuserdata![0].mobile.toString();
    }
    super.initState();
  }

  Future submitupdate() async {
    if (imagefiles != null) {
      var url = Uri.parse(APIURL.userprofileupdate);
      print(url);

      final request = new http.MultipartRequest('POST', url);
      Map<String, String> headers = {
        "Authorization": 'Bearer ${AppHelper.AUTH_TOKEN_VALUE?.trim()}'
      };
      print(imagefiles!.path);

      request.headers.addAll(headers);
      print(request.headers);

      final file =
          await http.MultipartFile.fromPath('avatar', imagefiles!.path);

      request.files.add(file);

      request.fields['first_name'] = firstnameController.text;
      request.fields['last_name'] = lastnameController.text;
      request.fields['mobile'] = mobileController.text;
      request.fields['email'] = emailController.text;

      request.fields['language'] = AppHelper.language!;
      print(request);
      try {
        final streamedResponse = await request.send();
        final response = await http.Response.fromStream(streamedResponse);
        print(response.body);
        var out = jsonDecode(response.body);
        if (out['status'] == "true") {
          DialogHelper.showFlutterToast(strMsg: out['message']);
          Navigator.pop(context);
        }
      } catch (e) {
        print(e);
      }
    } else {
      var data = {
        'first_name': firstnameController.text,
        'last_name': lastnameController.text,
        'mobile': mobileController.text,
        'email': emailController.text,
        'language': AppHelper.language

        // "id": MyApp.userid,
      };
      print(data.toString());

      LoginApi registerresponse = LoginApi(data);
      final response = await registerresponse.updateprofile();

      print(response);
      if (response['status'] == "true") {
        DialogHelper.showFlutterToast(strMsg: response['message']);
        Navigator.pop(context);
      }
    }
  }

  final ImagePicker imgpicker = ImagePicker();
  XFile? imagefiles;

  openImages() async {
    try {
      final XFile? image =
          await imgpicker.pickImage(source: ImageSource.gallery);

      if (image != null) {
        imagefiles = image;
        setState(() {});
      } else {
        DialogHelper.showFlutterToast(strMsg: 'No image is selected');
      }
    } catch (e) {
      DialogHelper.showFlutterToast(strMsg: 'Error while picking file');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.95),
      body: Padding(
        padding: EdgeInsets.only(top: 4.h, left: 2.h, right: 2.h),
        child: SingleChildScrollView(
          child: Column(
            children: [
              BackButtonscreen(
                text: Languages.of(context)!.editprofile,
              ),
              SizedBox(
                height: 4.h,
              ),
              Center(
                child: CircleAvatar(
                  radius: 40,
                  backgroundColor: AppColors.colorGrey,
                  // backgroundImage: AssetImage(
                  //   AppImages.profile,
                  // ) as ImageProvider,
                  backgroundImage: imagefiles != null
                      ? FileImage(File(imagefiles!.path))
                      : widget.profileuserdata![0].avatar != null
                          ? NetworkImage(APIURL.imageurl +
                              widget.profileuserdata![0].avatar.toString())
                          : AssetImage(
                              AppImages.profile,
                            ) as ImageProvider,
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: InkWell(
                      onTap: () {
                        // _editProfileController.showPopupMenu();
                        openImages();
                      },
                      child: CircleAvatar(
                        radius: 2.h,
                        backgroundColor: AppColors.appPrimarycolor,
                        child: Icon(
                          Icons.edit,
                          color: Colors.white,
                          size: 15,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 4.h,
              ),
              Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        height: 1.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            Languages.of(context)!.firstname,
                            style: AppStyle.mytexttitle
                                .copyWith(color: AppColors.colorGrey),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      TextFormScreen(
                        hinttext: Languages.of(context)!.firstname,
                        icon: Icons.account_circle,
                        textEditingController: firstnameController,
                        validator: AppValidator.nameValidator,
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            Languages.of(context)!.lastname,
                            style: AppStyle.mytexttitle
                                .copyWith(color: AppColors.colorGrey),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      TextFormScreen(
                        hinttext: Languages.of(context)!.lastname,
                        icon: Icons.account_circle,
                        textEditingController: lastnameController,
                        validator: AppValidator.lastnameValidator,
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            Languages.of(context)!.email,
                            style: AppStyle.mytexttitle
                                .copyWith(color: AppColors.colorGrey),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      TextFormScreen(
                        hinttext: Languages.of(context)!.email,
                        icon: Icons.mail,
                        textEditingController: emailController,
                        validator: AppValidator.emailValidator,
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            Languages.of(context)!.mobile,
                            style: AppStyle.mytexttitle
                                .copyWith(color: AppColors.colorGrey),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      TextFormScreen(
                        hinttext: Languages.of(context)!.mobile,
                        icon: Icons.phone_android_rounded,
                        textEditingController: mobileController,
                        validator: AppValidator.mobileValidator,
                      ),
                    ],
                  )),
              SizedBox(
                height: 5.h,
              ),
              !isLoading
                  ? ButtonWidget(
                      text: Languages.of(context)!.update,
                      onTap: () {
                        if (isLoading) {
                          return;
                        }

                        update(
                          firstnameController.text,
                          lastnameController.text,
                          emailController.text,
                          mobileController.text,
                        );

                        submitupdate();
                      },
                    )
                  : ButtonWidgetLoader(),
              SizedBox(
                height: 4.h,
              ),
            ],
          ),
        ),
      ),
    );
  }

  update(firstname, lastname, email, mobile) async {
    setState(() {
      isLoading = true;
    });

    if (_formKey.currentState!.validate()) {
      // DialogHelper.showFlutterToast(strMsg: "Profile Update Successfully!");
    } else {
      setState(() {
        isLoading = false;
      });
    }
  }
}
