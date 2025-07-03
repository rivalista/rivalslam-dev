import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'common_pagination_app_bar_model.dart';
export 'common_pagination_app_bar_model.dart';

class CommonPaginationAppBarWidget extends StatefulWidget {
  const CommonPaginationAppBarWidget({
    super.key,
    bool? showBackIcon,
    int? currentPage,
    String? title,
    String? skipActionValue,
  })  : this.showBackIcon = showBackIcon ?? false,
        this.currentPage = currentPage ?? 0,
        this.title = title ?? 'CREATE PROFILE',
        this.skipActionValue = skipActionValue ?? 'createProfile';

  final bool showBackIcon;
  final int currentPage;
  final String title;
  final String skipActionValue;

  @override
  State<CommonPaginationAppBarWidget> createState() =>
      _CommonPaginationAppBarWidgetState();
}

class _CommonPaginationAppBarWidgetState
    extends State<CommonPaginationAppBarWidget> {
  late CommonPaginationAppBarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CommonPaginationAppBarModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryText,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: Image.asset(
            'assets/images/Group_34.png',
          ).image,
        ),
      ),
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(1.0, 0.0, 0.0, 0.0),
                    child: Container(
                      decoration: BoxDecoration(),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          context.safePop();
                        },
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                context.safePop();
                              },
                              child: Icon(
                                Icons.arrow_back,
                                color: Color(0xFFFEFEFE),
                                size: 30.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          valueOrDefault<String>(
                            widget.title,
                            'CREATE PROFILE',
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    font: GoogleFonts.barlowSemiCondensed(
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FontStyle.italic,
                                    ),
                                    color: Color(0xFFFEFEFE),
                                    fontSize: 25.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FontStyle.italic,
                                  ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        if (widget.skipActionValue ==
                            valueOrDefault<String>(
                              _model.createProfile,
                              'createProfile',
                            )) {
                          context.pushNamed(AboutMeViewWidget.routeName);
                        } else {
                          if (widget.skipActionValue ==
                              valueOrDefault<String>(
                                _model.aboutMe,
                                'aboutMe',
                              )) {
                            context.pushNamed(TapLeaguesViewWidget.routeName);
                          } else {
                            if (widget.skipActionValue ==
                                valueOrDefault<String>(
                                  _model.tapLeagues,
                                  'tapLeagues',
                                )) {
                              context.pushNamed(
                                  ChooseFavouritesViewWidget.routeName);
                            } else {
                              if (widget.skipActionValue ==
                                  valueOrDefault<String>(
                                    _model.chooseFav,
                                    'chooseFav',
                                  )) {
                                context.pushNamed(
                                    ChooseRivalsViewWidget.routeName);
                              } else {
                                if (widget.skipActionValue ==
                                    valueOrDefault<String>(
                                      _model.chooseRIvals,
                                      'chooseRivals',
                                    )) {
                                  context.pushNamed(HomeNewWidget.routeName);
                                }
                              }
                            }
                          }
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              10.0, 0.0, 0.0, 0.0),
                          child: Text(
                            'Skip',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.barlowSemiCondensed(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  color: Color(0xFFFEFEFE),
                                  fontSize: 15.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Text(
              'Step ${valueOrDefault<String>(
                widget.currentPage.toString(),
                '0',
              )}/5',
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    font: GoogleFonts.barlowSemiCondensed(
                      fontWeight:
                          FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                    ),
                    color: Color(0x99FEFEFE),
                    fontSize: 15.0,
                    letterSpacing: 0.0,
                    fontWeight:
                        FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                    fontStyle:
                        FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
