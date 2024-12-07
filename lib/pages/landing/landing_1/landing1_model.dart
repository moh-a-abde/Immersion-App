import '/components/select_langauge_tab_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'landing1_widget.dart' show Landing1Widget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Landing1Model extends FlutterFlowModel<Landing1Widget> {
  ///  State fields for stateful widgets in this page.

  // Model for selectLangaugeTab component.
  late SelectLangaugeTabModel selectLangaugeTabModel;

  @override
  void initState(BuildContext context) {
    selectLangaugeTabModel =
        createModel(context, () => SelectLangaugeTabModel());
  }

  @override
  void dispose() {
    selectLangaugeTabModel.dispose();
  }
}
