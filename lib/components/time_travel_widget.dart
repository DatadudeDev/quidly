import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'time_travel_model.dart';
export 'time_travel_model.dart';

class TimeTravelWidget extends StatefulWidget {
  const TimeTravelWidget({Key? key}) : super(key: key);

  @override
  _TimeTravelWidgetState createState() => _TimeTravelWidgetState();
}

class _TimeTravelWidgetState extends State<TimeTravelWidget> {
  late TimeTravelModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TimeTravelModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * 1.0,
      height: 10.0,
      decoration: BoxDecoration(),
      child: Slider(
        activeColor: FlutterFlowTheme.of(context).primary,
        inactiveColor: Color(0xB9B2B2B2),
        min: 0.0,
        max: 10.0,
        value: _model.sliderValue ??= 5.0,
        divisions: 10,
        onChanged: (newValue) {
          newValue = double.parse(newValue.toStringAsFixed(2));
          setState(() => _model.sliderValue = newValue);
        },
      ),
    );
  }
}
