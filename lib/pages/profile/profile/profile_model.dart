import '/components/card_activity_set/card_activity_set_widget.dart';
import '/components/card_activity_set_copy/card_activity_set_copy_widget.dart';
import '/components/scrollable_list/scrollable_list_widget.dart';
import '/components/select_language_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_button_tabbar.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_language_selector.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'profile_widget.dart' show ProfileWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class ProfileModel extends FlutterFlowModel<ProfileWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for selectLanguage component.
  late SelectLanguageModel selectLanguageModel;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // Model for scrollableList component.
  late ScrollableListModel scrollableListModel;
  // Model for cardActivitySet component.
  late CardActivitySetModel cardActivitySetModel;
  // Model for cardActivitySetCopy component.
  late CardActivitySetCopyModel cardActivitySetCopyModel;

  @override
  void initState(BuildContext context) {
    selectLanguageModel = createModel(context, () => SelectLanguageModel());
    scrollableListModel = createModel(context, () => ScrollableListModel());
    cardActivitySetModel = createModel(context, () => CardActivitySetModel());
    cardActivitySetCopyModel =
        createModel(context, () => CardActivitySetCopyModel());
  }

  @override
  void dispose() {
    selectLanguageModel.dispose();
    tabBarController?.dispose();
    scrollableListModel.dispose();
    cardActivitySetModel.dispose();
    cardActivitySetCopyModel.dispose();
  }
}
