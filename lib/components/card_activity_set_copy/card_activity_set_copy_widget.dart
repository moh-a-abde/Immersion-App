import '/components/split_square_card/split_square_card_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'card_activity_set_copy_model.dart';
export 'card_activity_set_copy_model.dart';

class CardActivitySetCopyWidget extends StatefulWidget {
  const CardActivitySetCopyWidget({super.key});

  @override
  State<CardActivitySetCopyWidget> createState() =>
      _CardActivitySetCopyWidgetState();
}

class _CardActivitySetCopyWidgetState extends State<CardActivitySetCopyWidget> {
  late CardActivitySetCopyModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CardActivitySetCopyModel());

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
          model: _model.splitSquareCardModel1,
          updateCallback: () => safeSetState(() {}),
          child: SplitSquareCardWidget(),
        ),
        wrapWithModel(
          model: _model.splitSquareCardModel2,
          updateCallback: () => safeSetState(() {}),
          child: SplitSquareCardWidget(),
        ),
        wrapWithModel(
          model: _model.splitSquareCardModel3,
          updateCallback: () => safeSetState(() {}),
          child: SplitSquareCardWidget(),
        ),
      ],
    );
  }
}
