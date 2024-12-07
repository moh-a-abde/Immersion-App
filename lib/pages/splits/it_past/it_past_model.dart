import '/components/card_split_set/card_split_set_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'it_past_widget.dart' show ItPastWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ItPastModel extends FlutterFlowModel<ItPastWidget> {
  ///  State fields for stateful widgets in this page.

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
