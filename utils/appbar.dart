import 'package:edukaapp/utils/appcolors.dart';
import 'package:edukaapp/utils/appstyle.dart';
import 'package:flutter/material.dart';

class AppBarScreens extends StatelessWidget {
  final String? image;
  final String? text;
  final String? icon2;
  final String? icon3;

  final Function()? onPressed;
  const AppBarScreens({
    Key? key,
    this.image,
    this.text,
    this.icon2,
    this.icon3,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
      centerTitle: true,
      elevation: 0,
      backgroundColor: Colors.white.withOpacity(0.95),
      title: Text(
        text ?? '',
        style: AppStyle.texttitle.copyWith(color: Colors.black),
      ),
      actions: [
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.start,
        //   children: [
        //     IconButton(
        //       onPressed: onPressed,
        //       icon: Icon(Icons.notifications_outlined),
        //       color: colorBlack,
        //     ),
        //   ],
        // ),
      ],
    );
  }
}
