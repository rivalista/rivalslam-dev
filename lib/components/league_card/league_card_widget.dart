import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'league_card_model.dart';
export 'league_card_model.dart';

class LeagueCardWidget extends StatefulWidget {
  const LeagueCardWidget({
    super.key,
    required this.league,
  });

  final LeagueStruct? league;

  @override
  State<LeagueCardWidget> createState() => _LeagueCardWidgetState();
}

class _LeagueCardWidgetState extends State<LeagueCardWidget> {
  late LeagueCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LeagueCardModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Stack(
      children: [
        Container(
          width: 120.0,
          height: 130.0,
          decoration: BoxDecoration(
            color: FFAppState().SelectedLeague.contains(widget.league?.id)
                ? Color(0xFF3C3C3C)
                : Color(0x00000000),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: CachedNetworkImage(
                    fadeInDuration: Duration(milliseconds: 500),
                    fadeOutDuration: Duration(milliseconds: 500),
                    imageUrl: widget.league!.logo,
                    width: 65.0,
                    height: 65.0,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 10.0),
                  child: Text(
                    valueOrDefault<String>(
                      widget.league?.name,
                      'name',
                    ),
                    maxLines: 1,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          font: GoogleFonts.barlowSemiCondensed(
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.italic,
                          ),
                          color: Color(0xFFB4B4B4),
                          fontSize: 15.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.italic,
                        ),
                  ),
                ),
              ),
              SizedBox(
                width: 100.0,
                child: Divider(
                  thickness: 1.0,
                  color: Color(0xFF3C3C3C),
                ),
              ),
            ],
          ),
        ),
        InkWell(
          splashColor: Colors.transparent,
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () async {
            if (FFAppState().SelectedLeague.contains(widget.league?.id)) {
              FFAppState().removeFromSelectedLeague(widget.league!.id);
              safeSetState(() {});
            } else {
              FFAppState().addToSelectedLeague(widget.league!.id);
              safeSetState(() {});
            }
          },
          child: Container(
            width: 120.0,
            height: 130.0,
            decoration: BoxDecoration(
              color: Color(0x00FFFFFF),
            ),
            child: Visibility(
              visible:
                  FFAppState().SelectedLeague.contains(widget.league?.id) ==
                      true,
              child: Align(
                alignment: AlignmentDirectional(1.0, -1.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 10.0, 0.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: SvgPicture.asset(
                      'assets/images/tick.svg',
                      width: 30.0,
                      height: 30.0,
                      fit: BoxFit.cover,
                      alignment: Alignment(1.0, -1.0),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
