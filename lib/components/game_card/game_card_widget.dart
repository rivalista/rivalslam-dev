import '/backend/schema/structs/index.dart';
import '/components/league_card/league_card_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'game_card_model.dart';
export 'game_card_model.dart';

class GameCardWidget extends StatefulWidget {
  const GameCardWidget({
    super.key,
    required this.game,
  });

  final GameStruct? game;

  @override
  State<GameCardWidget> createState() => _GameCardWidgetState();
}

class _GameCardWidgetState extends State<GameCardWidget> {
  late GameCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GameCardModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * 1.0,
      decoration: BoxDecoration(),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(12.0, 15.0, 12.0, 15.0),
            child: Text(
              valueOrDefault<String>(
                widget.game?.name,
                'Football',
              ),
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    font: GoogleFonts.barlowSemiCondensed(
                      fontWeight:
                          FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                      fontStyle: FontStyle.italic,
                    ),
                    color: Color(0xFFFEFEFE),
                    fontSize: 17.0,
                    letterSpacing: 0.0,
                    fontWeight:
                        FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                    fontStyle: FontStyle.italic,
                  ),
            ),
          ),
          Flexible(
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
              child: Container(
                decoration: BoxDecoration(),
                child: Builder(
                  builder: (context) {
                    final leagues = widget.game?.leagues.toList() ?? [];

                    return Wrap(
                      spacing: 0.0,
                      runSpacing: 0.0,
                      alignment: WrapAlignment.start,
                      crossAxisAlignment: WrapCrossAlignment.start,
                      direction: Axis.horizontal,
                      runAlignment: WrapAlignment.center,
                      verticalDirection: VerticalDirection.down,
                      clipBehavior: Clip.none,
                      children: List.generate(leagues.length, (leaguesIndex) {
                        final leaguesItem = leagues[leaguesIndex];
                        return wrapWithModel(
                          model: _model.leagueCardModels.getModel(
                            leaguesIndex.toString(),
                            leaguesIndex,
                          ),
                          updateCallback: () => safeSetState(() {}),
                          child: LeagueCardWidget(
                            key: Key(
                              'Key9rz_${leaguesIndex.toString()}',
                            ),
                            league: LeagueStruct(
                              id: leaguesItem.id,
                              name: leaguesItem.name,
                              logo: leaguesItem.logo,
                            ),
                          ),
                        );
                      }),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
