import '/backend/schema/structs/index.dart';
import '/components/common_pagination_app_bar/common_pagination_app_bar_widget.dart';
import '/components/game_card/game_card_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'tap_leagues_view_copy_model.dart';
export 'tap_leagues_view_copy_model.dart';

class TapLeaguesViewCopyWidget extends StatefulWidget {
  const TapLeaguesViewCopyWidget({
    super.key,
    this.userName,
    this.college,
    this.homeTowm,
    this.livesIn,
  });

  final String? userName;
  final String? college;
  final String? homeTowm;
  final String? livesIn;

  static String routeName = 'TapLeaguesViewCopy';
  static String routePath = '/tapLeaguesViewCopy';

  @override
  State<TapLeaguesViewCopyWidget> createState() =>
      _TapLeaguesViewCopyWidgetState();
}

class _TapLeaguesViewCopyWidgetState extends State<TapLeaguesViewCopyWidget> {
  late TapLeaguesViewCopyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TapLeaguesViewCopyModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().teamNames = functions
          .teamsList()
          .map((e) => getJsonField(
                e,
                r'''$.FOOTBALL[:].team_name[:]''',
              ))
          .toList()
          .map((e) => e.toString())
          .toList()
          .toList()
          .cast<String>();
      safeSetState(() {});
      FFAppState().teamLogos = functions
          .teamsList()
          .map((e) => getJsonField(
                e,
                r'''$.FOOTBALL[:].team_logo[:]''',
              ))
          .toList()
          .cast<String>()
          .toList()
          .cast<String>();
      safeSetState(() {});
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryText,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(110.0),
          child: AppBar(
            backgroundColor: Color(0xFF40861C),
            automaticallyImplyLeading: false,
            actions: [],
            flexibleSpace: FlexibleSpaceBar(
              title: Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Stack(
                  children: [
                    wrapWithModel(
                      model: _model.commonPaginationAppBarModel,
                      updateCallback: () => safeSetState(() {}),
                      child: CommonPaginationAppBarWidget(
                        showBackIcon: true,
                        currentPage: 3,
                        title: 'TAP YOUR LEAGUES',
                        skipActionValue: 'tapLeagues',
                      ),
                    ),
                  ],
                ),
              ),
              background: ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(0.0),
                  bottomRight: Radius.circular(0.0),
                  topLeft: Radius.circular(0.0),
                  topRight: Radius.circular(0.0),
                ),
                child: Image.asset(
                  'assets/images/Group_34.png',
                  fit: BoxFit.cover,
                ),
              ),
              centerTitle: true,
              expandedTitleScale: 1.0,
            ),
            elevation: 0.0,
          ),
        ),
        body: SafeArea(
          top: true,
          child: Container(
            width: MediaQuery.sizeOf(context).width * 1.0,
            height: MediaQuery.sizeOf(context).height * 1.0,
            decoration: BoxDecoration(),
            child: Builder(
              builder: (context) {
                final games = FFAppState().allGames.toList();

                return SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: List.generate(games.length, (gamesIndex) {
                      final gamesItem = games[gamesIndex];
                      return Container(
                        height: 200.0,
                        decoration: BoxDecoration(),
                        child: wrapWithModel(
                          model: _model.gameCardModels.getModel(
                            gamesIndex.toString(),
                            gamesIndex,
                          ),
                          updateCallback: () => safeSetState(() {}),
                          child: GameCardWidget(
                            key: Key(
                              'Keyadu_${gamesIndex.toString()}',
                            ),
                            game: GameStruct(
                              id: gamesItem.id,
                              name: gamesItem.name,
                              leagues: gamesItem.leagues,
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
