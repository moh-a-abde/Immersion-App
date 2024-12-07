import '/components/card_split_copy/card_split_copy_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'card_split_set_copy_model.dart';
export 'card_split_set_copy_model.dart';

class CardSplitSetCopyWidget extends StatefulWidget {
  const CardSplitSetCopyWidget({super.key});

  @override
  State<CardSplitSetCopyWidget> createState() => _CardSplitSetCopyWidgetState();
}

class _CardSplitSetCopyWidgetState extends State<CardSplitSetCopyWidget> {
  late CardSplitSetCopyModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CardSplitSetCopyModel());

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
        Container(
          decoration: BoxDecoration(),
          child: Stack(
            children: [
              Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(0.0, -9.0),
                      child: Text(
                        FFLocalizations.of(context).getText(
                          'wv8295xi' /* 1. The Great Pyramid of Giza.
 */
                          ,
                        ),
                        style: FlutterFlowTheme.of(context).titleLarge.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).titleLargeFamily,
                              letterSpacing: 0.0,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context)
                                      .titleLargeFamily),
                            ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: wrapWithModel(
                        model: _model.cardSplitCopyModel,
                        updateCallback: () => safeSetState(() {}),
                        child: CardSplitCopyWidget(),
                      ),
                    ),
                    Text(
                      FFLocalizations.of(context).getText(
                        'pgu46dsc' /* The Great Pyramid of Giza, als... */,
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).bodyMediumFamily,
                            letterSpacing: 0.0,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context).bodyMediumFamily),
                          ),
                    ),
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        await launchURL(
                            'https://www.google.com/maps/place/The+Great+Pyramid+of+Giza/@29.9791705,31.1316297,17z/data=!3m1!4b1!4m6!3m5!1s0x14584587ac8f291b:0x810c2f3fa2a52424!8m2!3d29.9791705!4d31.1342046!16zL20vMDM2bWs?entry=ttu&g_ep=EgoyMDI0MTAyOS4wIKXMDSoASAFQAw%3D%3D');
                      },
                      child: Text(
                        FFLocalizations.of(context).getText(
                          'gaw3yjac' /* Find On Google Maps */,
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).bodyMediumFamily,
                              letterSpacing: 0.0,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context)
                                      .bodyMediumFamily),
                            ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
