import '/components/card_split_set/card_split_set_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'scrollable_list_widget.dart' show ScrollableListWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ScrollableListModel extends FlutterFlowModel<ScrollableListWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for cardSplitSet component.
  late CardSplitSetModel cardSplitSetModel;

  @override
  void initState(BuildContext context) {
    cardSplitSetModel = createModel(context, () => CardSplitSetModel());
  }

  @override
  void dispose() {
    cardSplitSetModel.dispose();
  }
}
