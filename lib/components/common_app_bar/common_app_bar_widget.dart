import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'common_app_bar_model.dart';
export 'common_app_bar_model.dart';

class CommonAppBarWidget extends StatefulWidget {
  const CommonAppBarWidget({
    super.key,
    required this.title,
    bool? showBackIcon,
  }) : this.showBackIcon = showBackIcon ?? false;

  final String? title;
  final bool showBackIcon;

  @override
  State<CommonAppBarWidget> createState() => _CommonAppBarWidgetState();
}

class _CommonAppBarWidgetState extends State<CommonAppBarWidget> {
  late CommonAppBarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CommonAppBarModel());
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
      height: MediaQuery.sizeOf(context).height * 0.8,
      constraints: BoxConstraints(
        minHeight: 80.0,
        maxHeight: 80.0,
      ),
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryText,
        image: DecorationImage(
          fit: BoxFit.fitWidth,
          image: Image.asset(
            'assets/images/Group_34.png',
          ).image,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: MediaQuery.sizeOf(context).width * 0.15,
            height: 100.0,
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
                  if (widget.showBackIcon == true)
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
                        size: 24.0,
                      ),
                    ),
                ],
              ),
            ),
          ),
          Container(
            height: 70.0,
            decoration: BoxDecoration(),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  valueOrDefault<String>(
                    widget.title,
                    'Title',
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        font: GoogleFonts.barlowSemiCondensed(
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.italic,
                        ),
                        color: Color(0xFFFEFEFE),
                        fontSize: 24.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.italic,
                      ),
                ),
              ],
            ),
          ),
          Container(
            width: MediaQuery.sizeOf(context).width * 0.15,
            height: 100.0,
            decoration: BoxDecoration(),
          ),
        ],
      ),
    );
  }
}
