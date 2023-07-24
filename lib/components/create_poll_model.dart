import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_place_picker.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/place.dart';
import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CreatePollModel extends FlutterFlowModel {
  ///  Local state fields for this component.

  String? poll = '';

  String? answer1 = '';

  String? answer2 = '';

  String? answer3 = '';

  String? answer4 = '';

  DateTime? pollExpiry;

  String? imageURL;

  String? nullExpiry = '';

  DateTime? date1;

  DateTime? date2;

  DateTime? date3;

  FFPlace? pollLocation;

  bool locationEnforced = false;

  FFPlace? loc1;

  FFPlace? loc2;

  FFPlace? loc3;

  bool writeIn = true;

  bool multipleChoice = false;

  bool trueFalse = false;

  bool imageChoice = false;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - API (apiTest)] action in Button widget.
  ApiCallResponse? apiResultpwv;
  // Stores action output result for [Backend Call - API (getURL)] action in Button widget.
  ApiCallResponse? apiResult9jo;
  // State field(s) for TextField widget.
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for choicesTWOanswerONE widget.
  TextEditingController? choicesTWOanswerONEController1;
  String? Function(BuildContext, String?)?
      choicesTWOanswerONEController1Validator;
  // State field(s) for choicesTWOanswerTWO widget.
  TextEditingController? choicesTWOanswerTWOController1;
  String? Function(BuildContext, String?)?
      choicesTWOanswerTWOController1Validator;
  DateTime? datePicked1;
  // State field(s) for PlacePicker widget.
  var placePickerValue1 = FFPlace();
  // State field(s) for choicesTHREEanswerONE widget.
  TextEditingController? choicesTHREEanswerONEController;
  String? Function(BuildContext, String?)?
      choicesTHREEanswerONEControllerValidator;
  // State field(s) for choicesTHREEanswerTWO widget.
  TextEditingController? choicesTHREEanswerTWOController;
  String? Function(BuildContext, String?)?
      choicesTHREEanswerTWOControllerValidator;
  // State field(s) for choicesTHREEanswerTHREE widget.
  TextEditingController? choicesTHREEanswerTHREEController;
  String? Function(BuildContext, String?)?
      choicesTHREEanswerTHREEControllerValidator;
  DateTime? datePicked2;
  // State field(s) for PlacePicker widget.
  var placePickerValue2 = FFPlace();
  // State field(s) for choicesFOURanswerONE widget.
  TextEditingController? choicesFOURanswerONEController;
  String? Function(BuildContext, String?)?
      choicesFOURanswerONEControllerValidator;
  // State field(s) for choicesFOURanswerTWO widget.
  TextEditingController? choicesFOURanswerTWOController;
  String? Function(BuildContext, String?)?
      choicesFOURanswerTWOControllerValidator;
  // State field(s) for choicesFOURanswerTHREE widget.
  TextEditingController? choicesFOURanswerTHREEController;
  String? Function(BuildContext, String?)?
      choicesFOURanswerTHREEControllerValidator;
  // State field(s) for choicesFOURanswerFOUR widget.
  TextEditingController? choicesFOURanswerFOURController;
  String? Function(BuildContext, String?)?
      choicesFOURanswerFOURControllerValidator;
  DateTime? datePicked3;
  // State field(s) for PlacePicker widget.
  var placePickerValue3 = FFPlace();
  // State field(s) for choicesTWOanswerONE widget.
  TextEditingController? choicesTWOanswerONEController2;
  String? Function(BuildContext, String?)?
      choicesTWOanswerONEController2Validator;
  // State field(s) for choicesTWOanswerTWO widget.
  TextEditingController? choicesTWOanswerTWOController2;
  String? Function(BuildContext, String?)?
      choicesTWOanswerTWOController2Validator;
  DateTime? datePicked4;
  // State field(s) for PlacePicker widget.
  var placePickerValue4 = FFPlace();

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    textController1?.dispose();
    choicesTWOanswerONEController1?.dispose();
    choicesTWOanswerTWOController1?.dispose();
    choicesTHREEanswerONEController?.dispose();
    choicesTHREEanswerTWOController?.dispose();
    choicesTHREEanswerTHREEController?.dispose();
    choicesFOURanswerONEController?.dispose();
    choicesFOURanswerTWOController?.dispose();
    choicesFOURanswerTHREEController?.dispose();
    choicesFOURanswerFOURController?.dispose();
    choicesTWOanswerONEController2?.dispose();
    choicesTWOanswerTWOController2?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
