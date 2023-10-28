import 'package:edukaapp/page_routes/routes.dart';
import 'package:edukaapp/screens/favorite/favoritescreen.dart';

import 'package:edukaapp/screens/profilepage/profilescreen.dart';
import 'package:edukaapp/screens/myCourses/mycourse.dart';
import 'package:edukaapp/utils/appbar.dart';
import 'package:edukaapp/utils/appcolors.dart';
import 'package:edukaapp/utils/appimages.dart';
import 'package:edukaapp/utils/appstyle.dart';
import 'package:edukaapp/utils/backbutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../localization/Language/languages.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.95),
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: AppBarScreens(
            text: Languages.of(context)!.notification,
          )),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ListView.builder(
                  itemCount: 5,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(
                          top: 2.h, left: 1.5.h, right: 1.5.h, bottom: 0.2.h),
                      child: InkWell(
                        child: Slidable(
                          actionPane: SlidableDrawerActionPane(),
                          actionExtentRatio: 0.25,
                          secondaryActions: <Widget>[
                            IconSlideAction(
                              caption: "delete",
                              onTap: () {
                                _dialogBuilder(context);
                              },
                              iconWidget: Center(
                                child: Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                  size: 25,
                                ),
                              ),
                            ),
                          ],
                          child: Column(
                            children: [
                              Container(
                                height: 8.h,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(1.h),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey,
                                      spreadRadius: 1.5,
                                      blurRadius: 1,
                                      offset: Offset(
                                          1, 2), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(1.h),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      CircleAvatar(
                                          backgroundColor: Colors.black,
                                          radius: 3.h,
                                          backgroundImage: AssetImage(
                                            AppImages.applogo,
                                          )),
                                      SizedBox(
                                        width: 2.w,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            width: 68.w,
                                            child: Text(
                                                'Facebook Gillar notification center',
                                                style: AppStyle.textcatsubtitle
                                                    .copyWith(fontSize: 15.sp)),
                                          ),
                                          SizedBox(
                                            height: 0.5.h,
                                          ),
                                          SizedBox(
                                            width: 68.w,
                                            child: Text(
                                                'The base use cases for GetSocial Notifications API is to build notify',
                                                style:
                                                    AppStyle.textsubsubtitle),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }

  _dialogBuilder(
    BuildContext context,
  ) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Alert!'),
          content: const Text(
              'Are you sure you want to delete refrigerator ingredients'),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('No'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Yes'),
              onPressed: () {
                //  delete(id);
              },
            ),
          ],
        );
      },
    );
  }
}
