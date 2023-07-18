import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'is_username_model.dart';
export 'is_username_model.dart';

class IsUsernameWidget extends StatefulWidget {
  const IsUsernameWidget({Key? key}) : super(key: key);

  @override
  _IsUsernameWidgetState createState() => _IsUsernameWidgetState();
}

class _IsUsernameWidgetState extends State<IsUsernameWidget> {
  late IsUsernameModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => IsUsernameModel());
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
