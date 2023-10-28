import 'package:edukaapp/screens/GloabeSearch/globlesearch.dart';
import 'package:edukaapp/utils/appstyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 2.h, right: 2.h, left: 2.h),
      child: Center(
        child: SizedBox(
          height: 6.h,
          child: InkWell(
            child: TextField(
              decoration: InputDecoration(
                isDense: true,
                suffixIcon: Padding(
                  padding: EdgeInsets.all(1.h),
                  child: SizedBox(
                    height: 1.0.h,
                    child: CircleAvatar(
                      backgroundColor: Colors.black,
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        icon: InkWell(
                          child: Icon(
                            Icons.close,
                            size: 20,
                          ),
                        ),
                        color: Colors.white,
                        onPressed: () {},
                      ),
                    ),
                  ),
                ),
                hintText: 'Search',
                hintStyle: AppStyle.textsubsubtitle,
                border: InputBorder.none,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
