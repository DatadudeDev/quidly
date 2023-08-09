import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/create_modal/create_modal_widget.dart';
import '/components/post_menu/post_menu_widget.dart';
import '/components/time_travel_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_charts.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:flip_card/flip_card.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomePageModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  int? pieDefault1 = 25;

  ///  State fields for stateful widgets in this page.

  // Models for timeTravel dynamic component.
  late FlutterFlowDynamicModels<TimeTravelModel> timeTravelModels;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    timeTravelModels = FlutterFlowDynamicModels(() => TimeTravelModel());
  }

  void dispose() {
    timeTravelModels.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
