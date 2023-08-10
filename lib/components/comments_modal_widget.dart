import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'comments_modal_model.dart';
export 'comments_modal_model.dart';

class CommentsModalWidget extends StatefulWidget {
  const CommentsModalWidget({
    Key? key,
    this.parameter1,
  }) : super(key: key);

  final DocumentReference? parameter1;

  @override
  _CommentsModalWidgetState createState() => _CommentsModalWidgetState();
}

class _CommentsModalWidgetState extends State<CommentsModalWidget> {
  late CommentsModalModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CommentsModalModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
