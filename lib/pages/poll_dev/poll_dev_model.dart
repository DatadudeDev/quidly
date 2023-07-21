import '/components/create_poll_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PollDevModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  String poll = '';

  String answer1 = 'random';

  String answer2 = '';

  String answer3 = '';

  String answer4 = '';

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for createPoll component.
  late CreatePollModel createPollModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    createPollModel = createModel(context, () => CreatePollModel());
  }

  void dispose() {
    unfocusNode.dispose();
    createPollModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
