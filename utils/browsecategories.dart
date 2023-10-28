import 'package:edukaapp/utils/appcolors.dart';
import 'package:edukaapp/utils/appstyle.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class BrowseCategories extends StatelessWidget {
  const BrowseCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text("Browse Categories",
                maxLines: 1,
                style: AppStyle.texttitle
                    .copyWith(color: AppColors.colorBlack, fontSize: 18.sp)),
          ],
        ),
        SizedBox(
          height: 2.h,
        ),
        ListView.builder(
            itemCount: 5,
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            physics: const PageScrollPhysics(),
            itemBuilder: (context, index) {
              return Padding(
                  padding: EdgeInsets.only(top: 1.h, bottom: 2.h),
                  child: InkWell(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.adjust_rounded,
                              size: 2.h,
                            ),
                            SizedBox(
                              width: 2.w,
                            ),
                            Text("Mobile App Development",
                                maxLines: 1,
                                style: AppStyle.textsubtitle.copyWith(
                                    color:
                                        AppColors.colorBlack.withOpacity(0.6))),
                          ],
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 2.h,
                        ),
                      ],
                    ),

                    // Icon(Icons.bookmark_add_outlined),
                  ));
            }),
      ],
    );
  }
}
