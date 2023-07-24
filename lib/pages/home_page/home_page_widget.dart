import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/create_modal/create_modal_widget.dart';
import '/components/delete_post/delete_post_widget.dart';
import '/components/map_google_widget.dart';
import '/components/time_travel_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_charts.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:flip_card/flip_card.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget>
    with TickerProviderStateMixin {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;
  var hasIconTriggered1 = false;
  var hasIconTriggered2 = false;
  var hasIconTriggered3 = false;
  final animationsMap = {
    'iconOnActionTriggerAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: false,
      effects: [
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(1.2, 0.0),
          end: Offset(0.0, 1.0),
        ),
      ],
    ),
    'iconOnActionTriggerAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: false,
      effects: [
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(1.2, 0.0),
          end: Offset(0.0, 1.0),
        ),
      ],
    ),
    'iconOnActionTriggerAnimation3': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: false,
      effects: [
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(1.2, 0.0),
          end: Offset(0.0, 1.0),
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());

    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final chartPieChartColorsList1 = [
      Color(0xFF3C145E),
      Color(0xFF6F1CAE),
      Color(0xFF4383FF),
      Color(0xFF1C4796)
    ];
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0x961A1F24),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await showModalBottomSheet(
            isScrollControlled: true,
            backgroundColor: Color(0x00000000),
            barrierColor: Color(0x00000000),
            context: context,
            builder: (context) {
              return Padding(
                padding: MediaQuery.viewInsetsOf(context),
                child: Container(
                  height: 240.0,
                  child: CreateModalWidget(),
                ),
              );
            },
          ).then((value) => setState(() {}));
        },
        backgroundColor: Color(0xFF4B39EF),
        elevation: 8.0,
        child: Icon(
          Icons.create_rounded,
          color: Colors.white,
          size: 24.0,
        ),
      ),
      drawer: Container(
        width: MediaQuery.sizeOf(context).width * 0.85,
        child: Drawer(
          elevation: 16.0,
          child: Container(
            width: 100.0,
            height: 100.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
            ),
            child: Container(
              width: MediaQuery.sizeOf(context).width * 0.85,
              height: MediaQuery.sizeOf(context).height * 1.0,
              decoration: BoxDecoration(
                color: Colors.black,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        width: MediaQuery.sizeOf(context).width * 0.8,
                        decoration: BoxDecoration(
                          color: Colors.black,
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 40.0, 0.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      24.0, 0.0, 0.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      AuthUserStreamWidget(
                                        builder: (context) => Text(
                                          valueOrDefault(
                                              currentUserDocument?.userName,
                                              ''),
                                          textAlign: TextAlign.start,
                                          style: FlutterFlowTheme.of(context)
                                              .headlineSmall,
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            AlignmentDirectional(-1.0, 0.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 4.0, 0.0, 0.0),
                                          child: AuthUserStreamWidget(
                                            builder: (context) => Text(
                                              valueOrDefault(
                                                  currentUserDocument?.userName,
                                                  ''),
                                              textAlign: TextAlign.start,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Lexend Deca',
                                                    color: Color(0xFFEE8B60),
                                                    fontSize: 14.0,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            AlignmentDirectional(-1.0, 0.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 8.0, 0.0, 0.0),
                                          child: Text(
                                            'Followers: 2.3K',
                                            textAlign: TextAlign.start,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 16.0, 0.0),
                                child: Container(
                                  width: 78.0,
                                  height: 78.0,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: FlutterFlowTheme.of(context)
                                          .background,
                                    ),
                                  ),
                                  child: Align(
                                    alignment: AlignmentDirectional(0.85, 0.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          4.0, 4.0, 4.0, 4.0),
                                      child: AuthUserStreamWidget(
                                        builder: (context) => Container(
                                          width: 90.0,
                                          height: 90.0,
                                          clipBehavior: Clip.antiAlias,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                          ),
                                          child: Image.network(
                                            currentUserPhoto,
                                            fit: BoxFit.fitWidth,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: DefaultTabController(
                      length: 2,
                      initialIndex: 0,
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment(0.0, 0),
                            child: TabBar(
                              labelColor: FlutterFlowTheme.of(context).primary,
                              unselectedLabelColor:
                                  FlutterFlowTheme.of(context).secondaryText,
                              labelStyle:
                                  FlutterFlowTheme.of(context).titleSmall,
                              indicatorColor:
                                  FlutterFlowTheme.of(context).primary,
                              indicatorWeight: 2.0,
                              tabs: [
                                Tab(
                                  text: 'Pages',
                                ),
                                Tab(
                                  text: 'Settings',
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: TabBarView(
                              children: [
                                Container(
                                  width: 100.0,
                                  height:
                                      MediaQuery.sizeOf(context).height * 0.6,
                                  decoration: BoxDecoration(
                                    color: Color(0x00FFFFFF),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Container(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                0.85,
                                            height: MediaQuery.sizeOf(context)
                                                    .height *
                                                0.55,
                                            decoration: BoxDecoration(),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    context.pushNamed(
                                                        'profilePage');
                                                  },
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        15.0,
                                                                        0.0,
                                                                        0.0),
                                                            child:
                                                                FlutterFlowIconButton(
                                                              borderColor: Colors
                                                                  .transparent,
                                                              borderRadius:
                                                                  20.0,
                                                              borderWidth: 1.0,
                                                              buttonSize: 60.0,
                                                              icon: Icon(
                                                                Icons
                                                                    .person_outlined,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                size: 30.0,
                                                              ),
                                                              onPressed: () {
                                                                print(
                                                                    'IconButton pressed ...');
                                                              },
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        15.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Text(
                                                                  'Profile',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Urbanist',
                                                                        fontSize:
                                                                            25.0,
                                                                        fontWeight:
                                                                            FontWeight.bold,
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
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      15.0,
                                                                      0.0,
                                                                      0.0),
                                                          child:
                                                              FlutterFlowIconButton(
                                                            borderColor: Colors
                                                                .transparent,
                                                            borderRadius: 20.0,
                                                            borderWidth: 1.0,
                                                            buttonSize: 60.0,
                                                            icon: Icon(
                                                              Icons
                                                                  .diamond_outlined,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primary,
                                                              size: 30.0,
                                                            ),
                                                            onPressed: () {
                                                              print(
                                                                  'IconButton pressed ...');
                                                            },
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      15.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Text(
                                                                'Quidly+',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Urbanist',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                      fontSize:
                                                                          25.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                    ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      15.0,
                                                                      0.0,
                                                                      0.0),
                                                          child:
                                                              FlutterFlowIconButton(
                                                            borderColor: Colors
                                                                .transparent,
                                                            borderRadius: 20.0,
                                                            borderWidth: 1.0,
                                                            buttonSize: 60.0,
                                                            icon: Icon(
                                                              Icons
                                                                  .bookmark_border_outlined,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryText,
                                                              size: 30.0,
                                                            ),
                                                            onPressed: () {
                                                              print(
                                                                  'IconButton pressed ...');
                                                            },
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      15.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Text(
                                                                'Bookmarks',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Urbanist',
                                                                      fontSize:
                                                                          25.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                    ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      15.0,
                                                                      0.0,
                                                                      0.0),
                                                          child:
                                                              FlutterFlowIconButton(
                                                            borderColor: Colors
                                                                .transparent,
                                                            borderRadius: 20.0,
                                                            borderWidth: 1.0,
                                                            buttonSize: 60.0,
                                                            icon: Icon(
                                                              Icons.groups,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryText,
                                                              size: 30.0,
                                                            ),
                                                            onPressed: () {
                                                              print(
                                                                  'IconButton pressed ...');
                                                            },
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      15.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Text(
                                                                'Cohort',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Urbanist',
                                                                      fontSize:
                                                                          25.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                    ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                                InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    context.pushNamed(
                                                        'profilePage');
                                                  },
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        15.0,
                                                                        0.0,
                                                                        0.0),
                                                            child:
                                                                FlutterFlowIconButton(
                                                              borderColor: Colors
                                                                  .transparent,
                                                              borderRadius:
                                                                  20.0,
                                                              borderWidth: 1.0,
                                                              buttonSize: 60.0,
                                                              icon: Icon(
                                                                Icons.history,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                size: 30.0,
                                                              ),
                                                              onPressed: () {
                                                                print(
                                                                    'IconButton pressed ...');
                                                              },
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        15.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Text(
                                                                  'History',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Urbanist',
                                                                        fontSize:
                                                                            25.0,
                                                                        fontWeight:
                                                                            FontWeight.bold,
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
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      15.0,
                                                                      0.0,
                                                                      0.0),
                                                          child:
                                                              FlutterFlowIconButton(
                                                            borderColor: Colors
                                                                .transparent,
                                                            borderRadius: 20.0,
                                                            borderWidth: 1.0,
                                                            buttonSize: 60.0,
                                                            icon: Icon(
                                                              Icons
                                                                  .analytics_outlined,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryText,
                                                              size: 30.0,
                                                            ),
                                                            onPressed: () {
                                                              print(
                                                                  'IconButton pressed ...');
                                                            },
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      15.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Text(
                                                                'Analytics',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Urbanist',
                                                                      fontSize:
                                                                          25.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                    ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                0.7,
                                            height: 2.0,
                                            decoration: BoxDecoration(
                                              color: Color(0x6395A1AC),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Container(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                0.85,
                                            height: 100.0,
                                            decoration: BoxDecoration(),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  20.0,
                                                                  30.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Container(
                                                            width: 150.0,
                                                            height: 20.0,
                                                            decoration:
                                                                BoxDecoration(),
                                                            child: Text(
                                                              'Professional Tools',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Urbanist',
                                                                    fontSize:
                                                                        16.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                  ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  20.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Container(
                                                            width: 150.0,
                                                            height: 20.0,
                                                            decoration:
                                                                BoxDecoration(),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          8.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Text(
                                                                'Safety & Support',
                                                                textAlign:
                                                                    TextAlign
                                                                        .start,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Urbanist',
                                                                      fontSize:
                                                                          16.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
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
                                        ],
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Container(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                0.85,
                                            height: 60.0,
                                            decoration: BoxDecoration(),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    Stack(
                                                      children: [
                                                        if ((Theme.of(context)
                                                                    .brightness ==
                                                                Brightness
                                                                    .dark) ==
                                                            false)
                                                          FlutterFlowIconButton(
                                                            borderColor: Colors
                                                                .transparent,
                                                            borderRadius: 20.0,
                                                            borderWidth: 1.0,
                                                            buttonSize: 40.0,
                                                            icon: Icon(
                                                              Icons.light_mode,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryText,
                                                              size: 30.0,
                                                            ),
                                                            onPressed:
                                                                () async {
                                                              setDarkModeSetting(
                                                                  context,
                                                                  ThemeMode
                                                                      .dark);
                                                            },
                                                          ),
                                                        if ((Theme.of(context)
                                                                    .brightness ==
                                                                Brightness
                                                                    .dark) ==
                                                            true)
                                                          FlutterFlowIconButton(
                                                            borderColor: Colors
                                                                .transparent,
                                                            borderRadius: 20.0,
                                                            borderWidth: 1.0,
                                                            buttonSize: 40.0,
                                                            icon: Icon(
                                                              Icons
                                                                  .dark_mode_outlined,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryText,
                                                              size: 30.0,
                                                            ),
                                                            onPressed:
                                                                () async {
                                                              setDarkModeSetting(
                                                                  context,
                                                                  ThemeMode
                                                                      .light);
                                                            },
                                                          ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 32.0),
                                  child: StreamBuilder<List<UserPostsRecord>>(
                                    stream: queryUserPostsRecord(
                                      queryBuilder: (userPostsRecord) =>
                                          userPostsRecord
                                              .where('postUser',
                                                  isEqualTo:
                                                      currentUserReference)
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
                                      List<UserPostsRecord>
                                          socialFeedUserPostsRecordList =
                                          snapshot.data!;
                                      if (socialFeedUserPostsRecordList
                                          .isEmpty) {
                                        return Center(
                                          child: Image.asset(
                                            'assets/images/emptyPosts@2x.png',
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                0.5,
                                            height: 400.0,
                                          ),
                                        );
                                      }
                                      return ListView.builder(
                                        padding: EdgeInsets.zero,
                                        scrollDirection: Axis.vertical,
                                        itemCount: socialFeedUserPostsRecordList
                                            .length,
                                        itemBuilder:
                                            (context, socialFeedIndex) {
                                          final socialFeedUserPostsRecord =
                                              socialFeedUserPostsRecordList[
                                                  socialFeedIndex];
                                          return Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 4.0, 0.0, 8.0),
                                            child: StreamBuilder<UsersRecord>(
                                              stream: UsersRecord.getDocument(
                                                  socialFeedUserPostsRecord
                                                      .postUser!),
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
                                                final userPostUsersRecord =
                                                    snapshot.data!;
                                                return Container(
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          1.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    boxShadow: [
                                                      BoxShadow(
                                                        blurRadius: 4.0,
                                                        color:
                                                            Color(0x32000000),
                                                        offset:
                                                            Offset(0.0, 2.0),
                                                      )
                                                    ],
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            0.0),
                                                  ),
                                                );
                                              },
                                            ),
                                          );
                                        },
                                      );
                                    },
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
            ),
          ),
        ),
      ),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: AppBar(
          backgroundColor: Colors.black,
          automaticallyImplyLeading: false,
          title: Stack(
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: 40.0,
                    height: 40.0,
                    decoration: BoxDecoration(),
                    child: FlutterFlowIconButton(
                      borderRadius: 20.0,
                      borderWidth: 1.0,
                      buttonSize: 40.0,
                      icon: Icon(
                        Icons.person,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 24.0,
                      ),
                      onPressed: () async {
                        scaffoldKey.currentState!.openDrawer();
                      },
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(150.0, 0.0, 0.0, 0.0),
                child: Container(
                  width: 80.0,
                  height: 30.0,
                  decoration: BoxDecoration(),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AutoSizeText(
                        'Quidly',
                        style: GoogleFonts.getFont(
                          'Roboto Mono',
                          fontWeight: FontWeight.normal,
                          fontSize: 20.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          actions: [],
          centerTitle: true,
          elevation: 0.0,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: MediaQuery.sizeOf(context).width * 1.0,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    blurRadius: 3.0,
                    color: Color(0x3A000000),
                    offset: Offset(0.0, 1.0),
                  )
                ],
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(12.0),
                  bottomRight: Radius.circular(12.0),
                  topLeft: Radius.circular(0.0),
                  topRight: Radius.circular(0.0),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    height: 72.0,
                    decoration: BoxDecoration(
                      color: Colors.black,
                    ),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 8.0),
                      child: StreamBuilder<List<UserStoriesRecord>>(
                        stream: queryUserStoriesRecord(
                          queryBuilder: (userStoriesRecord) => userStoriesRecord
                              .orderBy('storyPostedAt', descending: true),
                          limit: 20,
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
                          List<UserStoriesRecord>
                              listViewUserStoriesRecordList = snapshot.data!;
                          if (listViewUserStoriesRecordList.isEmpty) {
                            return Center(
                              child: Image.asset(
                                'assets/images/2vqf7_',
                                width: 60.0,
                              ),
                            );
                          }
                          return ListView.builder(
                            padding: EdgeInsets.zero,
                            scrollDirection: Axis.horizontal,
                            itemCount: listViewUserStoriesRecordList.length,
                            itemBuilder: (context, listViewIndex) {
                              final listViewUserStoriesRecord =
                                  listViewUserStoriesRecordList[listViewIndex];
                              return Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    8.0, 0.0, 8.0, 0.0),
                                child: StreamBuilder<UsersRecord>(
                                  stream: UsersRecord.getDocument(
                                      listViewUserStoriesRecord.user!),
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
                                    final columnUsersRecord = snapshot.data!;
                                    return InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        context.pushNamed(
                                          'storyDetails',
                                          queryParameters: {
                                            'initialStoryIndex': serializeParam(
                                              listViewIndex,
                                              ParamType.int,
                                            ),
                                          }.withoutNulls,
                                          extra: <String, dynamic>{
                                            kTransitionInfoKey: TransitionInfo(
                                              hasTransition: true,
                                              transitionType: PageTransitionType
                                                  .bottomToTop,
                                              duration:
                                                  Duration(milliseconds: 200),
                                            ),
                                          },
                                        );
                                      },
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Container(
                                            width: 56.0,
                                            height: 56.0,
                                            decoration: BoxDecoration(
                                              color: Color(0xFFDCDCDC),
                                              shape: BoxShape.circle,
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(1.0, 1.0, 1.0, 1.0),
                                              child: Container(
                                                width: 55.0,
                                                height: 55.0,
                                                clipBehavior: Clip.antiAlias,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                ),
                                                child: CachedNetworkImage(
                                                  fadeInDuration: Duration(
                                                      milliseconds: 500),
                                                  fadeOutDuration: Duration(
                                                      milliseconds: 500),
                                                  imageUrl:
                                                      valueOrDefault<String>(
                                                    columnUsersRecord.photoUrl,
                                                    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/sample-app-social-app-tx2kqp/assets/ecyxfirnulof/karsten-winegeart-BJaqPaH6AGQ-unsplash.jpg',
                                                  ),
                                                  fit: BoxFit.fitWidth,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 32.0),
              child: StreamBuilder<List<UserPostsRecord>>(
                stream: queryUserPostsRecord(
                  queryBuilder: (userPostsRecord) =>
                      userPostsRecord.orderBy('timePosted', descending: true),
                  limit: 50,
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
                  List<UserPostsRecord> socialFeedUserPostsRecordList =
                      snapshot.data!;
                  if (socialFeedUserPostsRecordList.isEmpty) {
                    return Center(
                      child: Image.asset(
                        'assets/images/emptyPosts@2x.png',
                        width: MediaQuery.sizeOf(context).width * 0.5,
                        height: 400.0,
                      ),
                    );
                  }
                  return Column(
                    mainAxisSize: MainAxisSize.max,
                    children:
                        List.generate(socialFeedUserPostsRecordList.length,
                            (socialFeedIndex) {
                      final socialFeedUserPostsRecord =
                          socialFeedUserPostsRecordList[socialFeedIndex];
                      return FlipCard(
                        fill: Fill.fillBack,
                        direction: FlipDirection.VERTICAL,
                        speed: 400,
                        front: Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: 384.0,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: CachedNetworkImageProvider(
                                socialFeedUserPostsRecord.imageURL,
                              ),
                            ),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 4.0,
                                color: Color(0x33000000),
                                offset: Offset(0.0, 2.0),
                              )
                            ],
                            borderRadius: BorderRadius.circular(0.0),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(0.0),
                            child: BackdropFilter(
                              filter: ImageFilter.blur(
                                sigmaX: 3.0,
                                sigmaY: 3.0,
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 4.0, 0.0, 8.0),
                                child: StreamBuilder<UsersRecord>(
                                  stream: UsersRecord.getDocument(
                                      socialFeedUserPostsRecord.postUser!),
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
                                    final userPostUsersRecord = snapshot.data!;
                                    return Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          1.0,
                                      decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            blurRadius: 4.0,
                                            color: Color(0x32000000),
                                            offset: Offset(0.0, 2.0),
                                          )
                                        ],
                                        borderRadius:
                                            BorderRadius.circular(0.0),
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 8.0, 2.0, 4.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Container(
                                                  width: 200.0,
                                                  height: 50.0,
                                                  decoration: BoxDecoration(
                                                    color: Color(0xAB000000),
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      bottomLeft:
                                                          Radius.circular(0.0),
                                                      bottomRight:
                                                          Radius.circular(16.0),
                                                      topLeft:
                                                          Radius.circular(0.0),
                                                      topRight:
                                                          Radius.circular(16.0),
                                                    ),
                                                  ),
                                                  child: InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      context.pushNamed(
                                                        'viewProfilePageOther',
                                                        queryParameters: {
                                                          'userDetails':
                                                              serializeParam(
                                                            userPostUsersRecord,
                                                            ParamType.Document,
                                                          ),
                                                        }.withoutNulls,
                                                        extra: <String,
                                                            dynamic>{
                                                          'userDetails':
                                                              userPostUsersRecord,
                                                        },
                                                      );
                                                    },
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      8.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Card(
                                                            clipBehavior: Clip
                                                                .antiAliasWithSaveLayer,
                                                            shape:
                                                                RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20.0),
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          1.0,
                                                                          1.0,
                                                                          1.0,
                                                                          1.0),
                                                              child: Container(
                                                                width: 40.0,
                                                                height: 40.0,
                                                                clipBehavior: Clip
                                                                    .antiAlias,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  shape: BoxShape
                                                                      .circle,
                                                                ),
                                                                child:
                                                                    CachedNetworkImage(
                                                                  fadeInDuration:
                                                                      Duration(
                                                                          milliseconds:
                                                                              500),
                                                                  fadeOutDuration:
                                                                      Duration(
                                                                          milliseconds:
                                                                              500),
                                                                  imageUrl:
                                                                      valueOrDefault<
                                                                          String>(
                                                                    userPostUsersRecord
                                                                        .photoUrl,
                                                                    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/sample-app-social-app-tx2kqp/assets/wn636nykq7im/lucrezia-carnelos-0liYTl4dJxk-unsplash.jpg',
                                                                  ),
                                                                  fit: BoxFit
                                                                      .fitWidth,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      12.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Text(
                                                            valueOrDefault<
                                                                String>(
                                                              userPostUsersRecord
                                                                  .userName,
                                                              'myUsername',
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .titleMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Urbanist',
                                                                  color: Color(
                                                                      0xFFDCDCDC),
                                                                ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                FlutterFlowIconButton(
                                                  borderColor:
                                                      Colors.transparent,
                                                  borderRadius: 30.0,
                                                  buttonSize: 46.0,
                                                  icon: Icon(
                                                    Icons.keyboard_control,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                    size: 20.0,
                                                  ),
                                                  onPressed: () async {
                                                    await showModalBottomSheet(
                                                      isScrollControlled: true,
                                                      backgroundColor:
                                                          Color(0x00000000),
                                                      barrierColor:
                                                          Color(0x00000000),
                                                      context: context,
                                                      builder: (context) {
                                                        return Padding(
                                                          padding: MediaQuery
                                                              .viewInsetsOf(
                                                                  context),
                                                          child: Container(
                                                            height: 250.0,
                                                            child:
                                                                DeletePostWidget(),
                                                          ),
                                                        );
                                                      },
                                                    ).then((value) =>
                                                        setState(() {}));
                                                  },
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                1.0,
                                            height: MediaQuery.sizeOf(context)
                                                    .height *
                                                0.3,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                bottomLeft:
                                                    Radius.circular(0.0),
                                                bottomRight:
                                                    Radius.circular(0.0),
                                                topLeft: Radius.circular(0.0),
                                                topRight: Radius.circular(16.0),
                                              ),
                                            ),
                                            child: Stack(
                                              children: [
                                                Stack(
                                                  children: [
                                                    Container(
                                                      width: MediaQuery.sizeOf(
                                                                  context)
                                                              .width *
                                                          1.0,
                                                      height: MediaQuery.sizeOf(
                                                                  context)
                                                              .height *
                                                          0.34,
                                                      decoration: BoxDecoration(
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
                                                                  0.0),
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
                                                                .start,
                                                        children: [
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceEvenly,
                                                              children: [
                                                                Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            8.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child: StreamBuilder<
                                                                        List<
                                                                            UserPostsRecord>>(
                                                                      stream:
                                                                          queryUserPostsRecord(
                                                                        singleRecord:
                                                                            true,
                                                                      ),
                                                                      builder:
                                                                          (context,
                                                                              snapshot) {
                                                                        // Customize what your widget looks like when it's loading.
                                                                        if (!snapshot
                                                                            .hasData) {
                                                                          return Center(
                                                                            child:
                                                                                SizedBox(
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
                                                                        List<UserPostsRecord>
                                                                            containerUserPostsRecordList =
                                                                            snapshot.data!;
                                                                        // Return an empty Container when the item does not exist.
                                                                        if (snapshot
                                                                            .data!
                                                                            .isEmpty) {
                                                                          return Container();
                                                                        }
                                                                        final containerUserPostsRecord = containerUserPostsRecordList.isNotEmpty
                                                                            ? containerUserPostsRecordList.first
                                                                            : null;
                                                                        return Container(
                                                                          width:
                                                                              MediaQuery.sizeOf(context).width * 0.9,
                                                                          height:
                                                                              MediaQuery.sizeOf(context).height * 0.28,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                Color(0xAB000000),
                                                                            borderRadius:
                                                                                BorderRadius.circular(20.0),
                                                                          ),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                5.0,
                                                                                5.0,
                                                                                5.0,
                                                                                5.0),
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                              children: [
                                                                                Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                                  children: [
                                                                                    Container(
                                                                                      width: MediaQuery.sizeOf(context).width * 0.84,
                                                                                      height: 145.0,
                                                                                      decoration: BoxDecoration(
                                                                                        borderRadius: BorderRadius.circular(20.0),
                                                                                      ),
                                                                                      child: Column(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                                                        children: [
                                                                                          Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            mainAxisAlignment: MainAxisAlignment.end,
                                                                                            children: [
                                                                                              Text(
                                                                                                dateTimeFormat('relative', containerUserPostsRecord!.timePosted!),
                                                                                                textAlign: TextAlign.end,
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                          Container(
                                                                                            width: 375.0,
                                                                                            height: 127.0,
                                                                                            decoration: BoxDecoration(),
                                                                                            child: Column(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              children: [
                                                                                                Row(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  children: [
                                                                                                    Column(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      mainAxisAlignment: MainAxisAlignment.end,
                                                                                                      children: [
                                                                                                        Container(
                                                                                                          width: MediaQuery.sizeOf(context).width * 0.84,
                                                                                                          height: 2.0,
                                                                                                          decoration: BoxDecoration(
                                                                                                            color: Color(0xFFDCDCDC),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                                Row(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                                                  children: [
                                                                                                    Column(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      mainAxisAlignment: MainAxisAlignment.end,
                                                                                                      children: [
                                                                                                        Container(
                                                                                                          width: MediaQuery.sizeOf(context).width * 0.84,
                                                                                                          height: 120.0,
                                                                                                          decoration: BoxDecoration(),
                                                                                                          child: Column(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                                                                            children: [
                                                                                                              AutoSizeText(
                                                                                                                socialFeedUserPostsRecord.postPoll.maybeHandleOverflow(
                                                                                                                  maxChars: 100,
                                                                                                                  replacement: '…',
                                                                                                                ),
                                                                                                                textAlign: TextAlign.center,
                                                                                                                maxLines: 4,
                                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                      fontFamily: 'Urbanist',
                                                                                                                      color: Color(0xFFDCDCDC),
                                                                                                                      fontSize: 30.0,
                                                                                                                      fontWeight: FontWeight.bold,
                                                                                                                    ),
                                                                                                              ),
                                                                                                            ],
                                                                                                          ),
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                                Row(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  children: [
                                                                                                    Column(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      mainAxisAlignment: MainAxisAlignment.end,
                                                                                                      children: [
                                                                                                        Container(
                                                                                                          width: MediaQuery.sizeOf(context).width * 0.84,
                                                                                                          height: 2.0,
                                                                                                          decoration: BoxDecoration(
                                                                                                            color: Color(0xFFDCDCDC),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ],
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
                                                                                Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                                  children: [
                                                                                    Align(
                                                                                      alignment: AlignmentDirectional(0.01, 0.87),
                                                                                      child: Container(
                                                                                        width: MediaQuery.sizeOf(context).width * 0.86,
                                                                                        height: 65.0,
                                                                                        decoration: BoxDecoration(
                                                                                          borderRadius: BorderRadius.only(
                                                                                            bottomLeft: Radius.circular(16.0),
                                                                                            bottomRight: Radius.circular(16.0),
                                                                                            topLeft: Radius.circular(0.0),
                                                                                            topRight: Radius.circular(0.0),
                                                                                          ),
                                                                                        ),
                                                                                        child: Column(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                                                          children: [
                                                                                            Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                                              children: [
                                                                                                if (socialFeedUserPostsRecord.postAnswer4 != null && socialFeedUserPostsRecord.postAnswer4 != '')
                                                                                                  FFButtonWidget(
                                                                                                    onPressed: () async {
                                                                                                      currentUserLocationValue = await getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0));
                                                                                                      if (socialFeedUserPostsRecord.votes1.contains(currentUserReference) || socialFeedUserPostsRecord.votes2.contains(currentUserReference) || socialFeedUserPostsRecord.votes3.contains(currentUserReference) || socialFeedUserPostsRecord.votes4.contains(currentUserReference)) {
                                                                                                        return;
                                                                                                      }

                                                                                                      await socialFeedUserPostsRecord.reference.update({
                                                                                                        'votes4': FieldValue.arrayUnion([currentUserReference]),
                                                                                                      });

                                                                                                      await LocationVotesRecord.collection.doc().set(createLocationVotesRecordData(
                                                                                                            userPost: containerUserPostsRecord?.reference,
                                                                                                            voter: currentUserReference,
                                                                                                            voteLocation: currentUserLocationValue,
                                                                                                          ));
                                                                                                    },
                                                                                                    text: socialFeedUserPostsRecord.postAnswer4,
                                                                                                    options: FFButtonOptions(
                                                                                                      width: 77.0,
                                                                                                      height: 50.0,
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                      iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                      color: socialFeedUserPostsRecord.votes4.contains(currentUserReference) ? FlutterFlowTheme.of(context).primary : Color(0xFF2F162C),
                                                                                                      textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                            fontFamily: 'Urbanist',
                                                                                                            color: socialFeedUserPostsRecord.votes4.contains(currentUserReference) ? Color(0xFF2F162C) : Color(0xFFDCDCDC),
                                                                                                          ),
                                                                                                      elevation: 3.0,
                                                                                                      borderSide: BorderSide(
                                                                                                        color: Color(0xFFDCDCDC),
                                                                                                        width: 1.0,
                                                                                                      ),
                                                                                                      borderRadius: BorderRadius.circular(12.0),
                                                                                                    ),
                                                                                                  ),
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                                  child: FFButtonWidget(
                                                                                                    onPressed: () async {
                                                                                                      currentUserLocationValue = await getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0));
                                                                                                      if (socialFeedUserPostsRecord.votes1.contains(currentUserReference) || socialFeedUserPostsRecord.votes2.contains(currentUserReference) || socialFeedUserPostsRecord.votes3.contains(currentUserReference) || socialFeedUserPostsRecord.votes4.contains(currentUserReference)) {
                                                                                                        return;
                                                                                                      }

                                                                                                      await socialFeedUserPostsRecord.reference.update({
                                                                                                        'votes2': FieldValue.arrayUnion([currentUserReference]),
                                                                                                      });

                                                                                                      await LocationVotesRecord.collection.doc().set(createLocationVotesRecordData(
                                                                                                            userPost: containerUserPostsRecord?.reference,
                                                                                                            voter: currentUserReference,
                                                                                                            voteLocation: currentUserLocationValue,
                                                                                                          ));
                                                                                                    },
                                                                                                    text: socialFeedUserPostsRecord.postAnswer2,
                                                                                                    options: FFButtonOptions(
                                                                                                      width: 77.0,
                                                                                                      height: 50.0,
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                      iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                      color: socialFeedUserPostsRecord.votes2.contains(currentUserReference) ? FlutterFlowTheme.of(context).primary : Color(0xFF2F162C),
                                                                                                      textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                            fontFamily: 'Urbanist',
                                                                                                            color: socialFeedUserPostsRecord.votes2.contains(currentUserReference) ? Color(0xFF2F162C) : Color(0xFFDCDCDC),
                                                                                                          ),
                                                                                                      elevation: 3.0,
                                                                                                      borderSide: BorderSide(
                                                                                                        color: Color(0xFFDCDCDC),
                                                                                                        width: 1.0,
                                                                                                      ),
                                                                                                      borderRadius: BorderRadius.circular(12.0),
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                                  child: FFButtonWidget(
                                                                                                    onPressed: () async {
                                                                                                      currentUserLocationValue = await getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0));
                                                                                                      if (socialFeedUserPostsRecord.votes1.contains(currentUserReference) || socialFeedUserPostsRecord.votes2.contains(currentUserReference) || socialFeedUserPostsRecord.votes3.contains(currentUserReference) || socialFeedUserPostsRecord.votes4.contains(currentUserReference)) {
                                                                                                        return;
                                                                                                      }

                                                                                                      await socialFeedUserPostsRecord.reference.update({
                                                                                                        'votes1': FieldValue.arrayUnion([currentUserReference]),
                                                                                                      });

                                                                                                      await LocationVotesRecord.collection.doc().set(createLocationVotesRecordData(
                                                                                                            userPost: containerUserPostsRecord?.reference,
                                                                                                            voter: currentUserReference,
                                                                                                            voteLocation: currentUserLocationValue,
                                                                                                          ));
                                                                                                    },
                                                                                                    text: socialFeedUserPostsRecord.postAnswer1,
                                                                                                    options: FFButtonOptions(
                                                                                                      width: 77.0,
                                                                                                      height: 50.0,
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                      iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                      color: socialFeedUserPostsRecord.votes1.contains(currentUserReference) ? FlutterFlowTheme.of(context).primary : Color(0xFF2F162C),
                                                                                                      textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                            fontFamily: 'Urbanist',
                                                                                                            color: socialFeedUserPostsRecord.votes1.contains(currentUserReference) ? Color(0xFF2F162C) : Color(0xFFDCDCDC),
                                                                                                          ),
                                                                                                      elevation: 3.0,
                                                                                                      borderSide: BorderSide(
                                                                                                        color: Color(0xFFDCDCDC),
                                                                                                        width: 1.0,
                                                                                                      ),
                                                                                                      borderRadius: BorderRadius.circular(12.0),
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                                if (socialFeedUserPostsRecord.postAnswer3 != null && socialFeedUserPostsRecord.postAnswer3 != '')
                                                                                                  Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                                    child: FFButtonWidget(
                                                                                                      onPressed: () async {
                                                                                                        currentUserLocationValue = await getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0));
                                                                                                        if (socialFeedUserPostsRecord.votes1.contains(currentUserReference) || socialFeedUserPostsRecord.votes2.contains(currentUserReference) || socialFeedUserPostsRecord.votes3.contains(currentUserReference) || socialFeedUserPostsRecord.votes4.contains(currentUserReference)) {
                                                                                                          return;
                                                                                                        }

                                                                                                        await socialFeedUserPostsRecord.reference.update({
                                                                                                          'votes3': FieldValue.arrayUnion([currentUserReference]),
                                                                                                        });

                                                                                                        await LocationVotesRecord.collection.doc().set(createLocationVotesRecordData(
                                                                                                              userPost: containerUserPostsRecord?.reference,
                                                                                                              voter: currentUserReference,
                                                                                                              voteLocation: currentUserLocationValue,
                                                                                                            ));
                                                                                                        return;
                                                                                                      },
                                                                                                      text: socialFeedUserPostsRecord.postAnswer3,
                                                                                                      options: FFButtonOptions(
                                                                                                        width: 77.0,
                                                                                                        height: 50.0,
                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                        iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                        color: socialFeedUserPostsRecord.votes3.contains(currentUserReference) ? FlutterFlowTheme.of(context).primary : Color(0xFF2F162C),
                                                                                                        textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                              fontFamily: 'Urbanist',
                                                                                                              color: socialFeedUserPostsRecord.votes3.contains(currentUserReference) ? Color(0xFF2F162C) : Color(0xFFDCDCDC),
                                                                                                            ),
                                                                                                        elevation: 3.0,
                                                                                                        borderSide: BorderSide(
                                                                                                          color: Color(0xFFDCDCDC),
                                                                                                          width: 1.0,
                                                                                                        ),
                                                                                                        borderRadius: BorderRadius.circular(12.0),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                              ],
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
                                                                        );
                                                                      },
                                                                    ),
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
                                              ],
                                            ),
                                          ),
                                          Container(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                1.0,
                                            height: 46.0,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(16.0),
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Container(
                                                  width: 180.0,
                                                  height: 46.0,
                                                  decoration: BoxDecoration(
                                                    color: Color(0xAB000000),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                  ),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: [
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Container(
                                                            width: 95.0,
                                                            height: 50.0,
                                                            decoration:
                                                                BoxDecoration(),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .end,
                                                              children: [
                                                                Container(
                                                                  width: 25.0,
                                                                  height: 30.0,
                                                                  decoration:
                                                                      BoxDecoration(),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Align(
                                                                        alignment: AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              25.0,
                                                                          height:
                                                                              30.0,
                                                                          child:
                                                                              Stack(
                                                                            children: [
                                                                              Align(
                                                                                alignment: AlignmentDirectional(0.0, 0.25),
                                                                                child: Icon(
                                                                                  Icons.timer,
                                                                                  color: FlutterFlowTheme.of(context).primary,
                                                                                  size: 25.0,
                                                                                ).animateOnActionTrigger(animationsMap['iconOnActionTriggerAnimation1']!, hasBeenTriggered: hasIconTriggered1),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          2.0,
                                                                          3.0,
                                                                          0.0,
                                                                          3.0),
                                                                  child:
                                                                      Container(
                                                                    width: 60.0,
                                                                    height:
                                                                        50.0,
                                                                    decoration:
                                                                        BoxDecoration(),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Container(
                                                                          width:
                                                                              60.0,
                                                                          height:
                                                                              100.0,
                                                                          decoration:
                                                                              BoxDecoration(),
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.center,
                                                                            children: [
                                                                              AutoSizeText(
                                                                                socialFeedUserPostsRecord.expiry != null ? dateTimeFormat('relative', socialFeedUserPostsRecord.expiry!) : socialFeedUserPostsRecord.nullExpiry,
                                                                                textAlign: TextAlign.start,
                                                                                maxLines: 2,
                                                                                style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                      fontFamily: 'Lexend Deca',
                                                                                      color: FlutterFlowTheme.of(context).primary,
                                                                                      fontSize: socialFeedUserPostsRecord.expiry != null ? 11.0 : 25.0,
                                                                                      fontWeight: FontWeight.normal,
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
                                                          ),
                                                        ],
                                                      ),
                                                      Container(
                                                        width: 80.0,
                                                        height: 100.0,
                                                        decoration:
                                                            BoxDecoration(),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
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
                                                                width: 24.0,
                                                                height: 50.0,
                                                                decoration:
                                                                    BoxDecoration(),
                                                                child: Stack(
                                                                  children: [
                                                                    if (functions
                                                                            .votes(socialFeedUserPostsRecord)
                                                                            .toString() ==
                                                                        '0')
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            5.0,
                                                                            3.0,
                                                                            0.0),
                                                                        child:
                                                                            Icon(
                                                                          Icons
                                                                              .how_to_vote_rounded,
                                                                          color:
                                                                              Color(0xFF95A1AC),
                                                                          size:
                                                                              30.0,
                                                                        ),
                                                                      ),
                                                                    if (functions
                                                                            .votes(socialFeedUserPostsRecord)
                                                                            .toString() !=
                                                                        '0')
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            5.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Icon(
                                                                          Icons
                                                                              .how_to_vote_rounded,
                                                                          color:
                                                                              Color(0xFF048BCA),
                                                                          size:
                                                                              30.0,
                                                                        ),
                                                                      ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0.0, 0.0),
                                                              child: Container(
                                                                width: 30.0,
                                                                height: 50.0,
                                                                decoration:
                                                                    BoxDecoration(),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          15.0,
                                                                          0.0,
                                                                          15.0),
                                                                  child: Text(
                                                                    functions
                                                                        .votes(
                                                                            socialFeedUserPostsRecord)
                                                                        .toString(),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodySmall
                                                                        .override(
                                                                          fontFamily:
                                                                              'Lexend Deca',
                                                                          color:
                                                                              Color(0xFF8B97A2),
                                                                          fontSize:
                                                                              14.0,
                                                                          fontWeight:
                                                                              FontWeight.normal,
                                                                        ),
                                                                  ),
                                                                ),
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
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                        ),
                        back: Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: 384.0,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: CachedNetworkImageProvider(
                                socialFeedUserPostsRecord.imageURL,
                              ),
                            ),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 4.0,
                                color: Color(0x33000000),
                                offset: Offset(0.0, 2.0),
                              )
                            ],
                            borderRadius: BorderRadius.circular(0.0),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(0.0),
                            child: BackdropFilter(
                              filter: ImageFilter.blur(
                                sigmaX: 3.0,
                                sigmaY: 3.0,
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 4.0, 0.0, 8.0),
                                child: StreamBuilder<UsersRecord>(
                                  stream: UsersRecord.getDocument(
                                      socialFeedUserPostsRecord.postUser!),
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
                                    final userPostUsersRecord = snapshot.data!;
                                    return Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          1.0,
                                      decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            blurRadius: 4.0,
                                            color: Color(0x32000000),
                                            offset: Offset(0.0, 2.0),
                                          )
                                        ],
                                        borderRadius:
                                            BorderRadius.circular(0.0),
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Container(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                1.0,
                                            height: 320.0,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                bottomLeft:
                                                    Radius.circular(0.0),
                                                bottomRight:
                                                    Radius.circular(0.0),
                                                topLeft: Radius.circular(0.0),
                                                topRight: Radius.circular(16.0),
                                              ),
                                            ),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Container(
                                                      width: MediaQuery.sizeOf(
                                                                  context)
                                                              .width *
                                                          1.0,
                                                      height: 270.0,
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Container(
                                                                width: MediaQuery.sizeOf(
                                                                            context)
                                                                        .width *
                                                                    0.1,
                                                                height: 100.0,
                                                                decoration:
                                                                    BoxDecoration(),
                                                              ),
                                                            ],
                                                          ),
                                                          Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            20.0,
                                                                            0.0,
                                                                            0.0),
                                                                child:
                                                                    Container(
                                                                  width: 325.0,
                                                                  height: 250.0,
                                                                  decoration:
                                                                      BoxDecoration(),
                                                                  child:
                                                                      FlipCard(
                                                                    fill: Fill
                                                                        .fillBack,
                                                                    direction:
                                                                        FlipDirection
                                                                            .HORIZONTAL,
                                                                    speed: 400,
                                                                    front:
                                                                        Container(
                                                                      width:
                                                                          310.0,
                                                                      height:
                                                                          100.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        borderRadius:
                                                                            BorderRadius.circular(12.0),
                                                                      ),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            20.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                              children: [
                                                                                Stack(
                                                                                  children: [
                                                                                    if ((socialFeedUserPostsRecord.postAnswer3 == null || socialFeedUserPostsRecord.postAnswer3 == '') && (socialFeedUserPostsRecord.postAnswer4 == null || socialFeedUserPostsRecord.postAnswer4 == '') && (socialFeedUserPostsRecord.postAnswer1 != null && socialFeedUserPostsRecord.postAnswer1 != ''))
                                                                                      Container(
                                                                                        width: MediaQuery.sizeOf(context).width * 0.75,
                                                                                        height: 55.0,
                                                                                        decoration: BoxDecoration(
                                                                                          color: Color(0xAB000000),
                                                                                          borderRadius: BorderRadius.circular(10.0),
                                                                                        ),
                                                                                        child: Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                          child: Column(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            mainAxisAlignment: MainAxisAlignment.start,
                                                                                            children: [
                                                                                              Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                                                children: [
                                                                                                  Column(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                                                    children: [
                                                                                                      Row(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        children: [
                                                                                                          Padding(
                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                                                            child: Container(
                                                                                                              width: 80.0,
                                                                                                              height: 20.0,
                                                                                                              decoration: BoxDecoration(
                                                                                                                color: Color(0xFF3C145E),
                                                                                                                borderRadius: BorderRadius.circular(10.0),
                                                                                                                border: Border.all(
                                                                                                                  color: FlutterFlowTheme.of(context).gray200,
                                                                                                                  width: 1.0,
                                                                                                                ),
                                                                                                              ),
                                                                                                              child: Column(
                                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                                                children: [
                                                                                                                  Row(
                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                                                                    children: [
                                                                                                                      Container(
                                                                                                                        width: 80.0,
                                                                                                                        height: 20.0,
                                                                                                                        decoration: BoxDecoration(),
                                                                                                                        child: Padding(
                                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                                                          child: Text(
                                                                                                                            socialFeedUserPostsRecord.postAnswer1,
                                                                                                                            textAlign: TextAlign.center,
                                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                                                          ),
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    ],
                                                                                                                  ),
                                                                                                                ],
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                                                        ],
                                                                                                      ),
                                                                                                    ],
                                                                                                  ),
                                                                                                  Column(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                                                    children: [
                                                                                                      Row(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        mainAxisAlignment: MainAxisAlignment.end,
                                                                                                        children: [
                                                                                                          Padding(
                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(3.0, 5.0, 0.0, 0.0),
                                                                                                            child: Container(
                                                                                                              width: socialFeedUserPostsRecord.popVotes1.toDouble(),
                                                                                                              height: 20.0,
                                                                                                              decoration: BoxDecoration(
                                                                                                                color: Color(0xFF3C145E),
                                                                                                                borderRadius: BorderRadius.circular(20.0),
                                                                                                                border: Border.all(
                                                                                                                  color: FlutterFlowTheme.of(context).gray200,
                                                                                                                  width: 1.0,
                                                                                                                ),
                                                                                                              ),
                                                                                                              child: Row(
                                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                                mainAxisAlignment: MainAxisAlignment.end,
                                                                                                                children: [
                                                                                                                  Column(
                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                                                                    children: [
                                                                                                                      Row(
                                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                                        mainAxisAlignment: MainAxisAlignment.end,
                                                                                                                        children: [
                                                                                                                          Container(
                                                                                                                            width: 30.0,
                                                                                                                            height: 20.0,
                                                                                                                            decoration: BoxDecoration(),
                                                                                                                            child: Column(
                                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                                                                              children: [
                                                                                                                                Padding(
                                                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
                                                                                                                                  child: Text(
                                                                                                                                    socialFeedUserPostsRecord.percentVotes1,
                                                                                                                                    maxLines: 1,
                                                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                          fontFamily: 'Urbanist',
                                                                                                                                          fontSize: 12.0,
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
                                                                                                                  Column(
                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                    children: [],
                                                                                                                  ),
                                                                                                                ],
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                                                        ],
                                                                                                      ),
                                                                                                    ],
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                              Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                                                children: [
                                                                                                  Column(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                                                    children: [
                                                                                                      Row(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        children: [
                                                                                                          Padding(
                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                                                            child: Container(
                                                                                                              width: 80.0,
                                                                                                              height: 20.0,
                                                                                                              decoration: BoxDecoration(
                                                                                                                color: Color(0xFF6F1CAE),
                                                                                                                borderRadius: BorderRadius.circular(10.0),
                                                                                                                border: Border.all(
                                                                                                                  color: FlutterFlowTheme.of(context).gray200,
                                                                                                                  width: 1.0,
                                                                                                                ),
                                                                                                              ),
                                                                                                              child: Column(
                                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                                                children: [
                                                                                                                  Row(
                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                                                                    children: [
                                                                                                                      Container(
                                                                                                                        width: 80.0,
                                                                                                                        height: 20.0,
                                                                                                                        decoration: BoxDecoration(),
                                                                                                                        child: Padding(
                                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                                                          child: Text(
                                                                                                                            socialFeedUserPostsRecord.postAnswer2,
                                                                                                                            textAlign: TextAlign.center,
                                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                                                          ),
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    ],
                                                                                                                  ),
                                                                                                                ],
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                                                        ],
                                                                                                      ),
                                                                                                    ],
                                                                                                  ),
                                                                                                  Column(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                                                    children: [
                                                                                                      Row(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        mainAxisAlignment: MainAxisAlignment.end,
                                                                                                        children: [
                                                                                                          Padding(
                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(3.0, 5.0, 0.0, 0.0),
                                                                                                            child: Container(
                                                                                                              width: socialFeedUserPostsRecord.popVotes2.toDouble(),
                                                                                                              height: 20.0,
                                                                                                              decoration: BoxDecoration(
                                                                                                                color: Color(0xFF6F1CAE),
                                                                                                                borderRadius: BorderRadius.circular(20.0),
                                                                                                                border: Border.all(
                                                                                                                  color: FlutterFlowTheme.of(context).gray200,
                                                                                                                ),
                                                                                                              ),
                                                                                                              child: Row(
                                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                                mainAxisAlignment: MainAxisAlignment.end,
                                                                                                                children: [
                                                                                                                  Column(
                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                                                                    children: [
                                                                                                                      Row(
                                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                                        mainAxisAlignment: MainAxisAlignment.end,
                                                                                                                        children: [
                                                                                                                          Container(
                                                                                                                            width: 40.0,
                                                                                                                            height: 20.0,
                                                                                                                            decoration: BoxDecoration(),
                                                                                                                            child: Column(
                                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                                                                              children: [
                                                                                                                                Padding(
                                                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
                                                                                                                                  child: Text(
                                                                                                                                    socialFeedUserPostsRecord.percentVotes2,
                                                                                                                                    maxLines: 1,
                                                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                          fontFamily: 'Urbanist',
                                                                                                                                          fontSize: 12.0,
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
                                                                                                                  Column(
                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                    children: [],
                                                                                                                  ),
                                                                                                                ],
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                                                        ],
                                                                                                      ),
                                                                                                    ],
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    if ((socialFeedUserPostsRecord.postAnswer3 != null && socialFeedUserPostsRecord.postAnswer3 != '') && (socialFeedUserPostsRecord.postAnswer4 == null || socialFeedUserPostsRecord.postAnswer4 == '') && (socialFeedUserPostsRecord.postAnswer1 != null && socialFeedUserPostsRecord.postAnswer1 != ''))
                                                                                      Container(
                                                                                        width: MediaQuery.sizeOf(context).width * 0.75,
                                                                                        height: 80.0,
                                                                                        decoration: BoxDecoration(
                                                                                          color: Color(0xAB000000),
                                                                                          borderRadius: BorderRadius.circular(10.0),
                                                                                        ),
                                                                                        child: Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                          child: Column(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            mainAxisAlignment: MainAxisAlignment.start,
                                                                                            children: [
                                                                                              Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                                                children: [
                                                                                                  Column(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                                                    children: [
                                                                                                      Row(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        children: [
                                                                                                          Padding(
                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                                                            child: Container(
                                                                                                              width: 80.0,
                                                                                                              height: 20.0,
                                                                                                              decoration: BoxDecoration(
                                                                                                                color: Color(0xFF3C145E),
                                                                                                                borderRadius: BorderRadius.circular(10.0),
                                                                                                                border: Border.all(
                                                                                                                  color: FlutterFlowTheme.of(context).gray200,
                                                                                                                  width: 1.0,
                                                                                                                ),
                                                                                                              ),
                                                                                                              child: Column(
                                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                                                children: [
                                                                                                                  Row(
                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                                                                    children: [
                                                                                                                      Container(
                                                                                                                        width: 80.0,
                                                                                                                        height: 20.0,
                                                                                                                        decoration: BoxDecoration(),
                                                                                                                        child: Padding(
                                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                                                          child: Text(
                                                                                                                            socialFeedUserPostsRecord.postAnswer1,
                                                                                                                            textAlign: TextAlign.center,
                                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                                                          ),
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    ],
                                                                                                                  ),
                                                                                                                ],
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                                                        ],
                                                                                                      ),
                                                                                                    ],
                                                                                                  ),
                                                                                                  Column(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                                                    children: [
                                                                                                      Row(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        mainAxisAlignment: MainAxisAlignment.end,
                                                                                                        children: [
                                                                                                          Padding(
                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(3.0, 5.0, 0.0, 0.0),
                                                                                                            child: Container(
                                                                                                              width: socialFeedUserPostsRecord.popVotes1.toDouble(),
                                                                                                              height: 20.0,
                                                                                                              decoration: BoxDecoration(
                                                                                                                color: Color(0xFF3C145E),
                                                                                                                borderRadius: BorderRadius.circular(20.0),
                                                                                                                border: Border.all(
                                                                                                                  color: FlutterFlowTheme.of(context).gray200,
                                                                                                                  width: 1.0,
                                                                                                                ),
                                                                                                              ),
                                                                                                              child: Row(
                                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                                mainAxisAlignment: MainAxisAlignment.end,
                                                                                                                children: [
                                                                                                                  Column(
                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                                                                    children: [
                                                                                                                      Row(
                                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                                        mainAxisAlignment: MainAxisAlignment.end,
                                                                                                                        children: [
                                                                                                                          Container(
                                                                                                                            width: 30.0,
                                                                                                                            height: 20.0,
                                                                                                                            decoration: BoxDecoration(),
                                                                                                                            child: Column(
                                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                                                                              children: [
                                                                                                                                Padding(
                                                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
                                                                                                                                  child: Text(
                                                                                                                                    socialFeedUserPostsRecord.percentVotes1,
                                                                                                                                    maxLines: 1,
                                                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                          fontFamily: 'Urbanist',
                                                                                                                                          fontSize: 12.0,
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
                                                                                                                  Column(
                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                    children: [],
                                                                                                                  ),
                                                                                                                ],
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                                                        ],
                                                                                                      ),
                                                                                                    ],
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                              Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                                                children: [
                                                                                                  Column(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                                                    children: [
                                                                                                      Row(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        children: [
                                                                                                          Padding(
                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                                                            child: Container(
                                                                                                              width: 80.0,
                                                                                                              height: 20.0,
                                                                                                              decoration: BoxDecoration(
                                                                                                                color: Color(0xFF6F1CAE),
                                                                                                                borderRadius: BorderRadius.circular(10.0),
                                                                                                                border: Border.all(
                                                                                                                  color: FlutterFlowTheme.of(context).gray200,
                                                                                                                  width: 1.0,
                                                                                                                ),
                                                                                                              ),
                                                                                                              child: Column(
                                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                                                children: [
                                                                                                                  Row(
                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                                                                    children: [
                                                                                                                      Container(
                                                                                                                        width: 80.0,
                                                                                                                        height: 20.0,
                                                                                                                        decoration: BoxDecoration(),
                                                                                                                        child: Padding(
                                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                                                          child: Text(
                                                                                                                            socialFeedUserPostsRecord.postAnswer2,
                                                                                                                            textAlign: TextAlign.center,
                                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                                                          ),
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    ],
                                                                                                                  ),
                                                                                                                ],
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                                                        ],
                                                                                                      ),
                                                                                                    ],
                                                                                                  ),
                                                                                                  Column(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                                                    children: [
                                                                                                      Row(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        mainAxisAlignment: MainAxisAlignment.end,
                                                                                                        children: [
                                                                                                          Padding(
                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(3.0, 5.0, 0.0, 0.0),
                                                                                                            child: Container(
                                                                                                              width: socialFeedUserPostsRecord.popVotes2.toDouble(),
                                                                                                              height: 20.0,
                                                                                                              decoration: BoxDecoration(
                                                                                                                color: Color(0xFF6F1CAE),
                                                                                                                borderRadius: BorderRadius.circular(20.0),
                                                                                                                border: Border.all(
                                                                                                                  color: FlutterFlowTheme.of(context).gray200,
                                                                                                                ),
                                                                                                              ),
                                                                                                              child: Row(
                                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                                mainAxisAlignment: MainAxisAlignment.end,
                                                                                                                children: [
                                                                                                                  Column(
                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                                                                    children: [
                                                                                                                      Row(
                                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                                        mainAxisAlignment: MainAxisAlignment.end,
                                                                                                                        children: [
                                                                                                                          Container(
                                                                                                                            width: 40.0,
                                                                                                                            height: 20.0,
                                                                                                                            decoration: BoxDecoration(),
                                                                                                                            child: Column(
                                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                                                                              children: [
                                                                                                                                Padding(
                                                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
                                                                                                                                  child: Text(
                                                                                                                                    socialFeedUserPostsRecord.percentVotes2,
                                                                                                                                    maxLines: 1,
                                                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                          fontFamily: 'Urbanist',
                                                                                                                                          fontSize: 12.0,
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
                                                                                                                  Column(
                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                    children: [],
                                                                                                                  ),
                                                                                                                ],
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                                                        ],
                                                                                                      ),
                                                                                                    ],
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                              Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                                                children: [
                                                                                                  Column(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                                                    children: [
                                                                                                      Row(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        children: [
                                                                                                          Padding(
                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                                                            child: Container(
                                                                                                              width: 80.0,
                                                                                                              height: 20.0,
                                                                                                              decoration: BoxDecoration(
                                                                                                                color: Color(0xFF2A6CF0),
                                                                                                                borderRadius: BorderRadius.circular(10.0),
                                                                                                                border: Border.all(
                                                                                                                  color: FlutterFlowTheme.of(context).gray200,
                                                                                                                ),
                                                                                                              ),
                                                                                                              child: Column(
                                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                                                children: [
                                                                                                                  Row(
                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                                                                    children: [
                                                                                                                      Container(
                                                                                                                        width: 80.0,
                                                                                                                        height: 20.0,
                                                                                                                        decoration: BoxDecoration(),
                                                                                                                        child: Padding(
                                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                                                          child: Text(
                                                                                                                            socialFeedUserPostsRecord.postAnswer3,
                                                                                                                            textAlign: TextAlign.center,
                                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                                                          ),
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    ],
                                                                                                                  ),
                                                                                                                ],
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                                                        ],
                                                                                                      ),
                                                                                                    ],
                                                                                                  ),
                                                                                                  Column(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                                                    children: [
                                                                                                      Row(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        mainAxisAlignment: MainAxisAlignment.end,
                                                                                                        children: [
                                                                                                          Padding(
                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(3.0, 5.0, 0.0, 0.0),
                                                                                                            child: Container(
                                                                                                              width: socialFeedUserPostsRecord.popVotes3.toDouble(),
                                                                                                              height: 20.0,
                                                                                                              decoration: BoxDecoration(
                                                                                                                color: Color(0xFF2A6CF0),
                                                                                                                borderRadius: BorderRadius.circular(20.0),
                                                                                                                border: Border.all(
                                                                                                                  color: FlutterFlowTheme.of(context).gray200,
                                                                                                                ),
                                                                                                              ),
                                                                                                              child: Row(
                                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                                mainAxisAlignment: MainAxisAlignment.end,
                                                                                                                children: [
                                                                                                                  Column(
                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                                                                    children: [
                                                                                                                      Row(
                                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                                        mainAxisAlignment: MainAxisAlignment.end,
                                                                                                                        children: [
                                                                                                                          Container(
                                                                                                                            width: 40.0,
                                                                                                                            height: 20.0,
                                                                                                                            decoration: BoxDecoration(),
                                                                                                                            child: Column(
                                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                                                                              children: [
                                                                                                                                Padding(
                                                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
                                                                                                                                  child: Text(
                                                                                                                                    socialFeedUserPostsRecord.percentVotes3,
                                                                                                                                    maxLines: 1,
                                                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                          fontFamily: 'Urbanist',
                                                                                                                                          fontSize: 12.0,
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
                                                                                                                  Column(
                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                    children: [],
                                                                                                                  ),
                                                                                                                ],
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                                                        ],
                                                                                                      ),
                                                                                                    ],
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    if ((socialFeedUserPostsRecord.postAnswer3 != null && socialFeedUserPostsRecord.postAnswer3 != '') && (socialFeedUserPostsRecord.postAnswer4 != null && socialFeedUserPostsRecord.postAnswer4 != '') && (socialFeedUserPostsRecord.postAnswer1 != null && socialFeedUserPostsRecord.postAnswer1 != ''))
                                                                                      Container(
                                                                                        width: MediaQuery.sizeOf(context).width * 0.75,
                                                                                        height: 105.0,
                                                                                        decoration: BoxDecoration(
                                                                                          color: Color(0xAB000000),
                                                                                          borderRadius: BorderRadius.circular(10.0),
                                                                                        ),
                                                                                        child: Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                          child: Column(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            mainAxisAlignment: MainAxisAlignment.start,
                                                                                            children: [
                                                                                              Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                                                children: [
                                                                                                  Column(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                                                    children: [
                                                                                                      Row(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        children: [
                                                                                                          Padding(
                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                                                            child: Container(
                                                                                                              width: 80.0,
                                                                                                              height: 20.0,
                                                                                                              decoration: BoxDecoration(
                                                                                                                color: Color(0xFF3C145E),
                                                                                                                borderRadius: BorderRadius.circular(10.0),
                                                                                                                border: Border.all(
                                                                                                                  color: FlutterFlowTheme.of(context).gray200,
                                                                                                                  width: 1.0,
                                                                                                                ),
                                                                                                              ),
                                                                                                              child: Column(
                                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                                                children: [
                                                                                                                  Row(
                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                                                                    children: [
                                                                                                                      Container(
                                                                                                                        width: 80.0,
                                                                                                                        height: 20.0,
                                                                                                                        decoration: BoxDecoration(),
                                                                                                                        child: Padding(
                                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                                                          child: Text(
                                                                                                                            socialFeedUserPostsRecord.postAnswer1,
                                                                                                                            textAlign: TextAlign.center,
                                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                                                          ),
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    ],
                                                                                                                  ),
                                                                                                                ],
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                                                        ],
                                                                                                      ),
                                                                                                    ],
                                                                                                  ),
                                                                                                  Column(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                                                    children: [
                                                                                                      Row(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        mainAxisAlignment: MainAxisAlignment.end,
                                                                                                        children: [
                                                                                                          Padding(
                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(3.0, 5.0, 0.0, 0.0),
                                                                                                            child: Container(
                                                                                                              width: socialFeedUserPostsRecord.popVotes1.toDouble(),
                                                                                                              height: 20.0,
                                                                                                              decoration: BoxDecoration(
                                                                                                                color: Color(0xFF3C145E),
                                                                                                                borderRadius: BorderRadius.circular(20.0),
                                                                                                                border: Border.all(
                                                                                                                  color: FlutterFlowTheme.of(context).gray200,
                                                                                                                  width: 1.0,
                                                                                                                ),
                                                                                                              ),
                                                                                                              child: Row(
                                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                                mainAxisAlignment: MainAxisAlignment.end,
                                                                                                                children: [
                                                                                                                  Column(
                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                                                                    children: [
                                                                                                                      Row(
                                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                                        mainAxisAlignment: MainAxisAlignment.end,
                                                                                                                        children: [
                                                                                                                          Container(
                                                                                                                            width: 30.0,
                                                                                                                            height: 20.0,
                                                                                                                            decoration: BoxDecoration(),
                                                                                                                            child: Column(
                                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                                                                              children: [
                                                                                                                                Padding(
                                                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
                                                                                                                                  child: Text(
                                                                                                                                    socialFeedUserPostsRecord.totalVotes1.toString(),
                                                                                                                                    maxLines: 1,
                                                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                          fontFamily: 'Urbanist',
                                                                                                                                          fontSize: 16.0,
                                                                                                                                          fontWeight: FontWeight.bold,
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
                                                                                                                  Column(
                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                    children: [],
                                                                                                                  ),
                                                                                                                ],
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                                                        ],
                                                                                                      ),
                                                                                                    ],
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                              Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                                                children: [
                                                                                                  Column(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                                                    children: [
                                                                                                      Row(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        children: [
                                                                                                          Padding(
                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                                                            child: Container(
                                                                                                              width: 80.0,
                                                                                                              height: 20.0,
                                                                                                              decoration: BoxDecoration(
                                                                                                                color: Color(0xFF6F1CAE),
                                                                                                                borderRadius: BorderRadius.circular(10.0),
                                                                                                                border: Border.all(
                                                                                                                  color: FlutterFlowTheme.of(context).gray200,
                                                                                                                  width: 1.0,
                                                                                                                ),
                                                                                                              ),
                                                                                                              child: Column(
                                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                                                children: [
                                                                                                                  Row(
                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                                                                    children: [
                                                                                                                      Container(
                                                                                                                        width: 80.0,
                                                                                                                        height: 20.0,
                                                                                                                        decoration: BoxDecoration(),
                                                                                                                        child: Padding(
                                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                                                          child: Text(
                                                                                                                            socialFeedUserPostsRecord.postAnswer2,
                                                                                                                            textAlign: TextAlign.center,
                                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                                                          ),
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    ],
                                                                                                                  ),
                                                                                                                ],
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                                                        ],
                                                                                                      ),
                                                                                                    ],
                                                                                                  ),
                                                                                                  Column(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                                                    children: [
                                                                                                      Row(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        mainAxisAlignment: MainAxisAlignment.end,
                                                                                                        children: [
                                                                                                          Stack(
                                                                                                            children: [
                                                                                                              if (socialFeedUserPostsRecord.popVotes1 < 10)
                                                                                                                Padding(
                                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(3.0, 5.0, 0.0, 0.0),
                                                                                                                  child: Container(
                                                                                                                    width: socialFeedUserPostsRecord.popVotes2.toDouble(),
                                                                                                                    height: 20.0,
                                                                                                                    decoration: BoxDecoration(
                                                                                                                      color: Color(0xFF6F1CAE),
                                                                                                                      borderRadius: BorderRadius.circular(20.0),
                                                                                                                      border: Border.all(
                                                                                                                        color: FlutterFlowTheme.of(context).gray200,
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                    child: Row(
                                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                                      mainAxisAlignment: MainAxisAlignment.end,
                                                                                                                      children: [
                                                                                                                        Column(
                                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                                                                                          children: [
                                                                                                                            Row(
                                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                                              mainAxisAlignment: MainAxisAlignment.end,
                                                                                                                              children: [
                                                                                                                                Container(
                                                                                                                                  width: 40.0,
                                                                                                                                  height: 20.0,
                                                                                                                                  decoration: BoxDecoration(),
                                                                                                                                  child: Column(
                                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                                                                                    children: [
                                                                                                                                      Padding(
                                                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
                                                                                                                                        child: Text(
                                                                                                                                          socialFeedUserPostsRecord.percentVotes2,
                                                                                                                                          maxLines: 1,
                                                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                                fontFamily: 'Urbanist',
                                                                                                                                                fontSize: 12.0,
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
                                                                                                                        Column(
                                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                                          children: [],
                                                                                                                        ),
                                                                                                                      ],
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                ),
                                                                                                              Padding(
                                                                                                                padding: EdgeInsetsDirectional.fromSTEB(3.0, 5.0, 0.0, 0.0),
                                                                                                                child: Container(
                                                                                                                  width: socialFeedUserPostsRecord.popVotes2.toDouble(),
                                                                                                                  height: 20.0,
                                                                                                                  decoration: BoxDecoration(
                                                                                                                    color: Color(0xFF6F1CAE),
                                                                                                                    borderRadius: BorderRadius.circular(20.0),
                                                                                                                    border: Border.all(
                                                                                                                      color: FlutterFlowTheme.of(context).gray200,
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                  child: Row(
                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                    mainAxisAlignment: MainAxisAlignment.end,
                                                                                                                    children: [
                                                                                                                      Column(
                                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                                                                                        children: [
                                                                                                                          Row(
                                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                                            mainAxisAlignment: MainAxisAlignment.end,
                                                                                                                            children: [
                                                                                                                              Container(
                                                                                                                                width: 40.0,
                                                                                                                                height: 20.0,
                                                                                                                                decoration: BoxDecoration(),
                                                                                                                                child: Column(
                                                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                                                                                  children: [
                                                                                                                                    Padding(
                                                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
                                                                                                                                      child: Text(
                                                                                                                                        socialFeedUserPostsRecord.totalVotes2.toString(),
                                                                                                                                        maxLines: 1,
                                                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                              fontFamily: 'Urbanist',
                                                                                                                                              fontSize: 16.0,
                                                                                                                                              fontWeight: FontWeight.bold,
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
                                                                                                                      Column(
                                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                                        children: [],
                                                                                                                      ),
                                                                                                                    ],
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ),
                                                                                                            ],
                                                                                                          ),
                                                                                                        ],
                                                                                                      ),
                                                                                                    ],
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                              Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                                                children: [
                                                                                                  Column(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                                                    children: [
                                                                                                      Row(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        children: [
                                                                                                          Padding(
                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                                                            child: Container(
                                                                                                              width: 80.0,
                                                                                                              height: 20.0,
                                                                                                              decoration: BoxDecoration(
                                                                                                                color: Color(0xFF2A6CF0),
                                                                                                                borderRadius: BorderRadius.circular(10.0),
                                                                                                                border: Border.all(
                                                                                                                  color: FlutterFlowTheme.of(context).gray200,
                                                                                                                ),
                                                                                                              ),
                                                                                                              child: Column(
                                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                                                children: [
                                                                                                                  Row(
                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                                                                    children: [
                                                                                                                      Container(
                                                                                                                        width: 80.0,
                                                                                                                        height: 20.0,
                                                                                                                        decoration: BoxDecoration(),
                                                                                                                        child: Padding(
                                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                                                          child: Text(
                                                                                                                            socialFeedUserPostsRecord.postAnswer3,
                                                                                                                            textAlign: TextAlign.center,
                                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                                                          ),
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    ],
                                                                                                                  ),
                                                                                                                ],
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                                                        ],
                                                                                                      ),
                                                                                                    ],
                                                                                                  ),
                                                                                                  Column(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                                                    children: [
                                                                                                      Row(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        mainAxisAlignment: MainAxisAlignment.end,
                                                                                                        children: [
                                                                                                          Padding(
                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(3.0, 5.0, 0.0, 0.0),
                                                                                                            child: Container(
                                                                                                              width: socialFeedUserPostsRecord.popVotes3.toDouble(),
                                                                                                              height: 20.0,
                                                                                                              decoration: BoxDecoration(
                                                                                                                color: Color(0xFF2A6CF0),
                                                                                                                borderRadius: BorderRadius.circular(20.0),
                                                                                                                border: Border.all(
                                                                                                                  color: FlutterFlowTheme.of(context).gray200,
                                                                                                                ),
                                                                                                              ),
                                                                                                              child: Row(
                                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                                mainAxisAlignment: MainAxisAlignment.end,
                                                                                                                children: [
                                                                                                                  Column(
                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                                                                    children: [
                                                                                                                      Row(
                                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                                        mainAxisAlignment: MainAxisAlignment.end,
                                                                                                                        children: [
                                                                                                                          Container(
                                                                                                                            width: 40.0,
                                                                                                                            height: 20.0,
                                                                                                                            decoration: BoxDecoration(),
                                                                                                                            child: Column(
                                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                                                                              children: [
                                                                                                                                Padding(
                                                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
                                                                                                                                  child: Text(
                                                                                                                                    socialFeedUserPostsRecord.totalVotes3.toString(),
                                                                                                                                    maxLines: 1,
                                                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                          fontFamily: 'Urbanist',
                                                                                                                                          fontSize: 16.0,
                                                                                                                                          fontWeight: FontWeight.bold,
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
                                                                                                                  Column(
                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                    children: [],
                                                                                                                  ),
                                                                                                                ],
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                                                        ],
                                                                                                      ),
                                                                                                    ],
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                              Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                                                children: [
                                                                                                  Column(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                                                    children: [
                                                                                                      Row(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        children: [
                                                                                                          Padding(
                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                                                            child: Container(
                                                                                                              width: 80.0,
                                                                                                              height: 20.0,
                                                                                                              decoration: BoxDecoration(
                                                                                                                color: FlutterFlowTheme.of(context).info,
                                                                                                                borderRadius: BorderRadius.circular(10.0),
                                                                                                                border: Border.all(
                                                                                                                  color: FlutterFlowTheme.of(context).gray200,
                                                                                                                ),
                                                                                                              ),
                                                                                                              child: Column(
                                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                                                children: [
                                                                                                                  Row(
                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                                                                    children: [
                                                                                                                      Container(
                                                                                                                        width: 80.0,
                                                                                                                        height: 20.0,
                                                                                                                        decoration: BoxDecoration(),
                                                                                                                        child: Padding(
                                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                                                          child: Text(
                                                                                                                            socialFeedUserPostsRecord.postAnswer4,
                                                                                                                            textAlign: TextAlign.center,
                                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                                                          ),
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    ],
                                                                                                                  ),
                                                                                                                ],
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                                                        ],
                                                                                                      ),
                                                                                                    ],
                                                                                                  ),
                                                                                                  Column(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                                                    children: [
                                                                                                      Row(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        mainAxisAlignment: MainAxisAlignment.end,
                                                                                                        children: [
                                                                                                          Padding(
                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(3.0, 5.0, 0.0, 0.0),
                                                                                                            child: Container(
                                                                                                              width: valueOrDefault<double>(
                                                                                                                socialFeedUserPostsRecord.popVotes4.toDouble(),
                                                                                                                30.0,
                                                                                                              ),
                                                                                                              height: 20.0,
                                                                                                              decoration: BoxDecoration(
                                                                                                                color: Color(0xFF1C4796),
                                                                                                                borderRadius: BorderRadius.circular(20.0),
                                                                                                                border: Border.all(
                                                                                                                  color: FlutterFlowTheme.of(context).gray200,
                                                                                                                ),
                                                                                                              ),
                                                                                                              child: Row(
                                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                                mainAxisAlignment: MainAxisAlignment.end,
                                                                                                                children: [
                                                                                                                  Column(
                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                                                                    children: [
                                                                                                                      Row(
                                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                                        mainAxisAlignment: MainAxisAlignment.end,
                                                                                                                        children: [
                                                                                                                          Container(
                                                                                                                            width: 40.0,
                                                                                                                            height: 20.0,
                                                                                                                            decoration: BoxDecoration(),
                                                                                                                            child: Column(
                                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                                                                              children: [
                                                                                                                                Padding(
                                                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
                                                                                                                                  child: Text(
                                                                                                                                    socialFeedUserPostsRecord.totalVotes4.toString(),
                                                                                                                                    maxLines: 1,
                                                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                          fontFamily: 'Urbanist',
                                                                                                                                          fontSize: 16.0,
                                                                                                                                          fontWeight: FontWeight.bold,
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
                                                                                                                  Column(
                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                    children: [],
                                                                                                                  ),
                                                                                                                ],
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                                                        ],
                                                                                                      ),
                                                                                                    ],
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                  ],
                                                                                ),
                                                                              ],
                                                                            ),
                                                                            Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                              children: [
                                                                                Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                                  children: [
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                                                                                      child: Container(
                                                                                        width: MediaQuery.sizeOf(context).width * 0.75,
                                                                                        height: 120.0,
                                                                                        decoration: BoxDecoration(
                                                                                          borderRadius: BorderRadius.circular(10.0),
                                                                                        ),
                                                                                        child: Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Column(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              children: [
                                                                                                Container(
                                                                                                  width: 120.0,
                                                                                                  height: 120.0,
                                                                                                  decoration: BoxDecoration(
                                                                                                    color: Color(0xAB000000),
                                                                                                    borderRadius: BorderRadius.circular(10.0),
                                                                                                  ),
                                                                                                  child: Stack(
                                                                                                    children: [
                                                                                                      if ((socialFeedUserPostsRecord.popVotes1 > 0) || (socialFeedUserPostsRecord.popVotes2 > 0) || (socialFeedUserPostsRecord.popVotes3 > 0) || (socialFeedUserPostsRecord.popVotes4 > 0))
                                                                                                        Container(
                                                                                                          width: 120.0,
                                                                                                          height: 120.0,
                                                                                                          child: FlutterFlowPieChart(
                                                                                                            data: FFPieChartData(
                                                                                                              values: socialFeedUserPostsRecord.intPercentVotes,
                                                                                                              colors: chartPieChartColorsList1,
                                                                                                              radius: [25.0],
                                                                                                            ),
                                                                                                            donutHoleRadius: 35.0,
                                                                                                            donutHoleColor: Colors.transparent,
                                                                                                            sectionLabelType: PieChartSectionLabelType.percent,
                                                                                                            sectionLabelStyle: FlutterFlowTheme.of(context).headlineSmall.override(
                                                                                                                  fontFamily: 'Urbanist',
                                                                                                                  fontSize: 10.0,
                                                                                                                ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      if ((socialFeedUserPostsRecord.popVotes1 == 0) && (socialFeedUserPostsRecord.popVotes2 == 0) && (socialFeedUserPostsRecord.popVotes3 == 0) && (socialFeedUserPostsRecord.popVotes4 == 0))
                                                                                                        Container(
                                                                                                          width: 120.0,
                                                                                                          height: 120.0,
                                                                                                          child: FlutterFlowPieChart(
                                                                                                            data: FFPieChartData(
                                                                                                              values: [
                                                                                                                _model.pieDefault1!,
                                                                                                                _model.pieDefault1!,
                                                                                                                _model.pieDefault1!,
                                                                                                                _model.pieDefault1!
                                                                                                              ],
                                                                                                              colors: [
                                                                                                                Color(0xFF3C145E),
                                                                                                                Color(0xFF8A2DD0),
                                                                                                                Color(0xFF1C4796),
                                                                                                                Color(0xFF4383FF)
                                                                                                              ],
                                                                                                              radius: [25.0, 25.0, 25.0, 25.0],
                                                                                                            ),
                                                                                                            donutHoleRadius: 35.0,
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
                                                                                              ],
                                                                                            ),
                                                                                            Column(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              children: [
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                                  child: MapGoogleWidget(
                                                                                                    key: Key('Keyprj_${socialFeedIndex}_of_${socialFeedUserPostsRecordList.length}'),
                                                                                                    parameter1: socialFeedUserPostsRecord.pollLocation,
                                                                                                  ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    back:
                                                                        Container(
                                                                      width: MediaQuery.sizeOf(context)
                                                                              .width *
                                                                          0.9,
                                                                      height:
                                                                          300.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: Color(
                                                                            0x97000000),
                                                                        borderRadius:
                                                                            BorderRadius.circular(20.0),
                                                                      ),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children: [
                                                                          Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.center,
                                                                            children: [
                                                                              Container(
                                                                                width: MediaQuery.sizeOf(context).width * 0.7,
                                                                                height: 210.0,
                                                                                decoration: BoxDecoration(
                                                                                  borderRadius: BorderRadius.circular(20.0),
                                                                                ),
                                                                                child: MapGoogleWidget(
                                                                                  key: Key('Keyldb_${socialFeedIndex}_of_${socialFeedUserPostsRecordList.length}'),
                                                                                  parameter1: socialFeedUserPostsRecord.pollLocation,
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
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
                                                      width: MediaQuery.sizeOf(
                                                                  context)
                                                              .width *
                                                          1.0,
                                                      height: 50.0,
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          wrapWithModel(
                                                            model: _model
                                                                .timeTravelModels
                                                                .getModel(
                                                              random_data
                                                                  .randomInteger(
                                                                      0, 10)
                                                                  .toString(),
                                                              socialFeedIndex,
                                                            ),
                                                            updateCallback:
                                                                () => setState(
                                                                    () {}),
                                                            child:
                                                                TimeTravelWidget(
                                                              key: Key(
                                                                'Keyydn_${random_data.randomInteger(0, 10).toString()}',
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
                                          Container(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                1.0,
                                            height: 50.0,
                                            decoration: BoxDecoration(
                                              color: Color(0x86000000),
                                              borderRadius:
                                                  BorderRadius.circular(16.0),
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Container(
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          0.65,
                                                  height: 46.0,
                                                  decoration: BoxDecoration(),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(8.0, 4.0,
                                                                0.0, 0.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Container(
                                                              width: 35.0,
                                                              height: 100.0,
                                                              decoration:
                                                                  BoxDecoration(),
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
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          5.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Container(
                                                                        width:
                                                                            25.0,
                                                                        height:
                                                                            25.0,
                                                                        child:
                                                                            Stack(
                                                                          children: [
                                                                            if (!socialFeedUserPostsRecord.likes.contains(currentUserReference))
                                                                              Align(
                                                                                alignment: AlignmentDirectional(0.0, 0.25),
                                                                                child: InkWell(
                                                                                  splashColor: Colors.transparent,
                                                                                  focusColor: Colors.transparent,
                                                                                  hoverColor: Colors.transparent,
                                                                                  highlightColor: Colors.transparent,
                                                                                  onTap: () async {
                                                                                    if (socialFeedUserPostsRecord.shits.contains(currentUserReference) != null) {
                                                                                      await socialFeedUserPostsRecord.reference.update({
                                                                                        'likes': FieldValue.arrayUnion([
                                                                                          currentUserReference
                                                                                        ]),
                                                                                        'shits': FieldValue.arrayRemove([
                                                                                          currentUserReference
                                                                                        ]),
                                                                                      });
                                                                                    } else {
                                                                                      await socialFeedUserPostsRecord.reference.update({
                                                                                        'likes': FieldValue.arrayUnion([
                                                                                          currentUserReference
                                                                                        ]),
                                                                                      });
                                                                                    }
                                                                                  },
                                                                                  child: FaIcon(
                                                                                    FontAwesomeIcons.solidHeart,
                                                                                    color: Color(0xFF95A1AC),
                                                                                    size: 25.0,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            if (socialFeedUserPostsRecord.likes.contains(currentUserReference))
                                                                              Align(
                                                                                alignment: AlignmentDirectional(0.0, 0.25),
                                                                                child: InkWell(
                                                                                  splashColor: Colors.transparent,
                                                                                  focusColor: Colors.transparent,
                                                                                  hoverColor: Colors.transparent,
                                                                                  highlightColor: Colors.transparent,
                                                                                  onTap: () async {
                                                                                    await socialFeedUserPostsRecord.reference.update({
                                                                                      'likes': FieldValue.arrayRemove([
                                                                                        currentUserReference
                                                                                      ]),
                                                                                    });
                                                                                  },
                                                                                  child: FaIcon(
                                                                                    FontAwesomeIcons.solidHeart,
                                                                                    color: FlutterFlowTheme.of(context).error,
                                                                                    size: 25.0,
                                                                                  ),
                                                                                ).animateOnActionTrigger(animationsMap['iconOnActionTriggerAnimation2']!, hasBeenTriggered: hasIconTriggered2),
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
                                                              decoration:
                                                                  BoxDecoration(),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .end,
                                                                children: [
                                                                  Container(
                                                                    width: 30.0,
                                                                    height:
                                                                        30.0,
                                                                    decoration:
                                                                        BoxDecoration(),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          4.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Text(
                                                                        functions
                                                                            .likes(socialFeedUserPostsRecord)
                                                                            .toString(),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodySmall
                                                                            .override(
                                                                              fontFamily: 'Lexend Deca',
                                                                              color: Color(0xFF8B97A2),
                                                                              fontSize: 14.0,
                                                                              fontWeight: FontWeight.normal,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          5.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Container(
                                                                width: 35.0,
                                                                height: 30.0,
                                                                decoration:
                                                                    BoxDecoration(),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          5.0,
                                                                          0.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Align(
                                                                        alignment: AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              30.0,
                                                                          height:
                                                                              30.0,
                                                                          child:
                                                                              Stack(
                                                                            children: [
                                                                              if (!socialFeedUserPostsRecord.shits.contains(currentUserReference))
                                                                                Align(
                                                                                  alignment: AlignmentDirectional(0.0, 0.25),
                                                                                  child: InkWell(
                                                                                    splashColor: Colors.transparent,
                                                                                    focusColor: Colors.transparent,
                                                                                    hoverColor: Colors.transparent,
                                                                                    highlightColor: Colors.transparent,
                                                                                    onTap: () async {
                                                                                      await socialFeedUserPostsRecord.reference.update({
                                                                                        'shits': FieldValue.arrayUnion([
                                                                                          currentUserReference
                                                                                        ]),
                                                                                      });
                                                                                      if (socialFeedUserPostsRecord.shits.contains(currentUserReference) != null) {
                                                                                        await socialFeedUserPostsRecord.reference.update({
                                                                                          'shits': FieldValue.arrayUnion([
                                                                                            currentUserReference
                                                                                          ]),
                                                                                          'likes': FieldValue.arrayRemove([
                                                                                            currentUserReference
                                                                                          ]),
                                                                                        });
                                                                                      } else {
                                                                                        await socialFeedUserPostsRecord.reference.update({
                                                                                          'shits': FieldValue.arrayUnion([
                                                                                            currentUserReference
                                                                                          ]),
                                                                                        });
                                                                                      }
                                                                                    },
                                                                                    child: FaIcon(
                                                                                      FontAwesomeIcons.poo,
                                                                                      color: Color(0xFF95A1AC),
                                                                                      size: 25.0,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              if (socialFeedUserPostsRecord.shits.contains(currentUserReference))
                                                                                Align(
                                                                                  alignment: AlignmentDirectional(0.0, 0.25),
                                                                                  child: InkWell(
                                                                                    splashColor: Colors.transparent,
                                                                                    focusColor: Colors.transparent,
                                                                                    hoverColor: Colors.transparent,
                                                                                    highlightColor: Colors.transparent,
                                                                                    onTap: () async {
                                                                                      await socialFeedUserPostsRecord.reference.update({
                                                                                        'shits': FieldValue.arrayRemove([
                                                                                          currentUserReference
                                                                                        ]),
                                                                                      });
                                                                                    },
                                                                                    child: FaIcon(
                                                                                      FontAwesomeIcons.poo,
                                                                                      color: Color(0xFF9B5F3C),
                                                                                      size: 25.0,
                                                                                    ),
                                                                                  ).animateOnActionTrigger(animationsMap['iconOnActionTriggerAnimation3']!, hasBeenTriggered: hasIconTriggered3),
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
                                                              decoration:
                                                                  BoxDecoration(),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .end,
                                                                children: [
                                                                  Container(
                                                                    width: 30.0,
                                                                    height:
                                                                        30.0,
                                                                    decoration:
                                                                        BoxDecoration(),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          4.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Text(
                                                                        valueOrDefault<
                                                                            String>(
                                                                          functions
                                                                              .shits(socialFeedUserPostsRecord)
                                                                              .toString(),
                                                                          '0',
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodySmall
                                                                            .override(
                                                                              fontFamily: 'Lexend Deca',
                                                                              color: Color(0xFF8B97A2),
                                                                              fontSize: 14.0,
                                                                              fontWeight: FontWeight.normal,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          5.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Container(
                                                                width: 30.0,
                                                                height: 30.0,
                                                                decoration:
                                                                    BoxDecoration(),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Stack(
                                                                      children: [
                                                                        if (socialFeedUserPostsRecord.numComments ==
                                                                            0)
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
                                                                              context.pushNamed(
                                                                                'postDetails',
                                                                                extra: <String, dynamic>{
                                                                                  kTransitionInfoKey: TransitionInfo(
                                                                                    hasTransition: true,
                                                                                    transitionType: PageTransitionType.bottomToTop,
                                                                                  ),
                                                                                },
                                                                              );
                                                                            },
                                                                            child:
                                                                                Icon(
                                                                              Icons.mode_comment_outlined,
                                                                              color: Color(0xFF95A1AC),
                                                                              size: 24.0,
                                                                            ),
                                                                          ),
                                                                        if (socialFeedUserPostsRecord.numComments >
                                                                            0)
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
                                                                              context.pushNamed('postDetails');
                                                                            },
                                                                            child:
                                                                                Icon(
                                                                              Icons.mode_comment_outlined,
                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                              size: 24.0,
                                                                            ),
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
                                                              decoration:
                                                                  BoxDecoration(),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .end,
                                                                children: [
                                                                  Container(
                                                                    width: 30.0,
                                                                    height:
                                                                        30.0,
                                                                    decoration:
                                                                        BoxDecoration(),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          4.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Text(
                                                                        socialFeedUserPostsRecord
                                                                            .numComments
                                                                            .toString(),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodySmall
                                                                            .override(
                                                                              fontFamily: 'Lexend Deca',
                                                                              color: Color(0xFF8B97A2),
                                                                              fontSize: 14.0,
                                                                              fontWeight: FontWeight.normal,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          5.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Container(
                                                                width: 24.0,
                                                                height: 30.0,
                                                                decoration:
                                                                    BoxDecoration(),
                                                                child: Stack(
                                                                  children: [
                                                                    if (functions
                                                                            .votes(socialFeedUserPostsRecord)
                                                                            .toString() ==
                                                                        '0')
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            3.0,
                                                                            0.0),
                                                                        child:
                                                                            Icon(
                                                                          Icons
                                                                              .how_to_vote_rounded,
                                                                          color:
                                                                              Color(0xFF95A1AC),
                                                                          size:
                                                                              30.0,
                                                                        ),
                                                                      ),
                                                                    if (functions
                                                                            .votes(socialFeedUserPostsRecord)
                                                                            .toString() !=
                                                                        '0')
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            3.0,
                                                                            0.0),
                                                                        child:
                                                                            Icon(
                                                                          Icons
                                                                              .how_to_vote_rounded,
                                                                          color:
                                                                              Color(0xFF048BCA),
                                                                          size:
                                                                              30.0,
                                                                        ),
                                                                      ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                            Container(
                                                              width: 20.0,
                                                              height: 100.0,
                                                              decoration:
                                                                  BoxDecoration(),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .end,
                                                                children: [
                                                                  Container(
                                                                    width: 30.0,
                                                                    height:
                                                                        30.0,
                                                                    decoration:
                                                                        BoxDecoration(),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          6.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Text(
                                                                        functions
                                                                            .votes(socialFeedUserPostsRecord)
                                                                            .toString(),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodySmall
                                                                            .override(
                                                                              fontFamily: 'Lexend Deca',
                                                                              color: Color(0xFF8B97A2),
                                                                              fontSize: 14.0,
                                                                              fontWeight: FontWeight.normal,
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
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 2.0, 0.0),
                                                  child: Container(
                                                    width: 135.0,
                                                    height: 45.0,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        bottomLeft:
                                                            Radius.circular(
                                                                16.0),
                                                        bottomRight:
                                                            Radius.circular(
                                                                16.0),
                                                        topLeft:
                                                            Radius.circular(
                                                                0.0),
                                                        topRight:
                                                            Radius.circular(
                                                                0.0),
                                                      ),
                                                    ),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      2.0,
                                                                      8.0,
                                                                      0.0),
                                                          child: Text(
                                                            dateTimeFormat(
                                                                'relative',
                                                                socialFeedUserPostsRecord
                                                                    .timePosted!),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Urbanist',
                                                                  color: Color(
                                                                      0xFFC6C6C6),
                                                                ),
                                                          ),
                                                        ),
                                                        Icon(
                                                          Icons.ios_share,
                                                          color:
                                                              Color(0xFF95A1AC),
                                                          size: 24.0,
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
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
