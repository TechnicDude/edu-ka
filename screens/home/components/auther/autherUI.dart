import 'package:edukaapp/api/api.dart';
import 'package:edukaapp/model/api_models/autherlist_model.dart';
import 'package:edukaapp/page_routes/routes.dart';
import 'package:edukaapp/utils/appStringfile.dart';
import 'package:edukaapp/utils/appcolors.dart';
import 'package:edukaapp/utils/appimages.dart';
import 'package:edukaapp/utils/appstyle.dart';
import 'package:edukaapp/utils/networkimages.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AutherUI extends StatelessWidget {
  final List<AutherlistData>? autherlistdata;
  final String type;
  final Function? callback;
  const AutherUI(
      {Key? key,
      required this.autherlistdata,
      required this.type,
      this.callback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisSpacing: 15,
        crossAxisSpacing: 10,
        crossAxisCount: 3,
        childAspectRatio: MediaQuery.of(context).size.width /
            (MediaQuery.of(context).size.height / 1.7),
      ),
      itemCount: autherlistdata!.length,
      shrinkWrap: true,
      physics: BouncingScrollPhysics(),
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
            ).then((value) {
              callback!("ok");
            });
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 12.h,
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(10.h)),
                  child: NetWorkImageScreen(
                    image:
                        (APIURL.bannerimage + autherlistdata![index].avatar!),
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
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style:
                          AppStyle.textcatsubtitle.copyWith(fontSize: 16.sp)),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
