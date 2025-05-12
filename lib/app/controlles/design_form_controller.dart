import 'package:embric/app/models/design_entity.dart';
import 'package:embric/app/services/defaults.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DesignFormController extends GetxController {
  // Controllers for main fields and part fields
  final designNumberController = TextEditingController();
  final designNameController = TextEditingController();
  final stitchRateController = TextEditingController();
  final addOnPriceController = TextEditingController();

  final cPalluHeadController = TextEditingController();
  final cPalluStitchesController = TextEditingController();
  final palluHeadController = TextEditingController();
  final palluStitchesController = TextEditingController();
  final stkHeadController = TextEditingController();
  final stkStitchesController = TextEditingController();
  final blzHeadController = TextEditingController();
  final blzStitchesController = TextEditingController();

  final RxList<String> selectedImages = <String>[].obs;
  bool isInitializing = false;

  @override
  void onInit() {
    super.onInit();
    fillForm(getDefaultDesign());
  }

  // Fill form with design data
  void fillForm(DesignEntity design) {
    isInitializing = true;
    designNumberController.text = design.number;
    designNameController.text = design.name;
    stitchRateController.text = sanitizeDoubleInput(design.stitchRate, flexible: false);
    addOnPriceController.text = sanitizeDoubleInput(design.addOnPrice);

    // Assign part data
    cPalluHeadController.text = sanitizeDoubleInput(design.cPallu.head);
    cPalluStitchesController.text = sanitizeDoubleInput(design.cPallu.stitches);
    palluHeadController.text = sanitizeDoubleInput(design.pallu.head);
    palluStitchesController.text = sanitizeDoubleInput(design.pallu.stitches);
    stkHeadController.text = sanitizeDoubleInput(design.stk.head);
    stkStitchesController.text = sanitizeDoubleInput(design.stk.stitches);
    blzHeadController.text = sanitizeDoubleInput(design.blz.head);
    blzStitchesController.text = sanitizeDoubleInput(design.blz.stitches);

    selectedImages.clear();
    isInitializing = false;
  }

  // Reset the form fields
  void resetForm() {
    isInitializing = true;
    designNumberController.clear();
    designNameController.clear();
    stitchRateController.text = sanitizeDoubleInput(kStitchRate.toString(), flexible: false);
    addOnPriceController.clear();

    // Reset part fields
    cPalluHeadController.text = sanitizeDoubleInput(kcPalluHead.toString());
    cPalluStitchesController.clear();
    palluHeadController.text = sanitizeDoubleInput(kpalluHead.toString());
    palluStitchesController.clear();
    stkHeadController.text = sanitizeDoubleInput(kstkHead.toString());
    stkStitchesController.clear();
    blzHeadController.text = sanitizeDoubleInput(kblzHead.toString());
    blzStitchesController.clear();

    selectedImages.clear();
    isInitializing = false;
  }

  // Sanitize input for double values
  String sanitizeDoubleInput(dynamic value, {bool flexible = true}) {
    if (value == 0 || value == 0.0) return '';
    if (value is double) value = value.toString();

    if (flexible) {
      value = value.replaceAll(RegExp(r'[^0-9.]'), '');
      int firstDotIndex = value.indexOf('.');

      if (firstDotIndex != -1) {
        value = value.substring(0, firstDotIndex + 1) + value.substring(firstDotIndex + 1).replaceAll('.', '');
      }

      if (value.endsWith('.')) return value;

      double parsed = double.tryParse(value) ?? 0.0;
      String result = parsed.toStringAsFixed(2);

      return result.endsWith('.00') ? result.substring(0, result.length - 3) : result;
    }

    double parsed = double.tryParse(value) ?? 0.0;
    return parsed.toStringAsFixed(2);
  }

  @override
  void onClose() {
    designNumberController.dispose();
    designNameController.dispose();
    stitchRateController.dispose();
    addOnPriceController.dispose();

    cPalluHeadController.dispose();
    cPalluStitchesController.dispose();
    palluHeadController.dispose();
    palluStitchesController.dispose();
    stkHeadController.dispose();
    stkStitchesController.dispose();
    blzHeadController.dispose();
    blzStitchesController.dispose();

    super.onClose();
  }
}
