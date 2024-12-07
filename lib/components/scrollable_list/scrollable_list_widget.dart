import '/components/card_split_set/card_split_set_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'scrollable_list_model.dart';
export 'scrollable_list_model.dart';

class ScrollableListWidget extends StatefulWidget {
  const ScrollableListWidget({super.key});

  @override
  State<ScrollableListWidget> createState() => _ScrollableListWidgetState();
}

class _ScrollableListWidgetState extends State<ScrollableListWidget> {
  late ScrollableListModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ScrollableListModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return wrapWithModel(
      model: _model.cardSplitSetModel,
      updateCallback: () => safeSetState(() {}),
      child: CardSplitSetWidget(),
    );
  }
}
