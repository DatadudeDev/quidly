import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CreatePollModel extends FlutterFlowModel {
  ///  Local state fields for this component.

  String? imageURL;

  DocumentReference? user;

  String? poll = 'random';

  String answer1 = '';

  String answer2 = '';

  String answer3 = '';

  String answer4 = '';

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - API (apiTest)] action in Button widget.
  ApiCallResponse? apiResult47j;
  // Stores action output result for [Backend Call - API (getURL)] action in Button widget.
  ApiCallResponse? apiResult1m6;
  // State field(s) for POLL widget.
  TextEditingController? pollController;
  String? Function(BuildContext, String?)? pollControllerValidator;
  // State field(s) for choicesTWOanswerONE widget.
  TextEditingController? choicesTWOanswerONEController;
  String? Function(BuildContext, String?)?
      choicesTWOanswerONEControllerValidator;
  // State field(s) for choicesTWOanswerTWO widget.
  TextEditingController? choicesTWOanswerTWOController;
  String? Function(BuildContext, String?)?
      choicesTWOanswerTWOControllerValidator;
  // State field(s) for choicesTHREEanswerONE widget.
  TextEditingController? choicesTHREEanswerONEController;
  String? Function(BuildContext, String?)?
      choicesTHREEanswerONEControllerValidator;
  // State field(s) for choicesTHREEanswerTWO widget.
  TextEditingController? choicesTHREEanswerTWOController;
  String? Function(BuildContext, String?)?
      choicesTHREEanswerTWOControllerValidator;
  // State field(s) for choiceTHREEanswerTHREE widget.
  TextEditingController? choiceTHREEanswerTHREEController;
  String? Function(BuildContext, String?)?
      choiceTHREEanswerTHREEControllerValidator;
  // State field(s) for choicesFOURanswerONE widget.
  TextEditingController? choicesFOURanswerONEController;
  String? Function(BuildContext, String?)?
      choicesFOURanswerONEControllerValidator;
  // State field(s) for choicesFOURanswerTWO widget.
  TextEditingController? choicesFOURanswerTWOController;
  String? Function(BuildContext, String?)?
      choicesFOURanswerTWOControllerValidator;
  // State field(s) for choiceFOURanswerTHREE widget.
  TextEditingController? choiceFOURanswerTHREEController;
  String? Function(BuildContext, String?)?
      choiceFOURanswerTHREEControllerValidator;
  // State field(s) for choicesFOURanswerFOUR widget.
  TextEditingController? choicesFOURanswerFOURController;
  String? Function(BuildContext, String?)?
      choicesFOURanswerFOURControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    pollController?.dispose();
    choicesTWOanswerONEController?.dispose();
    choicesTWOanswerTWOController?.dispose();
    choicesTHREEanswerONEController?.dispose();
    choicesTHREEanswerTWOController?.dispose();
    choiceTHREEanswerTHREEController?.dispose();
    choicesFOURanswerONEController?.dispose();
    choicesFOURanswerTWOController?.dispose();
    choiceFOURanswerTHREEController?.dispose();
    choicesFOURanswerFOURController?.dispose();
  }

  /// Action blocks are added here.

  Future uRLimage(BuildContext context) async {}

  /// Additional helper methods are added here.
}
