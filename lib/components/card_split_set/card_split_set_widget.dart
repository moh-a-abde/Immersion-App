import '/components/card_split/card_split_widget.dart';
import '/components/card_split_add/card_split_add_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'card_split_set_model.dart';
export 'card_split_set_model.dart';

class CardSplitSetWidget extends StatefulWidget {
  const CardSplitSetWidget({super.key});

  @override
  State<CardSplitSetWidget> createState() => _CardSplitSetWidgetState();
}

class _CardSplitSetWidgetState extends State<CardSplitSetWidget> {
  late CardSplitSetModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CardSplitSetModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      scrollDirection: Axis.vertical,
      children: [
        wrapWithModel(
          model: _model.cardSplitModel1,
          updateCallback: () => safeSetState(() {}),
          child: CardSplitWidget(),
        ),
        wrapWithModel(
          model: _model.cardSplitModel2,
          updateCallback: () => safeSetState(() {}),
          child: CardSplitWidget(),
        ),
        wrapWithModel(
          model: _model.cardSplitModel3,
          updateCallback: () => safeSetState(() {}),
          child: CardSplitWidget(),
        ),
        wrapWithModel(
          model: _model.cardSplitModel4,
          updateCallback: () => safeSetState(() {}),
          child: CardSplitWidget(),
        ),
        wrapWithModel(
          model: _model.cardSplitModel5,
          updateCallback: () => safeSetState(() {}),
          child: CardSplitWidget(),
        ),
        wrapWithModel(
          model: _model.cardSplitModel6,
          updateCallback: () => safeSetState(() {}),
          child: CardSplitWidget(),
        ),
        wrapWithModel(
          model: _model.cardSplitAddModel,
          updateCallback: () => safeSetState(() {}),
          child: CardSplitAddWidget(),
        ),
      ],
    );
  }
}
