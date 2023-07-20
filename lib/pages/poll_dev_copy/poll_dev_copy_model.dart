import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PollDevCopyModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  String poll = '';

  String answer1 = 'random';

  String answer2 = '';

  String answer3 = '';

  String answer4 = '';

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TextField widget.
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for choicesTWOanswerONE widget.
  TextEditingController? choicesTWOanswerONEController;
  String? Function(BuildContext, String?)?
      choicesTWOanswerONEControllerValidator;
  // State field(s) for choicesTWOanswerTWO widget.
  TextEditingController? choicesTWOanswerTWOController;
  String? Function(BuildContext, String?)?
      choicesTWOanswerTWOControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    textController1?.dispose();
    choicesTWOanswerONEController?.dispose();
    choicesTWOanswerTWOController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
