import 'package:edukaapp/localization/Language/languages.dart';
import 'package:edukaapp/utils/appcolors.dart';
import 'package:edukaapp/utils/appstyle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ButtonWidget extends StatefulWidget {
  final String? text;
  final Function()? onTap;
  const ButtonWidget({
    Key? key,
    this.text,
    this.onTap,
  }) : super(key: key);

  @override
  State<ButtonWidget> createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 24),
      child: ElevatedButton.icon(
        onPressed: widget.onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.appPrimarycolor,
          minimumSize: const Size(double.infinity, 56),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(25),
              bottomRight: Radius.circular(25),
              bottomLeft: Radius.circular(25),
            ),
          ),
        ),
        icon: const Icon(
          CupertinoIcons.arrow_right,
          color: Colors.white,
        ),
        label: Text(
          widget.text ?? '',
          style: AppStyle.onbaordtitle,
        ),
      ),
    );
  }
}
