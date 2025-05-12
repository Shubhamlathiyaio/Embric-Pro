import 'package:embric/app/commons/build_botton.dart';
import 'package:embric/app/commons/common_text.dart';
import 'package:embric/app/constants/app_colors.dart';
import 'package:embric/app/constants/app_sizes.dart';
import 'package:embric/app/controlles/design_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TotalSummaryCard extends StatelessWidget {
  final Rx<double> Function() getTotal;
  final VoidCallback onClear;
  final VoidCallback onSave;

  const TotalSummaryCard({
    super.key,
    required this.getTotal,
    required this.onClear,
    required this.onSave,
  });

  String getT() {
    final Rx<double> temp = getTotal();
    return temp.value.toStringAsFixed(2);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(AppSizes.pagePadding),
        margin: EdgeInsets.symmetric(horizontal: AppSizes.pagePadding),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(AppSizes.borderRadiusMedium),
          boxShadow: [
            BoxShadow(
              color: AppColors.softTextColor.withOpacity(0.15),
              blurRadius: AppSizes.borderRadiusMedium,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CommonText(
              'Total Stitches',
              fontSize: AppSizes.fontSmall,
              fontWeight: FontWeight.w600,
              fontColor: AppColors.softTextColor,
            ),
            SizedBox(height: AppSizes.sectionSpacing),
            Obx(
              () => CommonText(
                getT(),
                fontSize: AppSizes.fontLarge,
                fontWeight: FontWeight.bold,
                fontColor: AppColors.blackColor,
              ),
            ),
            SizedBox(height: AppSizes.sectionSpacing),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BuildButton(
                  text: 'CLEAR',
                  onTap: onClear,
                  filled: false,
                ),
                Obx(
                  () => BuildButton(
                    text: Get.find<DesignController>().isEdit.value
                        ? 'UPDATE'
                        : 'SAVE',
                    onTap: onSave,
                    filled: true,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
