import 'package:edukaapp/api/api.dart';
import 'package:edukaapp/model/api_models/autherlist_model.dart';
import 'package:edukaapp/provider/dashboard_Provider.dart';
import 'package:edukaapp/utils/appcolors.dart';
import 'package:edukaapp/utils/appstyle.dart';
import 'package:edukaapp/utils/loaderscreen.dart';
import 'package:edukaapp/utils/networkimages.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class InstructureProfiledetails extends StatefulWidget {
  final AutherlistData autherdetails;
  final String autherName;

  const InstructureProfiledetails(
      {Key? key, required this.autherdetails, required this.autherName})
      : super(key: key);

  @override
  State<InstructureProfiledetails> createState() =>
      _InstructureProfiledetailsState();
}

class _InstructureProfiledetailsState extends State<InstructureProfiledetails> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white.withOpacity(0.95),
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: AppColors.colorBlack,
          ),
          backgroundColor: Colors.white.withOpacity(0.95),
          elevation: 0,
          title: Text(
            "Instructor",
            style: AppStyle.texttitle.copyWith(color: Colors.black),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(2.h),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: 10.h,
                      width: 20.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        border:
                            Border.all(color: AppColors.colorGrey, width: 1),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(10.h)),
                        child: NetWorkImageScreen(
                          image: (APIURL.bannerimage +
                              widget.autherdetails.avatar!),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.autherdetails.fullName!,
                          style: AppStyle.texttitle
                              .copyWith(color: Colors.black, fontSize: 20.sp),
                        ),
                        Text(
                          widget.autherdetails.roleName ?? '',
                          style: AppStyle.textsubsubtitle
                              .copyWith(color: Colors.black),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 4.h,
                ),
                Row(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Total students",
                          style: AppStyle.texttitle
                              .copyWith(color: Colors.black, fontSize: 14.sp),
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Text(
                          "609,696",
                          style: AppStyle.texttitle
                              .copyWith(color: Colors.black, fontSize: 16.sp),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Reviews",
                          style: AppStyle.texttitle
                              .copyWith(color: Colors.black, fontSize: 14.sp),
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Text(
                          "609,696",
                          style: AppStyle.texttitle
                              .copyWith(color: Colors.black, fontSize: 16.sp),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 4.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "About me",
                          style:
                              AppStyle.texttitle.copyWith(color: Colors.black),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        FittedBox(
                          child: SizedBox(
                            width: 90.w,
                            child: Text(
                              widget.autherdetails.about ?? '',
                              //"We're an education technology company with a mission to elevate student success, \namplify the power of teaching, and inspire everyone to learn together. \nYou can add the page to the student to-do list by clicking the Add to student to-do checkbox [2]. When you add a page to the student to-do, the to-do displays in the student's to-do list as well as the in the course calendar and students' course sidebar To Do list. \n\nYou can add the page to the student to-do list by clicking the Add to student to-do checkbox [2]. When you add a page to the student to-do, the to-do displays in the student's to-do list as well as the in the course calendar and students' course sidebar To Do list.",
                              style: AppStyle.textsubsubtitle.copyWith(
                                  color: Colors.black, fontSize: 15.sp),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
