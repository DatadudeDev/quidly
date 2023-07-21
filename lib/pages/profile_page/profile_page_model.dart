import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/profile_section_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProfilePageModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // Model for profileSection component.
  late ProfileSectionModel profileSectionModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    profileSectionModel = createModel(context, () => ProfileSectionModel());
  }

  void dispose() {
    profileSectionModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
