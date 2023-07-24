import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'maps_custom_model.dart';
export 'maps_custom_model.dart';

class MapsCustomWidget extends StatefulWidget {
  const MapsCustomWidget({Key? key}) : super(key: key);

  @override
  _MapsCustomWidgetState createState() => _MapsCustomWidgetState();
}

class _MapsCustomWidgetState extends State<MapsCustomWidget> {
  late MapsCustomModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MapsCustomModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<LocationVotesRecord>>(
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
          ),
          child: FlutterFlowGoogleMap(
            controller: _model.googleMapsController,
            onCameraIdle: (latLng) => _model.googleMapsCenter = latLng,
            initialLocation: _model.googleMapsCenter ??=
                LatLng(13.106061, -59.613158),
            markers: containerLocationVotesRecordList
                .map(
                  (containerLocationVotesRecord) => FlutterFlowMarker(
                    containerLocationVotesRecord.reference.path,
                    containerLocationVotesRecord.voteLocation!,
                  ),
                )
                .toList(),
            markerColor: GoogleMarkerColor.violet,
            mapType: MapType.normal,
            style: GoogleMapStyle.dark,
            initialZoom: 14.0,
            allowInteraction: true,
            allowZoom: true,
            showZoomControls: true,
            showLocation: false,
            showCompass: false,
            showMapToolbar: false,
            showTraffic: false,
            centerMapOnMarkerTap: true,
          ),
        );
      },
    );
  }
}
