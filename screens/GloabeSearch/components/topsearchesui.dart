import 'package:edukaapp/utils/appcolors.dart';
import 'package:edukaapp/utils/appstyle.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class TopSearchesUI extends StatelessWidget {
  const TopSearchesUI({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: [
          custombuttonwidget("python"),
          custombuttonwidget("flutter"),
          custombuttonwidget("Node js"),
          custombuttonwidget("dot net "),
        ],
      ),
    );
  }

  custombuttonwidget(String btnval) {
    return Padding(
      padding: EdgeInsets.only(left: 0.5.h, right: 1.h),
      child: Container(
        height: 6.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.h),
          border: Border.all(color: AppColors.colorBlack, width: 1.5),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 1,
              offset: Offset(1, 1),
            )
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(0.5.h),
              child: Text(btnval,
                  style:
                      AppStyle.texttitle.copyWith(color: AppColors.colorBlack)),
            ),
          ],
        ),
      ),
    );
  }
}
