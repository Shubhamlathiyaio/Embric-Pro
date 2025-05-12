import 'package:embric/app/controlles/design_form_controller.dart';
import 'package:embric/app/models/design_entity.dart';
import 'package:embric/app/models/design_part_entity.dart';
import 'package:embric/app/services/defaults.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DesignController extends GetxController {
  final DesignFormController formController = Get.find<DesignFormController>();
  Rx<DesignEntity> design = Rx<DesignEntity>(getDefaultDesign());
  Rx<bool> isEdit = false.obs;

  // Totals for each part
  final cPalluTotal = 0.0.obs;
  final palluTotal = 0.0.obs;
  final stkTotal = 0.0.obs;
  final blzTotal = 0.0.obs;
  final grandTotal = 0.0.obs;

  int get id => design.value.id ?? 0;
  double get stitchRate => _getDoubleFromController(formController.stitchRateController);
  double get addOnPrice => _getDoubleFromController(formController.addOnPriceController);
  String get number => formController.designNumberController.text;
  String get name => formController.designNameController.text;

  @override
  void onInit() {
    super.onInit();
    _bindControllers();
    updateTotal();
  }

  void _bindControllers() {
    // Bind all controllers to update totals
    for (var controller in [
      formController.stitchRateController,
      formController.addOnPriceController,
      formController.cPalluHeadController,
      formController.cPalluStitchesController,
      formController.palluHeadController,
      formController.palluStitchesController,
      formController.stkHeadController,
      formController.stkStitchesController,
      formController.blzHeadController,
      formController.blzStitchesController,
    ]) {
      controller.addListener(updateTotal);
    }
  }

void _updatePartValues(
  DesignPartEntity part,
  TextEditingController headCtrl,
  TextEditingController stitchesCtrl,
) {
  // Get the values from the text controllers
  double headValue = _getDoubleFromController(headCtrl);
  double stitchesValue = _getDoubleFromController(stitchesCtrl);

  // Update the part's values using copyWith
  final updatedPart = part.copyWith(
    head: headValue,
    stitches: stitchesValue,
  );

  // Now, update the respective part of the DesignEntity
  design.value = design.value.copyWith(
    cPallu: part == design.value.cPallu ? updatedPart : design.value.cPallu,
    pallu: part == design.value.pallu ? updatedPart : design.value.pallu,
    stk: part == design.value.stk ? updatedPart : design.value.stk,
    blz: part == design.value.blz ? updatedPart : design.value.blz,
  );

  // Save the updated design to Hive
  design.value.save();
}


  void updateTotal() {
    if (formController.isInitializing) return;
    
    _updatePartValues(design.value.cPallu, formController.cPalluHeadController, formController.cPalluStitchesController);
    _updatePartValues(design.value.pallu, formController.palluHeadController, formController.palluStitchesController);
    _updatePartValues(design.value.stk, formController.stkHeadController, formController.stkStitchesController);
    _updatePartValues(design.value.blz, formController.blzHeadController, formController.blzStitchesController);

    // Update totals
    cPalluTotal.value = design.value.cPallu.total(stitchRate);
    palluTotal.value = design.value.pallu.total(stitchRate);
    stkTotal.value = design.value.stk.total(stitchRate);
    blzTotal.value = design.value.blz.total(stitchRate);
    grandTotal.value = finalTotal();
  }

  double finalTotal() {
    return cPalluTotal.value + palluTotal.value + stkTotal.value + blzTotal.value + addOnPrice;
  }

  // Helper method to safely get double value from TextEditingController
  double _getDoubleFromController(TextEditingController controller) {
    return double.tryParse(controller.text) ?? 0.0;
  }

  void saveDesign() {
    _setDesignData();
    // TODO: Save the design object
    clearAllFields();
  }

  void updateDesign() {
    _setDesignData();
    // TODO: Update the design object
    clearAllFields();
  }

void _setDesignData() {
  final updatedDesign = design.value.copyWith(
    number: number,
    name: name,
    stitchRate: stitchRate,
    addOnPrice: addOnPrice,
  );
  
  // Assign the updated design back to Rx
  design.value = updatedDesign;

  // Save the updated design to Hive
  design.value.save();
}

  bool isAtLeastOnePartHasData() {
    return [
      [formController.cPalluHeadController, formController.cPalluStitchesController],
      [formController.palluHeadController, formController.palluStitchesController],
      [formController.stkHeadController, formController.stkStitchesController],
      [formController.blzHeadController, formController.blzStitchesController],
    ].any((pair) => pair[0].text.isNotEmpty && pair[1].text.isNotEmpty);
  }

  void validator() {
    if (isAtLeastOnePartHasData() && formController.stitchRateController.text.isNotEmpty) {
      //Get.to(() => AddDesignView());
    } else {
      Get.snackbar(
        "Validation Error",
        "Any Field Can Not Be Empty",
        backgroundColor: Colors.red.withOpacity(.6),
        colorText: Colors.white,
        barBlur: 8,
      );
    }
  }

  void clearAllFields() {
    formController.resetForm();
    updateTotal();
  }
}
