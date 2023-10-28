import 'package:edukaapp/api/api.dart';
import 'package:edukaapp/model/api_models/categort_model.dart';
import 'package:edukaapp/page_routes/routes.dart';
import 'package:edukaapp/utils/appcolors.dart';
import 'package:edukaapp/utils/appimages.dart';
import 'package:edukaapp/utils/appstyle.dart';
import 'package:edukaapp/utils/networkimages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../utils/appStringfile.dart';

class CategoriesCard extends StatelessWidget {
  final List<CategoryData>? categorydata;
  final String type;
  final String searchString;
  const CategoriesCard(
      {Key? key,
      required this.categorydata,
      required this.type,
      required this.searchString})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 10.h,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: categorydata!.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  // if (type == "category") {
                  //   if (categorydata![index].subCategories != null) {
                  //     if (categorydata![index].subCategories!.isNotEmpty) {
                  //       Navigator.pushNamed(
                  //         context,
                  //         Routes.subcategorieScreen,
                  //         arguments: {
                  //           StringFile.categoryId:
                  //               categorydata![index].id.toString(),
                  //           StringFile.categoryName: categorydata![index].title,
                  //           StringFile.subcategory:
                  //               categorydata![index].subCategories,
                  //         },
                  //       );
                  //     } else {
                  //       Navigator.pushNamed(
                  //           context, Routes.courseDetailsScreen);
                  //     }
                  //   } else {
                  //     Navigator.pushNamed(context, Routes.courseDetailsScreen);
                  //   }
                  // } else {
                  //   Navigator.pushNamed(context, Routes.courseDetailsScreen);
                  //   // Navigator.pushNamed(
                  //   //   context,
                  //   //   Routes.courseDetailsScreen,
                  //   // arguments: {
                  //   // StringFile.subcategorysads:
                  //   //     finalcategories[index].categorySlug ?? '',
                  //   // },
                  //   // );
                  // }
                },
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: 28.w,
                      decoration: BoxDecoration(
                        color: AppColors.colorWhite,
                        borderRadius: BorderRadius.all(Radius.circular(1.h)),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(1.h)),
                        child: NetWorkImageScreen(
                          image: (categorydata![index].icon!),
                        ),
                      ),
                    ),
                    Container(
                      height: 10.h,
                      width: 28.w,
                      decoration: BoxDecoration(
                        color: AppColors.colorGrey.withOpacity(0.7),
                        borderRadius: BorderRadius.circular(1.h),
                      ),
                      child: Center(
                        child: Padding(
                          padding: EdgeInsets.all(1.h),
                          child: Text(
                            categorydata![index].title!,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: AppStyle.textcatsubtitle.copyWith(
                                color: Colors.white,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
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
