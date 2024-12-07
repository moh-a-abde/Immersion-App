import '/components/card_split/card_split_widget.dart';
import '/components/card_split_add/card_split_add_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'card_split_set_widget.dart' show CardSplitSetWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CardSplitSetModel extends FlutterFlowModel<CardSplitSetWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for cardSplit component.
  late CardSplitModel cardSplitModel1;
  // Model for cardSplit component.
  late CardSplitModel cardSplitModel2;
  // Model for cardSplit component.
  late CardSplitModel cardSplitModel3;
  // Model for cardSplit component.
  late CardSplitModel cardSplitModel4;
  // Model for cardSplit component.
  late CardSplitModel cardSplitModel5;
  // Model for cardSplit component.
  late CardSplitModel cardSplitModel6;
  // Model for cardSplitAdd component.
  late CardSplitAddModel cardSplitAddModel;

  @override
  void initState(BuildContext context) {
    cardSplitModel1 = createModel(context, () => CardSplitModel());
    cardSplitModel2 = createModel(context, () => CardSplitModel());
    cardSplitModel3 = createModel(context, () => CardSplitModel());
    cardSplitModel4 = createModel(context, () => CardSplitModel());
    cardSplitModel5 = createModel(context, () => CardSplitModel());
    cardSplitModel6 = createModel(context, () => CardSplitModel());
    cardSplitAddModel = createModel(context, () => CardSplitAddModel());
  }

  @override
  void dispose() {
    cardSplitModel1.dispose();
    cardSplitModel2.dispose();
    cardSplitModel3.dispose();
    cardSplitModel4.dispose();
    cardSplitModel5.dispose();
    cardSplitModel6.dispose();
    cardSplitAddModel.dispose();
  }
}
