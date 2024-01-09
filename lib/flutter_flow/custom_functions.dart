import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/auth/firebase_auth/auth_util.dart';

List<dynamic> teams() {
  List<dynamic> teams = [
    {
      "teams": [
        {
          "teamA": "ORILLES",
          "teamB": "METS",
          "time": "16:45",
          "date": "11 Nov",
        },
        {
          "teamC": "PATRIOTS",
          "teamD": "COWBOYS",
          "time2": "18:30",
          "date": "11 Nov",
        }
      ],
      "action": [
        {"chat": "Trask Talk", "delete": "Delete"}
      ]
    }
  ];
  return teams;
}

Color hexToColor(String code) {
  return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
}

List<String>? isGroup(List<String>? chatUser) {
  List<String>? group_users = [];

  for (String? str in chatUser!) {
    group_users.add(str!);
  }
  return group_users;
}

List<dynamic> teamsList() {
  List<dynamic> teamsList = [
    {
      "FOOTBALL": [
        {
          "team_logo":
              "https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/rival-slam-u7edmz/assets/hlv4dlj2uyau/nfl.svg",
          "team_name": "NFL"
        },
        {
          "team_logo":
              "https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/rival-slam-u7edmz/assets/7nzommqk63vt/ncaa.svg",
          "team_name": "NCAA"
        }
      ],
      "BASKETBALL": [
        {
          "team_logo":
              "https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/rival-slam-u7edmz/assets/gyxdm1vyooiv/nba.svg",
          "team_name": "NBA"
        },
        {
          "team_logo":
              "https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/rival-slam-u7edmz/assets/4mikz3bsek28/wnba.svg",
          "team_name": "WNBA"
        },
        {
          "team_logo":
              "https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/rival-slam-u7edmz/assets/o9yhtivqxoy0/ncaa(m).svg",
          "team_name": "NCAA(M)"
        },
        {
          "team_logo":
              "https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/rival-slam-u7edmz/assets/69960ki8pmvt/ncaa(w).svg",
          "team_name": "NCAA(W)"
        }
      ]
    }
  ];
  return teamsList;
}

bool? listCount(List<bool>? teamList) {
  bool? countStat;
  if (teamList!.length != 0) {
    countStat = true;
  } else {
    countStat = false;
  }
  return countStat;
}

String? getFavRivalList(List<String>? favRivalList) {
  List<String>? list;
  list = favRivalList;

  final sb = StringBuffer();
  sb.writeAll(list!, ',');

  return sb.toString();
}
