import '/components/card_split_set_copy/card_split_set_copy_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'it_view_widget.dart' show ItViewWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ItViewModel extends FlutterFlowModel<ItViewWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for cardSplitSetCopy component.
  late CardSplitSetCopyModel cardSplitSetCopyModel;

  @override
  void initState(BuildContext context) {
    cardSplitSetCopyModel = createModel(context, () => CardSplitSetCopyModel());
  }

  @override
  void dispose() {
    cardSplitSetCopyModel.dispose();
  }
}
