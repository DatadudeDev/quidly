import '/backend/backend.dart';
import '/components/profile_devz_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'profile_other_user_model.dart';
export 'profile_other_user_model.dart';

class ProfileOtherUserWidget extends StatefulWidget {
  const ProfileOtherUserWidget({
    Key? key,
    this.userDetails,
  }) : super(key: key);

  final UsersRecord? userDetails;

  @override
  _ProfileOtherUserWidgetState createState() => _ProfileOtherUserWidgetState();
}

class _ProfileOtherUserWidgetState extends State<ProfileOtherUserWidget> {
  late ProfileOtherUserModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProfileOtherUserModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<UsersRecord>(
      stream: UsersRecord.getDocument(widget.userDetails!.reference),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        final profileOtherUserUsersRecord = snapshot.data!;
        return Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            automaticallyImplyLeading: false,
            leading: FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 30.0,
              buttonSize: 46.0,
              icon: Icon(
                Icons.arrow_back_rounded,
                color: FlutterFlowTheme.of(context).grayIcon,
                size: 24.0,
              ),
              onPressed: () async {
                context.pop();
              },
            ),
            actions: [],
            centerTitle: false,
            elevation: 0.0,
          ),
          body: SafeArea(
            top: true,
            child: wrapWithModel(
              model: _model.profileDevzModel,
              updateCallback: () => setState(() {}),
              child: ProfileDevzWidget(
                parameter1: profileOtherUserUsersRecord.bio,
                parameter2: profileOtherUserUsersRecord,
                parameter3: profileOtherUserUsersRecord.reference,
              ),
            ),
          ),
        );
      },
    );
  }
}
