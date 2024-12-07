import '/components/split_square_card/split_square_card_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'card_activity_set_copy_widget.dart' show CardActivitySetCopyWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CardActivitySetCopyModel
    extends FlutterFlowModel<CardActivitySetCopyWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for splitSquareCard component.
  late SplitSquareCardModel splitSquareCardModel1;
  // Model for splitSquareCard component.
  late SplitSquareCardModel splitSquareCardModel2;
  // Model for splitSquareCard component.
  late SplitSquareCardModel splitSquareCardModel3;

  @override
  void initState(BuildContext context) {
    splitSquareCardModel1 = createModel(context, () => SplitSquareCardModel());
    splitSquareCardModel2 = createModel(context, () => SplitSquareCardModel());
    splitSquareCardModel3 = createModel(context, () => SplitSquareCardModel());
  }

  @override
  void dispose() {
    splitSquareCardModel1.dispose();
    splitSquareCardModel2.dispose();
    splitSquareCardModel3.dispose();
  }
}
