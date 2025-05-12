import 'package:embric/app/constants/app_sizes.dart';
import 'package:embric/app/controlles/design_controller.dart';
import 'package:embric/app/controlles/design_form_controller.dart';
import 'package:embric/app/views/commons/total_summary_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class CalculatorView extends StatelessWidget {
  CalculatorView({super.key});
  final designCtr = Get.find<DesignController>();
  final form = Get.find<DesignFormController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Calculator')),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            spacing: AppSizes.sectionSpacing,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [Center(child: Text('Calculator View'))],
          ),
        ),
      ),
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: SizedBox(
        height: Get.height * .2,
        child: TotalSummaryCard(
          getTotal: () => designCtr.grandTotal,
          onClear: designCtr.clearAllFields,
          onSave: () => designCtr.validator(),
        ),
      ),
    );
  }
}
