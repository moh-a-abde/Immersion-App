import '/components/card_activity_set/card_activity_set_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'nearby_visited_widget.dart' show NearbyVisitedWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class NearbyVisitedModel extends FlutterFlowModel<NearbyVisitedWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for cardActivitySet component.
  late CardActivitySetModel cardActivitySetModel;

  @override
  void initState(BuildContext context) {
    cardActivitySetModel = createModel(context, () => CardActivitySetModel());
  }

  @override
  void dispose() {
    cardActivitySetModel.dispose();
  }
}
