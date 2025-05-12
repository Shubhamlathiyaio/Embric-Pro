import 'package:embric/app/models/design_entity.dart';
import 'package:embric/app/models/design_part_entity.dart';

const double kStitchRate = 0.4;
const double kcPalluHead = 1.5;
const double kpalluHead = 7;
const double kstkHead = 11;
const double kblzHead = 1.5;

double getDefault(DesignPartType type) {
  switch (type) {
    case DesignPartType.cPallu:
      return kcPalluHead;
    case DesignPartType.pallu:
      return kpalluHead;
    case DesignPartType.stk:
      return kstkHead;
    case DesignPartType.blz:
      return kblzHead;
  }
}

DesignEntity getDefaultDesign() => DesignEntity(
  id: 0,
  number: '',
  name: '',
  stitchRate: kStitchRate,
  addOnPrice: 0,
  cPallu: DesignPartEntity(
    type: DesignPartType.cPallu,
    head: kcPalluHead,
    stitches: 0,
  ),
  pallu: DesignPartEntity(type: DesignPartType.pallu, head: kpalluHead, stitches: 0),
  stk: DesignPartEntity(type: DesignPartType.stk, head: kstkHead, stitches: 0),
  blz: DesignPartEntity(type: DesignPartType.blz, head: kblzHead, stitches: 0),

  imagePaths: [],
);