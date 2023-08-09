import '/components/search_dev_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'search_copy_model.dart';
export 'search_copy_model.dart';

class SearchCopyWidget extends StatefulWidget {
  const SearchCopyWidget({Key? key}) : super(key: key);

  @override
  _SearchCopyWidgetState createState() => _SearchCopyWidgetState();
}

class _SearchCopyWidgetState extends State<SearchCopyWidget> {
  late SearchCopyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SearchCopyModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
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
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        body: SafeArea(
          top: true,
          child: wrapWithModel(
            model: _model.searchDevModel,
            updateCallback: () => setState(() {}),
            child: SearchDevWidget(),
          ),
        ),
      ),
    );
  }
}
