import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/maps_custom/maps_custom_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MapGoogleCopyModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  // Model for MapsCustom component.
  late MapsCustomModel mapsCustomModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    mapsCustomModel = createModel(context, () => MapsCustomModel());
  }

  void dispose() {
    mapsCustomModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
