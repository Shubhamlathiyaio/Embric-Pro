import 'package:embric/app/commons/common_button.dart';
import 'package:embric/app/commons/common_text.dart';
import 'package:embric/app/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BuildButton extends StatelessWidget {
  String text;
  VoidCallback onTap;
  bool filled = false;
  BuildButton({super.key,
  
    required this.text,
    required this.onTap,
    this.filled = false,  
  });

  @override
  Widget build(BuildContext context) {
    return CommonButton(
      onTap: onTap,
      width: Get.width * 0.43,
      height: 45,
      backgroundColor:
          filled ? Theme.of(context).primaryColor : Colors.transparent,
      textColor: filled ? AppColors.whiteColor : Theme.of(context).secondaryHeaderColor,
      borderRadius: 10,
      verticalPadding: 0,
      horizontalPadding: 0,
      // Add outline border for non-filled button
      gradient: filled ? null : null,
      child: CommonText(
        text,
        fontSize: 14,
        fontWeight: FontWeight.w700,
        fontColor: filled ? AppColors.whiteColor : AppColors.blackColor,
      ),
    );
  }
}
