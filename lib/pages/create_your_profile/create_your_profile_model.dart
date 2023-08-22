import '/components/create_profile_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CreateYourProfileModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  bool isMale = false;

  int? userAge;

  FFPlace? homeLocation;

  ///  State fields for stateful widgets in this page.

  // Model for createProfile component.
  late CreateProfileModel createProfileModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    createProfileModel = createModel(context, () => CreateProfileModel());
  }

  void dispose() {
    createProfileModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
