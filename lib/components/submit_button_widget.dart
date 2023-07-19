import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'submit_button_model.dart';
export 'submit_button_model.dart';

class SubmitButtonWidget extends StatefulWidget {
  const SubmitButtonWidget({
    Key? key,
    this.parameter1,
    this.parameter2,
    this.parameter3,
    this.parameter4,
  }) : super(key: key);

  final String? parameter1;
  final UsersRecord? parameter2;
  final DocumentReference? parameter3;
  final DocumentReference? parameter4;

  @override
  _SubmitButtonWidgetState createState() => _SubmitButtonWidgetState();
}

class _SubmitButtonWidgetState extends State<SubmitButtonWidget> {
  late SubmitButtonModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SubmitButtonModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
      child: StreamBuilder<List<VotesRecord>>(
        stream: queryVotesRecord(
          singleRecord: true,
        ),
        builder: (context, snapshot) {
          // Customize what your widget looks like when it's loading.
          if (!snapshot.hasData) {
            return Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            );
          }
          List<VotesRecord> buttonVotesRecordList = snapshot.data!;
          // Return an empty Container when the item does not exist.
          if (snapshot.data!.isEmpty) {
            return Container();
          }
          final buttonVotesRecord = buttonVotesRecordList.isNotEmpty
              ? buttonVotesRecordList.first
              : null;
          return FFButtonWidget(
            onPressed: () async {
              context.pushNamed(
                'postDetails',
                queryParameters: {
                  'userRecord': serializeParam(
                    widget.parameter2,
                    ParamType.Document,
                  ),
                  'postReference': serializeParam(
                    widget.parameter3,
                    ParamType.DocumentReference,
                  ),
                }.withoutNulls,
                extra: <String, dynamic>{
                  'userRecord': widget.parameter2,
                },
              );

              await VotesRecord.collection.doc().set(createVotesRecordData(
                    user: currentUserReference,
                    poll: widget.parameter4,
                    vote: widget.parameter1,
                  ));
            },
            text: widget.parameter1!,
            options: FFButtonOptions(
              width: 80.0,
              height: 50.0,
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
              iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
              color: Color(0xFFA24E8C),
              textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                    fontFamily: 'Urbanist',
                    color: Colors.white,
                  ),
              elevation: 3.0,
              borderSide: BorderSide(
                color: FlutterFlowTheme.of(context).background,
                width: 2.0,
              ),
              borderRadius: BorderRadius.circular(12.0),
            ),
          );
        },
      ),
    );
  }
}
