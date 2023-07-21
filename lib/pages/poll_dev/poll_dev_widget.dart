import '/components/create_poll_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'poll_dev_model.dart';
export 'poll_dev_model.dart';

class PollDevWidget extends StatefulWidget {
  const PollDevWidget({Key? key}) : super(key: key);

  @override
  _PollDevWidgetState createState() => _PollDevWidgetState();
}

class _PollDevWidgetState extends State<PollDevWidget> {
  late PollDevModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PollDevModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Color(0x00FFFFFF),
        body: SafeArea(
          top: true,
          child: wrapWithModel(
            model: _model.createPollModel,
            updateCallback: () => setState(() {}),
            child: CreatePollWidget(),
          ),
        ),
      ),
    );
  }
}
