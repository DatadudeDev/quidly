import '/backend/backend.dart';
import '/components/profile_devz_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProfileDevModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // Model for profileDevz component.
  late ProfileDevzModel profileDevzModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    profileDevzModel = createModel(context, () => ProfileDevzModel());
  }

  void dispose() {
    profileDevzModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
