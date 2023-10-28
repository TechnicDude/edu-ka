import 'package:edukaapp/model/api_models/categort_model.dart';
import 'package:edukaapp/page_routes/routes.dart';
import 'package:edukaapp/utils/appStringfile.dart';
import 'package:edukaapp/utils/appcolors.dart';
import 'package:edukaapp/utils/appstyle.dart';
import 'package:edukaapp/utils/networkimages.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AllCategoriesUI extends StatelessWidget {
  final List<CategoryData>? categorydata;
  final String type;
  final String searchString;
  const AllCategoriesUI(
      {Key? key,
      required this.categorydata,
      required this.type,
      required this.searchString})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisSpacing: 14,
        crossAxisSpacing: 20,
        crossAxisCount: 2,
        childAspectRatio: MediaQuery.of(context).size.width /
            (MediaQuery.of(context).size.height / 2.6),
      ),
      itemCount: categorydata!.length,
      shrinkWrap: true,
      physics: BouncingScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
          onTap: () {
            if (type == "category") {
              if (categorydata![index].subCategories != null) {
                if (categorydata![index].subCategories!.isNotEmpty) {
                  Navigator.pushNamed(
                    context,
                    Routes.subcategorieScreen,
                    arguments: {
                      StringFile.categoryId: categorydata![index].id.toString(),
                      StringFile.categoryName: categorydata![index].title,
                      StringFile.subcategory:
                          categorydata![index].subCategories,
                    },
                  );
                } else {
                  Navigator.pushNamed(context, Routes.courseDetailsScreen);
                }
              } else {
                Navigator.pushNamed(context, Routes.courseDetailsScreen);
              }
            } else {
              Navigator.pushNamed(context, Routes.courseDetailsScreen);
              // Navigator.pushNamed(
              //   context,
              //   Routes.courseDetailsScreen,
              // arguments: {
              // StringFile.subcategorysads:
              //     finalcategories[index].categorySlug ?? '',
              // },
              // );
            }
          },
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.colorWhite,
              borderRadius: BorderRadius.all(Radius.circular(1.h)),
              border: Border.all(color: AppColors.colorWhite, width: 1),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  spreadRadius: 1,
                  blurRadius: 1,
                  offset: Offset(1, 1),
                ),
              ],
            ),
            child: Column(
              children: [
                Container(
                  height: 12.h,
                  width: 100.w,
                  decoration: BoxDecoration(
                    color: AppColors.colorWhite.withOpacity(0.5),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(1.h),
                      topRight: Radius.circular(1.h),
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(1.h),
                      topRight: Radius.circular(1.h),
                    ),
                    //  borderRadius: BorderRadius.all(Radius.circular(1.h)),
                    child: NetWorkImageScreen(
                      height: 2.h,
                      image: (categorydata![index].icon.toString()),
                    ),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: EdgeInsets.all(0.5.h),
                    child: Text(categorydata![index].title!,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style:
                            AppStyle.textcatsubtitle.copyWith(fontSize: 16.sp)),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
