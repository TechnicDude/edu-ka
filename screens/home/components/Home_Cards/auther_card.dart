import 'package:edukaapp/api/api.dart';
import 'package:edukaapp/model/api_models/autherlist_model.dart';
import 'package:edukaapp/page_routes/routes.dart';
import 'package:edukaapp/utils/appcolors.dart';
import 'package:edukaapp/utils/appimages.dart';
import 'package:edukaapp/utils/appstyle.dart';
import 'package:edukaapp/utils/networkimages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../utils/appStringfile.dart';

class AutherCard extends StatelessWidget {
  final List<AutherlistData>? autherlistdata;
  final String type;
  final String searchString;
  const AutherCard(
      {Key? key,
      required this.autherlistdata,
      required this.type,
      required this.searchString})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 17.h,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: autherlistdata!.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  Routes.instructureProfiledetails,
                  arguments: {
                    StringFile.autherdetails: autherlistdata![index],
                    StringFile.autherName: autherlistdata![index].fullName ?? ''
                  },
                );
                // .then((value) {
                //   callback!("ok");
                // });
              },
              child: Padding(
                padding: EdgeInsets.only(left: 1.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 12.h,
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(10.h)),
                        child: NetWorkImageScreen(
                          image: (APIURL.bannerimage +
                              autherlistdata![index].avatar!),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    SizedBox(
                      width: 25.w,
                      child: Center(
                        child: Text(autherlistdata![index].fullName!,

                            //"John Morly",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: AppStyle.textcatsubtitle
                                .copyWith(fontSize: 15.sp)),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ));
  }
}
