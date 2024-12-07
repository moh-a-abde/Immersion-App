import '/components/button_widget.dart';
import '/components/split_square_card_copy/split_square_card_copy_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'card_activity_set_model.dart';
export 'card_activity_set_model.dart';

class CardActivitySetWidget extends StatefulWidget {
  const CardActivitySetWidget({super.key});

  @override
  State<CardActivitySetWidget> createState() => _CardActivitySetWidgetState();
}

class _CardActivitySetWidgetState extends State<CardActivitySetWidget> {
  late CardActivitySetModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CardActivitySetModel());

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
          model: _model.splitSquareCardCopyModel1,
          updateCallback: () => safeSetState(() {}),
          child: SplitSquareCardCopyWidget(),
        ),
        wrapWithModel(
          model: _model.splitSquareCardCopyModel2,
          updateCallback: () => safeSetState(() {}),
          child: SplitSquareCardCopyWidget(),
        ),
        wrapWithModel(
          model: _model.splitSquareCardCopyModel3,
          updateCallback: () => safeSetState(() {}),
          child: SplitSquareCardCopyWidget(),
        ),
        wrapWithModel(
          model: _model.buttonModel,
          updateCallback: () => safeSetState(() {}),
          child: ButtonWidget(),
        ),
      ],
    );
  }
}
