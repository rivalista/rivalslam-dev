import 'package:flutter/material.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

import '/components/score_board/score_board_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';

// Focus widget keys for this walkthrough
final icon98xoyphk = GlobalKey();

/// test
///
///
List<TargetFocus> createWalkthroughTargets(BuildContext context) => [
      /// Step 1
      TargetFocus(
        keyTarget: icon98xoyphk,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.RRect,
        color: FlutterFlowTheme.of(context).customColor1,
        contents: [
          TargetContent(
            align: ContentAlign.top,
            builder: (context, __) => ScoreBoardWidget(),
          ),
        ],
      ),
    ];
