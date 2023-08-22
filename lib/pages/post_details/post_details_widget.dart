import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/delete_post/delete_post_widget.dart';
import '/flutter_flow/flutter_flow_charts.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'post_details_model.dart';
export 'post_details_model.dart';

class PostDetailsWidget extends StatefulWidget {
  const PostDetailsWidget({
    Key? key,
    this.postReference,
    this.userRecord,
    int? pieDefault1,
  })  : this.pieDefault1 = pieDefault1 ?? 25,
        super(key: key);

  final DocumentReference? postReference;
  final UsersRecord? userRecord;
  final int pieDefault1;

  @override
  _PostDetailsWidgetState createState() => _PostDetailsWidgetState();
}

class _PostDetailsWidgetState extends State<PostDetailsWidget> {
  late PostDetailsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PostDetailsModel());

    _model.textController ??= TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final chartPieChartColorsList5 = [
      Color(0xFF3C145E),
      Color(0xFF6920A1),
      Color(0xFF2A6CF0),
      FlutterFlowTheme.of(context).info
    ];
    final chartPieChartColorsList7 = [
      Color(0xFF5A073E),
      Color(0xFFA91D72),
      Color(0xFFDD4FAA),
      FlutterFlowTheme.of(context).secondary
    ];
    final chartPieChartColorsList8 = [
      Color(0xFF1C4796),
      Color(0xFF2663E0),
      Color(0xFF4383FF),
      Color(0xFF82ACFF)
    ];
    return StreamBuilder<UserPostsRecord>(
      stream: UserPostsRecord.getDocument(widget.postReference!),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
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
        final postDetailsUserPostsRecord = snapshot.data!;
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          body: SafeArea(
            top: true,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Stack(
                          children: [
                            Container(
                              width: MediaQuery.sizeOf(context).width * 1.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Container(
                                width: MediaQuery.sizeOf(context).width * 1.0,
                                height: 550.0,
                                decoration: BoxDecoration(
                                  color: Color(0x32000000),
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: CachedNetworkImageProvider(
                                      postDetailsUserPostsRecord.imageURL,
                                    ),
                                  ),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(0.0),
                                  child: BackdropFilter(
                                    filter: ImageFilter.blur(
                                      sigmaX: 4.0,
                                      sigmaY: 4.0,
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 50.0, 0.0, 0.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                1.0,
                                            height: 80.0,
                                            decoration: BoxDecoration(),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      width: MediaQuery.sizeOf(
                                                                  context)
                                                              .width *
                                                          0.98,
                                                      height: 80.0,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0xE3000000),
                                                        borderRadius:
                                                            BorderRadius.only(
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  0.0),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  0.0),
                                                          topLeft:
                                                              Radius.circular(
                                                                  20.0),
                                                          topRight:
                                                              Radius.circular(
                                                                  20.0),
                                                        ),
                                                      ),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        3.0),
                                                            child: AutoSizeText(
                                                              postDetailsUserPostsRecord
                                                                  .postPoll,
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              maxLines: 2,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Urbanist',
                                                                    fontSize:
                                                                        30.0,
                                                                  ),
                                                            ),
                                                          ),
                                                          Container(
                                                            width: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width *
                                                                0.9,
                                                            height: 2.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .background,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          StreamBuilder<List<VotesRecord>>(
                                            stream: queryVotesRecord(
                                              queryBuilder: (votesRecord) =>
                                                  votesRecord.where('poll',
                                                      isEqualTo:
                                                          widget.postReference),
                                            ),
                                            builder: (context, snapshot) {
                                              // Customize what your widget looks like when it's loading.
                                              if (!snapshot.hasData) {
                                                return Center(
                                                  child: SizedBox(
                                                    width: 50.0,
                                                    height: 50.0,
                                                    child:
                                                        CircularProgressIndicator(
                                                      valueColor:
                                                          AlwaysStoppedAnimation<
                                                              Color>(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primary,
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              }
                                              List<VotesRecord>
                                                  containerVotesRecordList =
                                                  snapshot.data!;
                                              return Container(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        0.98,
                                                height: 412.0,
                                                decoration: BoxDecoration(
                                                  color: Color(0xE3000000),
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(20.0),
                                                    bottomRight:
                                                        Radius.circular(20.0),
                                                    topLeft:
                                                        Radius.circular(0.0),
                                                    topRight:
                                                        Radius.circular(0.0),
                                                  ),
                                                ),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Container(
                                                          width:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .width *
                                                                  0.98,
                                                          height: 145.0,
                                                          decoration:
                                                              BoxDecoration(),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        10.0,
                                                                        0.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          10.0,
                                                                          0.0,
                                                                          10.0,
                                                                          0.0),
                                                                      child:
                                                                          Container(
                                                                        width:
                                                                            80.0,
                                                                        height:
                                                                            145.0,
                                                                        decoration:
                                                                            BoxDecoration(),
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.end,
                                                                          children: [
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 35.0, 0.0, 0.0),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.end,
                                                                                children: [
                                                                                  Text(
                                                                                    postDetailsUserPostsRecord.postAnswer1,
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 1.0, 0.0, 0.0),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.end,
                                                                                children: [
                                                                                  Text(
                                                                                    postDetailsUserPostsRecord.postAnswer2,
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 1.0, 0.0, 0.0),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.end,
                                                                                children: [
                                                                                  Text(
                                                                                    postDetailsUserPostsRecord.postAnswer3,
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 1.0, 0.0, 0.0),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.end,
                                                                                children: [
                                                                                  Text(
                                                                                    postDetailsUserPostsRecord.postAnswer4,
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        Transform
                                                                            .rotate(
                                                                          angle:
                                                                              1.5708,
                                                                          child:
                                                                              Stack(
                                                                            children: [
                                                                              if (_model.isGirl == true)
                                                                                Container(
                                                                                  width: 120.0,
                                                                                  height: 135.0,
                                                                                  child: FlutterFlowBarChart(
                                                                                    barData: [
                                                                                      FFBarChartData(
                                                                                        yData: postDetailsUserPostsRecord.votesFemale1,
                                                                                        color: Color(0xFF5A073E),
                                                                                      ),
                                                                                      FFBarChartData(
                                                                                        yData: postDetailsUserPostsRecord.votesFemale2,
                                                                                        color: Color(0xFFA91D72),
                                                                                      ),
                                                                                      FFBarChartData(
                                                                                        yData: postDetailsUserPostsRecord.votesFemale3,
                                                                                        color: Color(0xFFDD4FAA),
                                                                                      ),
                                                                                      FFBarChartData(
                                                                                        yData: postDetailsUserPostsRecord.votesFemale4,
                                                                                        color: Color(0xFFFCAFDC),
                                                                                      )
                                                                                    ],
                                                                                    xLabels: postDetailsUserPostsRecord.intPercentVotes1.map((e) => e.toString()).toList(),
                                                                                    barWidth: 16.0,
                                                                                    barBorderRadius: BorderRadius.circular(8.0),
                                                                                    barSpace: 2.0,
                                                                                    groupSpace: 8.0,
                                                                                    chartStylingInfo: ChartStylingInfo(
                                                                                      backgroundColor: Colors.transparent,
                                                                                      showBorder: false,
                                                                                    ),
                                                                                    axisBounds: AxisBounds(
                                                                                      minY: 0.0,
                                                                                      maxY: 10.0,
                                                                                    ),
                                                                                    xAxisLabelInfo: AxisLabelInfo(),
                                                                                    yAxisLabelInfo: AxisLabelInfo(),
                                                                                  ),
                                                                                ),
                                                                              if (_model.displayGender == true)
                                                                                Container(
                                                                                  width: 120.0,
                                                                                  height: 135.0,
                                                                                  child: FlutterFlowBarChart(
                                                                                    barData: [
                                                                                      FFBarChartData(
                                                                                        yData: postDetailsUserPostsRecord.intPercentVotesMale,
                                                                                        color: FlutterFlowTheme.of(context).info,
                                                                                      ),
                                                                                      FFBarChartData(
                                                                                        yData: postDetailsUserPostsRecord.intPercentVotesFemale,
                                                                                        color: FlutterFlowTheme.of(context).secondary,
                                                                                      )
                                                                                    ],
                                                                                    xLabels: postDetailsUserPostsRecord.intPercentVotes.map((e) => e.toString()).toList(),
                                                                                    stacked: true,
                                                                                    barWidth: 16.0,
                                                                                    barBorderRadius: BorderRadius.circular(8.0),
                                                                                    groupSpace: 2.0,
                                                                                    chartStylingInfo: ChartStylingInfo(
                                                                                      backgroundColor: Colors.transparent,
                                                                                      showBorder: false,
                                                                                    ),
                                                                                    axisBounds: AxisBounds(
                                                                                      minY: 0.0,
                                                                                      maxY: 10.0,
                                                                                    ),
                                                                                    xAxisLabelInfo: AxisLabelInfo(),
                                                                                    yAxisLabelInfo: AxisLabelInfo(),
                                                                                  ),
                                                                                ),
                                                                              if (_model.isBoth == true)
                                                                                Container(
                                                                                  width: 120.0,
                                                                                  height: 135.0,
                                                                                  child: FlutterFlowBarChart(
                                                                                    barData: [
                                                                                      FFBarChartData(
                                                                                        yData: postDetailsUserPostsRecord.intPercentVotes1,
                                                                                        color: Color(0xFF3C145E),
                                                                                      ),
                                                                                      FFBarChartData(
                                                                                        yData: postDetailsUserPostsRecord.intPercentVotes2,
                                                                                        color: Color(0xFF6F1CAE),
                                                                                      ),
                                                                                      FFBarChartData(
                                                                                        yData: postDetailsUserPostsRecord.intPercentVotes3,
                                                                                        color: Color(0xFF2A6CF0),
                                                                                      ),
                                                                                      FFBarChartData(
                                                                                        yData: postDetailsUserPostsRecord.intPercentVotes4,
                                                                                        color: Color(0xFF1C4494),
                                                                                      )
                                                                                    ],
                                                                                    xLabels: postDetailsUserPostsRecord.intPercentVotes1.map((e) => e.toString()).toList(),
                                                                                    barWidth: 16.0,
                                                                                    barBorderRadius: BorderRadius.circular(8.0),
                                                                                    barSpace: 2.0,
                                                                                    groupSpace: 8.0,
                                                                                    chartStylingInfo: ChartStylingInfo(
                                                                                      backgroundColor: Colors.transparent,
                                                                                      showBorder: false,
                                                                                    ),
                                                                                    axisBounds: AxisBounds(
                                                                                      minY: 0.0,
                                                                                      maxY: 10.0,
                                                                                    ),
                                                                                    xAxisLabelInfo: AxisLabelInfo(),
                                                                                    yAxisLabelInfo: AxisLabelInfo(),
                                                                                  ),
                                                                                ),
                                                                              if (_model.isBoy == true)
                                                                                Container(
                                                                                  width: 120.0,
                                                                                  height: 135.0,
                                                                                  child: FlutterFlowBarChart(
                                                                                    barData: [
                                                                                      FFBarChartData(
                                                                                        yData: postDetailsUserPostsRecord.votesMale1,
                                                                                        color: Color(0xFF03225E),
                                                                                      ),
                                                                                      FFBarChartData(
                                                                                        yData: postDetailsUserPostsRecord.votesMale2,
                                                                                        color: FlutterFlowTheme.of(context).info,
                                                                                      ),
                                                                                      FFBarChartData(
                                                                                        yData: postDetailsUserPostsRecord.votesMale3,
                                                                                        color: Color(0xFF3D63AE),
                                                                                      ),
                                                                                      FFBarChartData(
                                                                                        yData: postDetailsUserPostsRecord.votesMale4,
                                                                                        color: Color(0xFF6498FF),
                                                                                      )
                                                                                    ],
                                                                                    xLabels: postDetailsUserPostsRecord.intPercentVotes1.map((e) => e.toString()).toList(),
                                                                                    barWidth: 16.0,
                                                                                    barBorderRadius: BorderRadius.circular(8.0),
                                                                                    barSpace: 2.0,
                                                                                    groupSpace: 8.0,
                                                                                    chartStylingInfo: ChartStylingInfo(
                                                                                      backgroundColor: Colors.transparent,
                                                                                      showBorder: false,
                                                                                    ),
                                                                                    axisBounds: AxisBounds(
                                                                                      minY: 0.0,
                                                                                      maxY: 10.0,
                                                                                    ),
                                                                                    xAxisLabelInfo: AxisLabelInfo(),
                                                                                    yAxisLabelInfo: AxisLabelInfo(),
                                                                                  ),
                                                                                ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    Container(
                                                                      width:
                                                                          20.0,
                                                                      height:
                                                                          150.0,
                                                                      decoration:
                                                                          BoxDecoration(),
                                                                      child:
                                                                          Stack(
                                                                        children: [
                                                                          if ((_model.isBoth == true) ||
                                                                              (_model.displayGender == true))
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 35.0, 0.0, 0.0),
                                                                                    child: Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                                                      children: [
                                                                                        Text(
                                                                                          postDetailsUserPostsRecord.totalVotes1.toString(),
                                                                                          textAlign: TextAlign.start,
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                  Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                                                    children: [
                                                                                      Text(
                                                                                        postDetailsUserPostsRecord.totalVotes2.toString(),
                                                                                        textAlign: TextAlign.start,
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                  Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                                                    children: [
                                                                                      Text(
                                                                                        postDetailsUserPostsRecord.totalVotes3.toString(),
                                                                                        textAlign: TextAlign.start,
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                  Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                                                    children: [
                                                                                      Text(
                                                                                        postDetailsUserPostsRecord.totalVotes4.toString(),
                                                                                        textAlign: TextAlign.start,
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          if (_model.isBoy ==
                                                                              true)
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 35.0, 0.0, 0.0),
                                                                                    child: Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                                                      children: [
                                                                                        Text(
                                                                                          postDetailsUserPostsRecord.totalVotesMale1.toString(),
                                                                                          textAlign: TextAlign.start,
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                  Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                                                    children: [
                                                                                      Text(
                                                                                        postDetailsUserPostsRecord.totalVotesMale2.toString(),
                                                                                        textAlign: TextAlign.start,
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                  Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                                                    children: [
                                                                                      Text(
                                                                                        postDetailsUserPostsRecord.totalVotesMale3.toString(),
                                                                                        textAlign: TextAlign.start,
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                  Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                                                    children: [
                                                                                      Text(
                                                                                        postDetailsUserPostsRecord.totalVotesMale4.toString(),
                                                                                        textAlign: TextAlign.start,
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          if (_model.isGirl ==
                                                                              true)
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 35.0, 0.0, 0.0),
                                                                                    child: Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                                                      children: [
                                                                                        Text(
                                                                                          postDetailsUserPostsRecord.totalVotesFemale1.toString(),
                                                                                          textAlign: TextAlign.start,
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                  Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                                                    children: [
                                                                                      Text(
                                                                                        postDetailsUserPostsRecord.totalVotesFemale2.toString(),
                                                                                        textAlign: TextAlign.start,
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                  Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                                                    children: [
                                                                                      Text(
                                                                                        postDetailsUserPostsRecord.totalVotesFemale3.toString(),
                                                                                        textAlign: TextAlign.start,
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                  Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                                                    children: [
                                                                                      Text(
                                                                                        postDetailsUserPostsRecord.totalVotesFemale4.toString(),
                                                                                        textAlign: TextAlign.start,
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          10.0,
                                                                          0.0),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            5.0,
                                                                            15.0,
                                                                            0.0),
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              70.0,
                                                                          height:
                                                                              70.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            borderRadius:
                                                                                BorderRadius.circular(10.0),
                                                                          ),
                                                                          child:
                                                                              Stack(
                                                                            children: [
                                                                              if (_model.isBoth == true)
                                                                                Container(
                                                                                  width: 70.0,
                                                                                  height: 70.0,
                                                                                  child: FlutterFlowPieChart(
                                                                                    data: FFPieChartData(
                                                                                      values: postDetailsUserPostsRecord.intPercentVotes,
                                                                                      colors: chartPieChartColorsList5,
                                                                                      radius: [25.0],
                                                                                    ),
                                                                                    donutHoleRadius: 30.0,
                                                                                    donutHoleColor: Colors.transparent,
                                                                                    sectionLabelType: PieChartSectionLabelType.percent,
                                                                                    sectionLabelStyle: FlutterFlowTheme.of(context).headlineSmall.override(
                                                                                          fontFamily: 'Urbanist',
                                                                                          fontSize: 10.0,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              if (_model.displayGender == true)
                                                                                Container(
                                                                                  width: 70.0,
                                                                                  height: 70.0,
                                                                                  child: FlutterFlowPieChart(
                                                                                    data: FFPieChartData(
                                                                                      values: [
                                                                                        postDetailsUserPostsRecord.popVotesMale,
                                                                                        postDetailsUserPostsRecord.popVotesFemale
                                                                                      ],
                                                                                      colors: [
                                                                                        Color(0xFF2A6CF0),
                                                                                        FlutterFlowTheme.of(context).secondary
                                                                                      ],
                                                                                      radius: [
                                                                                        25.0,
                                                                                        25.0
                                                                                      ],
                                                                                    ),
                                                                                    donutHoleRadius: 30.0,
                                                                                    donutHoleColor: Colors.transparent,
                                                                                    sectionLabelType: PieChartSectionLabelType.percent,
                                                                                    sectionLabelStyle: FlutterFlowTheme.of(context).headlineSmall.override(
                                                                                          fontFamily: 'Urbanist',
                                                                                          fontSize: 10.0,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              if (_model.isGirl == true)
                                                                                Container(
                                                                                  width: 70.0,
                                                                                  height: 70.0,
                                                                                  child: FlutterFlowPieChart(
                                                                                    data: FFPieChartData(
                                                                                      values: postDetailsUserPostsRecord.intPercentVotesFemale,
                                                                                      colors: chartPieChartColorsList7,
                                                                                      radius: [25.0],
                                                                                    ),
                                                                                    donutHoleRadius: 30.0,
                                                                                    donutHoleColor: Colors.transparent,
                                                                                    sectionLabelType: PieChartSectionLabelType.percent,
                                                                                    sectionLabelStyle: FlutterFlowTheme.of(context).headlineSmall.override(
                                                                                          fontFamily: 'Urbanist',
                                                                                          fontSize: 10.0,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              if (_model.isBoy == true)
                                                                                Container(
                                                                                  width: 80.0,
                                                                                  height: 70.0,
                                                                                  child: FlutterFlowPieChart(
                                                                                    data: FFPieChartData(
                                                                                      values: postDetailsUserPostsRecord.intPercentVotesMale,
                                                                                      colors: chartPieChartColorsList8,
                                                                                      radius: [25.0],
                                                                                    ),
                                                                                    donutHoleRadius: 30.0,
                                                                                    donutHoleColor: Colors.transparent,
                                                                                    sectionLabelType: PieChartSectionLabelType.percent,
                                                                                    sectionLabelStyle: FlutterFlowTheme.of(context).headlineSmall.override(
                                                                                          fontFamily: 'Urbanist',
                                                                                          fontSize: 10.0,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Container(
                                                          width:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .width *
                                                                  0.97,
                                                          height: 170.0,
                                                          decoration:
                                                              BoxDecoration(),
                                                          child: Stack(
                                                            children: [
                                                              if (_model
                                                                      .isBoth ==
                                                                  true)
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10.0,
                                                                          0.0,
                                                                          10.0,
                                                                          5.0),
                                                                  child:
                                                                      Container(
                                                                    width: MediaQuery.sizeOf(context)
                                                                            .width *
                                                                        0.97,
                                                                    height:
                                                                        170.0,
                                                                    child:
                                                                        FlutterFlowLineChart(
                                                                      data: [
                                                                        FFLineChartData(
                                                                          xData:
                                                                              postDetailsUserPostsRecord.lineDates,
                                                                          yData:
                                                                              postDetailsUserPostsRecord.lineVotes1,
                                                                          settings:
                                                                              LineChartBarData(
                                                                            color:
                                                                                Color(0xFF3F096A),
                                                                            barWidth:
                                                                                2.0,
                                                                            isCurved:
                                                                                true,
                                                                            dotData:
                                                                                FlDotData(show: false),
                                                                          ),
                                                                        ),
                                                                        FFLineChartData(
                                                                          xData:
                                                                              postDetailsUserPostsRecord.lineDates,
                                                                          yData:
                                                                              postDetailsUserPostsRecord.lineVotes2,
                                                                          settings:
                                                                              LineChartBarData(
                                                                            color:
                                                                                Color(0xFF6920A1),
                                                                            barWidth:
                                                                                2.0,
                                                                            isCurved:
                                                                                true,
                                                                            preventCurveOverShooting:
                                                                                true,
                                                                            dotData:
                                                                                FlDotData(show: false),
                                                                          ),
                                                                        ),
                                                                        FFLineChartData(
                                                                          xData:
                                                                              postDetailsUserPostsRecord.lineDates,
                                                                          yData:
                                                                              postDetailsUserPostsRecord.lineVotes3,
                                                                          settings:
                                                                              LineChartBarData(
                                                                            color:
                                                                                Color(0xFF3C7CF7),
                                                                            barWidth:
                                                                                2.0,
                                                                            isCurved:
                                                                                true,
                                                                            preventCurveOverShooting:
                                                                                true,
                                                                            dotData:
                                                                                FlDotData(show: false),
                                                                          ),
                                                                        ),
                                                                        FFLineChartData(
                                                                          xData:
                                                                              postDetailsUserPostsRecord.lineDates,
                                                                          yData:
                                                                              postDetailsUserPostsRecord.lineVotes4,
                                                                          settings:
                                                                              LineChartBarData(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).info,
                                                                            barWidth:
                                                                                2.0,
                                                                            isCurved:
                                                                                true,
                                                                            preventCurveOverShooting:
                                                                                true,
                                                                            dotData:
                                                                                FlDotData(show: false),
                                                                          ),
                                                                        )
                                                                      ],
                                                                      chartStylingInfo:
                                                                          ChartStylingInfo(
                                                                        enableTooltip:
                                                                            true,
                                                                        backgroundColor:
                                                                            Colors.transparent,
                                                                        showBorder:
                                                                            false,
                                                                      ),
                                                                      axisBounds:
                                                                          AxisBounds(),
                                                                      xAxisLabelInfo:
                                                                          AxisLabelInfo(
                                                                        showLabels:
                                                                            true,
                                                                        labelInterval:
                                                                            1.0,
                                                                      ),
                                                                      yAxisLabelInfo:
                                                                          AxisLabelInfo(),
                                                                    ),
                                                                  ),
                                                                ),
                                                              if (_model
                                                                      .isGirl ==
                                                                  true)
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10.0,
                                                                          0.0,
                                                                          10.0,
                                                                          5.0),
                                                                  child:
                                                                      Container(
                                                                    width: MediaQuery.sizeOf(context)
                                                                            .width *
                                                                        0.97,
                                                                    height:
                                                                        170.0,
                                                                    child:
                                                                        FlutterFlowLineChart(
                                                                      data: [
                                                                        FFLineChartData(
                                                                          xData:
                                                                              postDetailsUserPostsRecord.lineDates,
                                                                          yData:
                                                                              postDetailsUserPostsRecord.lineVotesFemale1,
                                                                          settings:
                                                                              LineChartBarData(
                                                                            color:
                                                                                Color(0xFF5A073E),
                                                                            barWidth:
                                                                                2.0,
                                                                            isCurved:
                                                                                true,
                                                                            dotData:
                                                                                FlDotData(show: false),
                                                                          ),
                                                                        ),
                                                                        FFLineChartData(
                                                                          xData:
                                                                              postDetailsUserPostsRecord.lineDates,
                                                                          yData:
                                                                              postDetailsUserPostsRecord.lineVotesFemale2,
                                                                          settings:
                                                                              LineChartBarData(
                                                                            color:
                                                                                Color(0xFFA91D72),
                                                                            barWidth:
                                                                                2.0,
                                                                            isCurved:
                                                                                true,
                                                                            preventCurveOverShooting:
                                                                                true,
                                                                            dotData:
                                                                                FlDotData(show: false),
                                                                          ),
                                                                        ),
                                                                        FFLineChartData(
                                                                          xData:
                                                                              postDetailsUserPostsRecord.lineDates,
                                                                          yData:
                                                                              postDetailsUserPostsRecord.lineVotesFemale3,
                                                                          settings:
                                                                              LineChartBarData(
                                                                            color:
                                                                                Color(0xFFFF61C3),
                                                                            barWidth:
                                                                                2.0,
                                                                            isCurved:
                                                                                true,
                                                                            preventCurveOverShooting:
                                                                                true,
                                                                            dotData:
                                                                                FlDotData(show: false),
                                                                          ),
                                                                        ),
                                                                        FFLineChartData(
                                                                          xData:
                                                                              postDetailsUserPostsRecord.lineDates,
                                                                          yData:
                                                                              postDetailsUserPostsRecord.lineVotesFemale4,
                                                                          settings:
                                                                              LineChartBarData(
                                                                            color:
                                                                                Color(0xFFFFB3E3),
                                                                            barWidth:
                                                                                2.0,
                                                                            isCurved:
                                                                                true,
                                                                            preventCurveOverShooting:
                                                                                true,
                                                                            dotData:
                                                                                FlDotData(show: false),
                                                                          ),
                                                                        )
                                                                      ],
                                                                      chartStylingInfo:
                                                                          ChartStylingInfo(
                                                                        enableTooltip:
                                                                            true,
                                                                        backgroundColor:
                                                                            Colors.transparent,
                                                                        showBorder:
                                                                            false,
                                                                      ),
                                                                      axisBounds:
                                                                          AxisBounds(),
                                                                      xAxisLabelInfo:
                                                                          AxisLabelInfo(
                                                                        showLabels:
                                                                            true,
                                                                        labelInterval:
                                                                            1.0,
                                                                      ),
                                                                      yAxisLabelInfo:
                                                                          AxisLabelInfo(),
                                                                    ),
                                                                  ),
                                                                ),
                                                              if (_model
                                                                      .displayGender ==
                                                                  true)
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10.0,
                                                                          0.0,
                                                                          10.0,
                                                                          5.0),
                                                                  child:
                                                                      Container(
                                                                    width: MediaQuery.sizeOf(context)
                                                                            .width *
                                                                        0.97,
                                                                    height:
                                                                        170.0,
                                                                    child:
                                                                        FlutterFlowLineChart(
                                                                      data: [
                                                                        FFLineChartData(
                                                                          xData:
                                                                              postDetailsUserPostsRecord.lineDates,
                                                                          yData:
                                                                              postDetailsUserPostsRecord.lineVotesFemale,
                                                                          settings:
                                                                              LineChartBarData(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondary,
                                                                            barWidth:
                                                                                2.0,
                                                                            isCurved:
                                                                                true,
                                                                            dotData:
                                                                                FlDotData(show: false),
                                                                          ),
                                                                        ),
                                                                        FFLineChartData(
                                                                          xData:
                                                                              postDetailsUserPostsRecord.lineDates,
                                                                          yData:
                                                                              postDetailsUserPostsRecord.lineVotesMale,
                                                                          settings:
                                                                              LineChartBarData(
                                                                            color:
                                                                                Color(0xFF2A6CF0),
                                                                            barWidth:
                                                                                2.0,
                                                                            isCurved:
                                                                                true,
                                                                            preventCurveOverShooting:
                                                                                true,
                                                                            dotData:
                                                                                FlDotData(show: false),
                                                                          ),
                                                                        )
                                                                      ],
                                                                      chartStylingInfo:
                                                                          ChartStylingInfo(
                                                                        enableTooltip:
                                                                            true,
                                                                        backgroundColor:
                                                                            Colors.transparent,
                                                                        showBorder:
                                                                            false,
                                                                      ),
                                                                      axisBounds:
                                                                          AxisBounds(),
                                                                      xAxisLabelInfo:
                                                                          AxisLabelInfo(
                                                                        showLabels:
                                                                            true,
                                                                        labelInterval:
                                                                            1.0,
                                                                      ),
                                                                      yAxisLabelInfo:
                                                                          AxisLabelInfo(),
                                                                    ),
                                                                  ),
                                                                ),
                                                              if (_model
                                                                      .isBoy ==
                                                                  true)
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10.0,
                                                                          0.0,
                                                                          10.0,
                                                                          5.0),
                                                                  child:
                                                                      Container(
                                                                    width: MediaQuery.sizeOf(context)
                                                                            .width *
                                                                        0.97,
                                                                    height:
                                                                        170.0,
                                                                    child:
                                                                        FlutterFlowLineChart(
                                                                      data: [
                                                                        FFLineChartData(
                                                                          xData:
                                                                              postDetailsUserPostsRecord.lineDates,
                                                                          yData:
                                                                              postDetailsUserPostsRecord.lineVotesMale1,
                                                                          settings:
                                                                              LineChartBarData(
                                                                            color:
                                                                                Color(0xFF03225E),
                                                                            barWidth:
                                                                                2.0,
                                                                            isCurved:
                                                                                true,
                                                                            dotData:
                                                                                FlDotData(show: false),
                                                                          ),
                                                                        ),
                                                                        FFLineChartData(
                                                                          xData:
                                                                              postDetailsUserPostsRecord.lineDates,
                                                                          yData:
                                                                              postDetailsUserPostsRecord.lineVotesMale2,
                                                                          settings:
                                                                              LineChartBarData(
                                                                            color:
                                                                                Color(0xFF1C4494),
                                                                            barWidth:
                                                                                2.0,
                                                                            isCurved:
                                                                                true,
                                                                            preventCurveOverShooting:
                                                                                true,
                                                                            dotData:
                                                                                FlDotData(show: false),
                                                                          ),
                                                                        ),
                                                                        FFLineChartData(
                                                                          xData:
                                                                              postDetailsUserPostsRecord.lineDates,
                                                                          yData:
                                                                              postDetailsUserPostsRecord.lineVotesMale3,
                                                                          settings:
                                                                              LineChartBarData(
                                                                            color:
                                                                                Color(0xFF3C7CF7),
                                                                            barWidth:
                                                                                2.0,
                                                                            isCurved:
                                                                                true,
                                                                            preventCurveOverShooting:
                                                                                true,
                                                                            dotData:
                                                                                FlDotData(show: false),
                                                                          ),
                                                                        ),
                                                                        FFLineChartData(
                                                                          xData:
                                                                              postDetailsUserPostsRecord.lineDates,
                                                                          yData:
                                                                              postDetailsUserPostsRecord.lineVotesMale4,
                                                                          settings:
                                                                              LineChartBarData(
                                                                            color:
                                                                                Color(0xFF6498FF),
                                                                            barWidth:
                                                                                2.0,
                                                                            isCurved:
                                                                                true,
                                                                            preventCurveOverShooting:
                                                                                true,
                                                                            dotData:
                                                                                FlDotData(show: false),
                                                                          ),
                                                                        )
                                                                      ],
                                                                      chartStylingInfo:
                                                                          ChartStylingInfo(
                                                                        enableTooltip:
                                                                            true,
                                                                        backgroundColor:
                                                                            Colors.transparent,
                                                                        showBorder:
                                                                            false,
                                                                      ),
                                                                      axisBounds:
                                                                          AxisBounds(),
                                                                      xAxisLabelInfo:
                                                                          AxisLabelInfo(
                                                                        showLabels:
                                                                            true,
                                                                        labelInterval:
                                                                            1.0,
                                                                      ),
                                                                      yAxisLabelInfo:
                                                                          AxisLabelInfo(),
                                                                    ),
                                                                  ),
                                                                ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      20.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Stack(
                                                            children: [
                                                              Icon(
                                                                Icons.room,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                size: 35.0,
                                                              ),
                                                              Icon(
                                                                Icons
                                                                    .location_on,
                                                                color: Color(
                                                                    0xFF4383FF),
                                                                size: 35.0,
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      15.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Stack(
                                                            children: [
                                                              Icon(
                                                                Icons
                                                                    .calendar_month,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                size: 35.0,
                                                              ),
                                                              Icon(
                                                                Icons
                                                                    .calendar_month,
                                                                color: Color(
                                                                    0xFFDD4FAA),
                                                                size: 35.0,
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      15.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Stack(
                                                            children: [
                                                              if ((_model.isBoth ==
                                                                      true) &&
                                                                  ((_model
                                                                              .isGirl ==
                                                                          false) &&
                                                                      (_model.isBoy ==
                                                                          false) &&
                                                                      (_model.displayGender ==
                                                                          false)))
                                                                InkWell(
                                                                  splashColor:
                                                                      Colors
                                                                          .transparent,
                                                                  focusColor: Colors
                                                                      .transparent,
                                                                  hoverColor: Colors
                                                                      .transparent,
                                                                  highlightColor:
                                                                      Colors
                                                                          .transparent,
                                                                  onTap:
                                                                      () async {
                                                                    setState(
                                                                        () {
                                                                      _model.isGirl =
                                                                          false;
                                                                      _model.isBoth =
                                                                          false;
                                                                      _model.isBoy =
                                                                          false;
                                                                      _model.displayGender =
                                                                          true;
                                                                    });
                                                                  },
                                                                  child: Icon(
                                                                    Icons
                                                                        .groups,
                                                                    color: Color(
                                                                        0xFF8754BA),
                                                                    size: 40.0,
                                                                  ),
                                                                ),
                                                              if ((_model.isBoth ==
                                                                      false) &&
                                                                  ((_model
                                                                              .isGirl ==
                                                                          true) &&
                                                                      (_model.isBoy ==
                                                                          false) &&
                                                                      (_model.displayGender ==
                                                                          false)))
                                                                InkWell(
                                                                  splashColor:
                                                                      Colors
                                                                          .transparent,
                                                                  focusColor: Colors
                                                                      .transparent,
                                                                  hoverColor: Colors
                                                                      .transparent,
                                                                  highlightColor:
                                                                      Colors
                                                                          .transparent,
                                                                  onTap:
                                                                      () async {
                                                                    setState(
                                                                        () {
                                                                      _model.isGirl =
                                                                          false;
                                                                      _model.isBoth =
                                                                          true;
                                                                      _model.isBoy =
                                                                          false;
                                                                      _model.displayGender =
                                                                          false;
                                                                    });
                                                                  },
                                                                  child: Icon(
                                                                    Icons.girl,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondary,
                                                                    size: 40.0,
                                                                  ),
                                                                ),
                                                              if ((_model.isBoth ==
                                                                      false) &&
                                                                  ((_model
                                                                              .isGirl ==
                                                                          false) &&
                                                                      (_model.isBoy ==
                                                                          true) &&
                                                                      (_model.displayGender ==
                                                                          false)))
                                                                InkWell(
                                                                  splashColor:
                                                                      Colors
                                                                          .transparent,
                                                                  focusColor: Colors
                                                                      .transparent,
                                                                  hoverColor: Colors
                                                                      .transparent,
                                                                  highlightColor:
                                                                      Colors
                                                                          .transparent,
                                                                  onTap:
                                                                      () async {
                                                                    setState(
                                                                        () {
                                                                      _model.isGirl =
                                                                          true;
                                                                      _model.isBoth =
                                                                          false;
                                                                      _model.isBoy =
                                                                          false;
                                                                      _model.displayGender =
                                                                          false;
                                                                    });
                                                                  },
                                                                  child: Icon(
                                                                    Icons.boy,
                                                                    color: Color(
                                                                        0xFF4383FF),
                                                                    size: 40.0,
                                                                  ),
                                                                ),
                                                              if ((_model.isBoth ==
                                                                      false) &&
                                                                  ((_model
                                                                              .isGirl ==
                                                                          false) &&
                                                                      (_model.isBoy ==
                                                                          false) &&
                                                                      (_model.displayGender ==
                                                                          true)))
                                                                InkWell(
                                                                  splashColor:
                                                                      Colors
                                                                          .transparent,
                                                                  focusColor: Colors
                                                                      .transparent,
                                                                  hoverColor: Colors
                                                                      .transparent,
                                                                  highlightColor:
                                                                      Colors
                                                                          .transparent,
                                                                  onTap:
                                                                      () async {
                                                                    setState(
                                                                        () {
                                                                      _model.isGirl =
                                                                          false;
                                                                      _model.isBoy =
                                                                          true;
                                                                      _model.isBoth =
                                                                          false;
                                                                      _model.displayGender =
                                                                          false;
                                                                    });
                                                                  },
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Container(
                                                                        width:
                                                                            40.0,
                                                                        height:
                                                                            40.0,
                                                                        decoration:
                                                                            BoxDecoration(),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.center,
                                                                          children: [
                                                                            Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                              children: [
                                                                                Text(
                                                                                  '⚥',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Urbanist',
                                                                                        color: Color(0xFFE61A90),
                                                                                        fontSize: 35.0,
                                                                                        fontWeight: FontWeight.w900,
                                                                                      ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Container(
                                                          width:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .width *
                                                                  0.95,
                                                          height: 30.0,
                                                          decoration:
                                                              BoxDecoration(),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        10.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Container(
                                                              width: double
                                                                  .infinity,
                                                              child: Slider(
                                                                activeColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                inactiveColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .alternate,
                                                                min: 0.0,
                                                                max: 100.0,
                                                                value: _model
                                                                        .sliderValue ??=
                                                                    35.0,
                                                                label: _model
                                                                    .sliderValue
                                                                    .toString(),
                                                                divisions: 100,
                                                                onChanged:
                                                                    (newValue) {
                                                                  newValue = double
                                                                      .parse(newValue
                                                                          .toStringAsFixed(
                                                                              0));
                                                                  setState(() =>
                                                                      _model.sliderValue =
                                                                          newValue);
                                                                },
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              );
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 12.0, 16.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Card(
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    color: Color(0x3F000000),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(40.0),
                                    ),
                                    child: FlutterFlowIconButton(
                                      borderColor: Colors.transparent,
                                      borderRadius: 15.0,
                                      buttonSize: 26.0,
                                      icon: Icon(
                                        Icons.arrow_back_rounded,
                                        color: FlutterFlowTheme.of(context)
                                            .tertiary,
                                        size: 12.0,
                                      ),
                                      onPressed: () async {
                                        context.pop();
                                      },
                                    ),
                                  ),
                                  if (postDetailsUserPostsRecord.postOwner)
                                    FlutterFlowIconButton(
                                      borderColor: Colors.transparent,
                                      borderRadius: 30.0,
                                      borderWidth: 1.0,
                                      buttonSize: 26.0,
                                      fillColor: Color(0x41000000),
                                      icon: Icon(
                                        Icons.more_vert_sharp,
                                        color: FlutterFlowTheme.of(context)
                                            .tertiary,
                                        size: 12.0,
                                      ),
                                      onPressed: () async {
                                        await showModalBottomSheet(
                                          isScrollControlled: true,
                                          backgroundColor: Color(0x00000000),
                                          barrierColor: Color(0x00000000),
                                          context: context,
                                          builder: (context) {
                                            return Padding(
                                              padding: MediaQuery.viewInsetsOf(
                                                  context),
                                              child: Container(
                                                height: 250.0,
                                                child: DeletePostWidget(
                                                  postParameters:
                                                      postDetailsUserPostsRecord,
                                                ),
                                              ),
                                            );
                                          },
                                        ).then((value) => setState(() {}));
                                      },
                                    ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: 40.0,
                          decoration: BoxDecoration(
                            color: Colors.black,
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                2.0, 4.0, 2.0, 6.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          0.65,
                                      height: 46.0,
                                      decoration: BoxDecoration(),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 4.0, 0.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Container(
                                                  width: 35.0,
                                                  height: 100.0,
                                                  decoration: BoxDecoration(),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                5.0, 0.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      5.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Container(
                                                            width: 25.0,
                                                            height: 25.0,
                                                            child: Stack(
                                                              children: [
                                                                if (!postDetailsUserPostsRecord
                                                                    .likes
                                                                    .contains(
                                                                        currentUserReference))
                                                                  Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            0.0,
                                                                            0.25),
                                                                    child:
                                                                        InkWell(
                                                                      splashColor:
                                                                          Colors
                                                                              .transparent,
                                                                      focusColor:
                                                                          Colors
                                                                              .transparent,
                                                                      hoverColor:
                                                                          Colors
                                                                              .transparent,
                                                                      highlightColor:
                                                                          Colors
                                                                              .transparent,
                                                                      onTap:
                                                                          () async {
                                                                        await postDetailsUserPostsRecord
                                                                            .reference
                                                                            .update({
                                                                          'likes':
                                                                              FieldValue.arrayUnion([
                                                                            currentUserReference
                                                                          ]),
                                                                          'shits':
                                                                              FieldValue.arrayRemove([
                                                                            currentUserReference
                                                                          ]),
                                                                        });
                                                                      },
                                                                      child:
                                                                          FaIcon(
                                                                        FontAwesomeIcons
                                                                            .solidHeart,
                                                                        color: Color(
                                                                            0xFF95A1AC),
                                                                        size:
                                                                            25.0,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                if (postDetailsUserPostsRecord
                                                                    .likes
                                                                    .contains(
                                                                        currentUserReference))
                                                                  Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            0.0,
                                                                            0.25),
                                                                    child:
                                                                        InkWell(
                                                                      splashColor:
                                                                          Colors
                                                                              .transparent,
                                                                      focusColor:
                                                                          Colors
                                                                              .transparent,
                                                                      hoverColor:
                                                                          Colors
                                                                              .transparent,
                                                                      highlightColor:
                                                                          Colors
                                                                              .transparent,
                                                                      onTap:
                                                                          () async {
                                                                        await postDetailsUserPostsRecord
                                                                            .reference
                                                                            .update({
                                                                          'likes':
                                                                              FieldValue.arrayRemove([
                                                                            currentUserReference
                                                                          ]),
                                                                        });
                                                                      },
                                                                      child:
                                                                          FaIcon(
                                                                        FontAwesomeIcons
                                                                            .solidHeart,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .error,
                                                                        size:
                                                                            25.0,
                                                                      ),
                                                                    ),
                                                                  ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  width: 25.0,
                                                  height: 100.0,
                                                  decoration: BoxDecoration(),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: [
                                                      Container(
                                                        width: 30.0,
                                                        height: 30.0,
                                                        decoration:
                                                            BoxDecoration(),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      4.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Text(
                                                            functions
                                                                .likes(
                                                                    postDetailsUserPostsRecord)
                                                                .toString(),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodySmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Lexend Deca',
                                                                  color: Color(
                                                                      0xFF8B97A2),
                                                                  fontSize:
                                                                      14.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          5.0, 0.0, 0.0, 0.0),
                                                  child: Container(
                                                    width: 35.0,
                                                    height: 30.0,
                                                    decoration: BoxDecoration(),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  5.0,
                                                                  0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Container(
                                                              width: 30.0,
                                                              height: 30.0,
                                                              child: Stack(
                                                                children: [
                                                                  if (!postDetailsUserPostsRecord
                                                                      .shits
                                                                      .contains(
                                                                          currentUserReference))
                                                                    Align(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              0.0,
                                                                              0.25),
                                                                      child:
                                                                          InkWell(
                                                                        splashColor:
                                                                            Colors.transparent,
                                                                        focusColor:
                                                                            Colors.transparent,
                                                                        hoverColor:
                                                                            Colors.transparent,
                                                                        highlightColor:
                                                                            Colors.transparent,
                                                                        onTap:
                                                                            () async {
                                                                          await postDetailsUserPostsRecord
                                                                              .reference
                                                                              .update({
                                                                            'shits':
                                                                                FieldValue.arrayUnion([
                                                                              currentUserReference
                                                                            ]),
                                                                            'likes':
                                                                                FieldValue.arrayRemove([
                                                                              currentUserReference
                                                                            ]),
                                                                          });
                                                                        },
                                                                        child:
                                                                            FaIcon(
                                                                          FontAwesomeIcons
                                                                              .poo,
                                                                          color:
                                                                              Color(0xFF95A1AC),
                                                                          size:
                                                                              25.0,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  if (postDetailsUserPostsRecord
                                                                      .shits
                                                                      .contains(
                                                                          currentUserReference))
                                                                    Align(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              0.0,
                                                                              0.25),
                                                                      child:
                                                                          InkWell(
                                                                        splashColor:
                                                                            Colors.transparent,
                                                                        focusColor:
                                                                            Colors.transparent,
                                                                        hoverColor:
                                                                            Colors.transparent,
                                                                        highlightColor:
                                                                            Colors.transparent,
                                                                        onTap:
                                                                            () async {
                                                                          await postDetailsUserPostsRecord
                                                                              .reference
                                                                              .update({
                                                                            'shits':
                                                                                FieldValue.arrayRemove([
                                                                              currentUserReference
                                                                            ]),
                                                                          });
                                                                        },
                                                                        child:
                                                                            FaIcon(
                                                                          FontAwesomeIcons
                                                                              .poo,
                                                                          color:
                                                                              Color(0xFF8D5533),
                                                                          size:
                                                                              25.0,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  width: 25.0,
                                                  height: 100.0,
                                                  decoration: BoxDecoration(),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: [
                                                      Container(
                                                        width: 30.0,
                                                        height: 30.0,
                                                        decoration:
                                                            BoxDecoration(),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      4.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Text(
                                                            valueOrDefault<
                                                                String>(
                                                              functions
                                                                  .shits(
                                                                      postDetailsUserPostsRecord)
                                                                  .toString(),
                                                              '0',
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodySmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Lexend Deca',
                                                                  color: Color(
                                                                      0xFF8B97A2),
                                                                  fontSize:
                                                                      14.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          5.0, 0.0, 0.0, 0.0),
                                                  child: Container(
                                                    width: 30.0,
                                                    height: 30.0,
                                                    decoration: BoxDecoration(),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Stack(
                                                          children: [
                                                            if (postDetailsUserPostsRecord
                                                                    .numComments ==
                                                                0)
                                                              Icon(
                                                                Icons
                                                                    .mode_comment_outlined,
                                                                color: Color(
                                                                    0xFF95A1AC),
                                                                size: 24.0,
                                                              ),
                                                            if (postDetailsUserPostsRecord
                                                                    .numComments >
                                                                0)
                                                              Icon(
                                                                Icons
                                                                    .mode_comment_outlined,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                size: 24.0,
                                                              ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  width: 30.0,
                                                  height: 100.0,
                                                  decoration: BoxDecoration(),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: [
                                                      Container(
                                                        width: 30.0,
                                                        height: 30.0,
                                                        decoration:
                                                            BoxDecoration(),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      4.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Text(
                                                            postDetailsUserPostsRecord
                                                                .numComments
                                                                .toString(),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodySmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Lexend Deca',
                                                                  color: Color(
                                                                      0xFF8B97A2),
                                                                  fontSize:
                                                                      14.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          5.0, 0.0, 0.0, 0.0),
                                                  child: Container(
                                                    width: 24.0,
                                                    height: 30.0,
                                                    decoration: BoxDecoration(),
                                                    child: Stack(
                                                      children: [
                                                        if (functions
                                                                .votes(
                                                                    postDetailsUserPostsRecord)
                                                                .toString() ==
                                                            '0')
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        3.0,
                                                                        0.0),
                                                            child: Icon(
                                                              Icons
                                                                  .how_to_vote_rounded,
                                                              color: Color(
                                                                  0xFF95A1AC),
                                                              size: 30.0,
                                                            ),
                                                          ),
                                                        if (functions
                                                                .votes(
                                                                    postDetailsUserPostsRecord)
                                                                .toString() !=
                                                            '0')
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        3.0,
                                                                        0.0),
                                                            child: Icon(
                                                              Icons
                                                                  .how_to_vote_rounded,
                                                              color: Color(
                                                                  0xFF048BCA),
                                                              size: 30.0,
                                                            ),
                                                          ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  width: 35.0,
                                                  height: 30.0,
                                                  decoration: BoxDecoration(),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: [
                                                      Container(
                                                        width: 35.0,
                                                        height: 30.0,
                                                        decoration:
                                                            BoxDecoration(),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      6.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Text(
                                                            functions
                                                                .votes(
                                                                    postDetailsUserPostsRecord)
                                                                .toString(),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodySmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Lexend Deca',
                                                                  color: Color(
                                                                      0xFF8B97A2),
                                                                  fontSize:
                                                                      14.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 2.0, 0.0),
                                      child: Container(
                                        width: 105.0,
                                        height: 45.0,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(16.0),
                                            bottomRight: Radius.circular(16.0),
                                            topLeft: Radius.circular(0.0),
                                            topRight: Radius.circular(0.0),
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 2.0, 8.0, 0.0),
                                              child: Text(
                                                dateTimeFormat(
                                                  'relative',
                                                  postDetailsUserPostsRecord
                                                      .timePosted!,
                                                  locale: FFLocalizations.of(
                                                              context)
                                                          .languageShortCode ??
                                                      FFLocalizations.of(
                                                              context)
                                                          .languageCode,
                                                ),
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Urbanist',
                                                      color: Color(0xFFC6C6C6),
                                                    ),
                                              ),
                                            ),
                                            Icon(
                                              Icons.ios_share,
                                              color: Color(0xFF95A1AC),
                                              size: 24.0,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          decoration: BoxDecoration(
                            color: Colors.black,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              StreamBuilder<List<PostCommentsRecord>>(
                                stream: queryPostCommentsRecord(
                                  queryBuilder: (postCommentsRecord) =>
                                      postCommentsRecord
                                          .where('post',
                                              isEqualTo:
                                                  postDetailsUserPostsRecord
                                                      .reference)
                                          .orderBy('timePosted',
                                              descending: true),
                                ),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 50.0,
                                        height: 50.0,
                                        child: CircularProgressIndicator(
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                                  List<PostCommentsRecord>
                                      commentListPostCommentsRecordList =
                                      snapshot.data!;
                                  if (commentListPostCommentsRecordList
                                      .isEmpty) {
                                    return Center(
                                      child: Image.asset(
                                        'assets/images/commentsEmpty@2x.png',
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.7,
                                        height: 270.0,
                                      ),
                                    );
                                  }
                                  return Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: List.generate(
                                        commentListPostCommentsRecordList
                                            .length, (commentListIndex) {
                                      final commentListPostCommentsRecord =
                                          commentListPostCommentsRecordList[
                                              commentListIndex];
                                      return Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 2.0),
                                        child: StreamBuilder<UsersRecord>(
                                          stream: UsersRecord.getDocument(
                                              commentListPostCommentsRecord
                                                  .user!),
                                          builder: (context, snapshot) {
                                            // Customize what your widget looks like when it's loading.
                                            if (!snapshot.hasData) {
                                              return Center(
                                                child: SizedBox(
                                                  width: 50.0,
                                                  height: 50.0,
                                                  child:
                                                      CircularProgressIndicator(
                                                    valueColor:
                                                        AlwaysStoppedAnimation<
                                                            Color>(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }
                                            final commentUsersRecord =
                                                snapshot.data!;
                                            return Container(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  1.0,
                                              decoration: BoxDecoration(
                                                color: Colors.black,
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    offset: Offset(0.0, 1.0),
                                                  )
                                                ],
                                                borderRadius:
                                                    BorderRadius.circular(0.0),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        8.0, 12.0, 8.0, 12.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      width: 40.0,
                                                      height: 40.0,
                                                      clipBehavior:
                                                          Clip.antiAlias,
                                                      decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                      ),
                                                      child: Image.network(
                                                        commentUsersRecord
                                                            .photoUrl,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    12.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              commentUsersRecord
                                                                  .displayName,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .titleMedium,
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          4.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Text(
                                                                commentListPostCommentsRecord
                                                                    .comment,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium,
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          4.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            4.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      'Posted',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium,
                                                                    ),
                                                                  ),
                                                                  Text(
                                                                    dateTimeFormat(
                                                                      'relative',
                                                                      commentListPostCommentsRecord
                                                                          .timePosted!,
                                                                      locale: FFLocalizations.of(context)
                                                                              .languageShortCode ??
                                                                          FFLocalizations.of(context)
                                                                              .languageCode,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodySmall,
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      );
                                    }),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  height: 100.0,
                  decoration: BoxDecoration(
                    color: Colors.black,
                  ),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 12.0, 12.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 12.0),
                          child: Container(
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 3.0,
                                  color: Color(0x3A000000),
                                  offset: Offset(0.0, 1.0),
                                )
                              ],
                              borderRadius: BorderRadius.circular(40.0),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 4.0, 0.0, 4.0),
                                    child: TextFormField(
                                      controller: _model.textController,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        hintText: 'Comment here...',
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .bodySmall,
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1.0,
                                          ),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1.0,
                                          ),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                        errorBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1.0,
                                          ),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                        focusedErrorBorder:
                                            UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1.0,
                                          ),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                      validator: _model.textControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 4.0, 0.0),
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      await PostCommentsRecord.collection
                                          .doc()
                                          .set(createPostCommentsRecordData(
                                            timePosted: getCurrentTimestamp,
                                            comment: _model.textController.text,
                                            user: currentUserReference,
                                            post: postDetailsUserPostsRecord
                                                .reference,
                                          ));

                                      await postDetailsUserPostsRecord.reference
                                          .update({
                                        'numComments': FieldValue.increment(1),
                                      });
                                    },
                                    text: 'Post',
                                    options: FFButtonOptions(
                                      width: 70.0,
                                      height: 40.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily: 'Urbanist',
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                          ),
                                      elevation: 0.0,
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
