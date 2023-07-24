// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'map_google_model.dart';
export 'map_google_model.dart';

class MapGoogleWidget extends StatefulWidget {
  const MapGoogleWidget({
    Key? key,
    this.parameter1,
  }) : super(key: key);

  final LatLng? parameter1;

  @override
  _MapGoogleWidgetState createState() => _MapGoogleWidgetState();
}

class _MapGoogleWidgetState extends State<MapGoogleWidget> {
  late MapGoogleModel _model;

  LatLng? currentUserLocationValue;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MapGoogleModel());

    getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0), cached: true)
        .then((loc) => setState(() => currentUserLocationValue = loc));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  GoogleMarkerColor getMarkerColor(int voteAnswer) {
    switch (voteAnswer) {
      case 1:
        return GoogleMarkerColor.red;
      case 2:
        return GoogleMarkerColor.blue;
      case 3:
        return GoogleMarkerColor.yellow;
      case 4:
        return GoogleMarkerColor.green;
      default:
        return GoogleMarkerColor.violet;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (currentUserLocationValue == null) {
      return Container(
        color: FlutterFlowTheme.of(context).primaryBackground,
        child: Center(
          child: SizedBox(
            width: 100,
            height: 100,
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                FlutterFlowTheme.of(context).primary,
              ),
            ),
          ),
        ),
      );
    }

    return StreamBuilder<List<LocationVotesRecord>>(
      stream: queryLocationVotesRecord(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 100,
              height: 100,
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
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            borderRadius: BorderRadius.circular(10),
          ),
          child: FlutterFlowGoogleMap(
            controller: _model.googleMapsController,
            onCameraIdle: (latLng) =>
                setState(() => _model.googleMapsCenter = latLng),
            initialLocation: _model.googleMapsCenter ??=
                currentUserLocationValue!,
            markers: containerLocationVotesRecordList
                .map(
                  (containerLocationVotesRecord) => FlutterFlowMarker(
                    containerLocationVotesRecord.reference.path,
                    containerLocationVotesRecord.voteLocation!,
                  ),
                )
                .toList(),
            mapType: MapType.hybrid,
            style: GoogleMapStyle.standard,
            initialZoom: 3,
            allowInteraction: true,
            allowZoom: true,
            showZoomControls: false,
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
