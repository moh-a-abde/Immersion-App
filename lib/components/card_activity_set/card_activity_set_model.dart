import '/components/button_widget.dart';
import '/components/split_square_card_copy/split_square_card_copy_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'card_activity_set_widget.dart' show CardActivitySetWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CardActivitySetModel extends FlutterFlowModel<CardActivitySetWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for splitSquareCardCopy component.
  late SplitSquareCardCopyModel splitSquareCardCopyModel1;
  // Model for splitSquareCardCopy component.
  late SplitSquareCardCopyModel splitSquareCardCopyModel2;
  // Model for splitSquareCardCopy component.
  late SplitSquareCardCopyModel splitSquareCardCopyModel3;
  // Model for button component.
  late ButtonModel buttonModel;

  @override
  void initState(BuildContext context) {
    splitSquareCardCopyModel1 =
        createModel(context, () => SplitSquareCardCopyModel());
    splitSquareCardCopyModel2 =
        createModel(context, () => SplitSquareCardCopyModel());
    splitSquareCardCopyModel3 =
        createModel(context, () => SplitSquareCardCopyModel());
    buttonModel = createModel(context, () => ButtonModel());
  }

  @override
  void dispose() {
    splitSquareCardCopyModel1.dispose();
    splitSquareCardCopyModel2.dispose();
    splitSquareCardCopyModel3.dispose();
    buttonModel.dispose();
  }
}
