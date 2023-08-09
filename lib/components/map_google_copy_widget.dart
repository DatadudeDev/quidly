import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/maps_custom/maps_custom_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'map_google_copy_model.dart';
export 'map_google_copy_model.dart';

class MapGoogleCopyWidget extends StatefulWidget {
  const MapGoogleCopyWidget({
    Key? key,
    this.parameter1,
  }) : super(key: key);

  final LatLng? parameter1;

  @override
  _MapGoogleCopyWidgetState createState() => _MapGoogleCopyWidgetState();
}

class _MapGoogleCopyWidgetState extends State<MapGoogleCopyWidget> {
  late MapGoogleCopyModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MapGoogleCopyModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<UserPostsRecord>>(
      stream: queryUserPostsRecord(
        queryBuilder: (userPostsRecord) =>
            userPostsRecord.where('postUser', isEqualTo: currentUserReference),
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
        List<UserPostsRecord> containerUserPostsRecordList = snapshot.data!;
        return Container(
          width: 165.0,
          height: 120.0,
          decoration: BoxDecoration(
            color: Color(0xAB000000),
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: StreamBuilder<List<LocationVotesRecord>>(
            stream: queryLocationVotesRecord(),
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
              List<LocationVotesRecord> containerLocationVotesRecordList =
                  snapshot.data!;
              return Container(
                width: 100.0,
                height: 100.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: wrapWithModel(
                  model: _model.mapsCustomModel,
                  updateCallback: () => setState(() {}),
                  child: MapsCustomWidget(),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
