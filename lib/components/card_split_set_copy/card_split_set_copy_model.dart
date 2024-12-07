import '/components/card_split_copy/card_split_copy_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'card_split_set_copy_widget.dart' show CardSplitSetCopyWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CardSplitSetCopyModel extends FlutterFlowModel<CardSplitSetCopyWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for cardSplitCopy component.
  late CardSplitCopyModel cardSplitCopyModel;

  @override
  void initState(BuildContext context) {
    cardSplitCopyModel = createModel(context, () => CardSplitCopyModel());
  }

  @override
  void dispose() {
    cardSplitCopyModel.dispose();
  }
}
