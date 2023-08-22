import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/post_menu/post_menu_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'search_copy_model.dart';
export 'search_copy_model.dart';

class SearchCopyWidget extends StatefulWidget {
  const SearchCopyWidget({Key? key}) : super(key: key);

  @override
  _SearchCopyWidgetState createState() => _SearchCopyWidgetState();
}

class _SearchCopyWidgetState extends State<SearchCopyWidget>
    with TickerProviderStateMixin {
  late SearchCopyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  var hasIconTriggered = false;
  final animationsMap = {
    'iconOnActionTriggerAnimation': AnimationInfo(
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
    _model = createModel(context, () => SearchCopyModel());

    _model.textController ??= TextEditingController();
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

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
          child: Container(
            width: MediaQuery.sizeOf(context).width * 1.0,
            height: MediaQuery.sizeOf(context).height * 1.0,
            decoration: BoxDecoration(
              color: Colors.black,
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 8.0),
                    child: TextFormField(
                      controller: _model.textController,
                      autofocus: true,
                      obscureText: false,
                      decoration: InputDecoration(
                        labelText: 'Search all questions...',
                        labelStyle: FlutterFlowTheme.of(context).labelMedium,
                        hintStyle: FlutterFlowTheme.of(context).labelMedium,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).alternate,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).primary,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).error,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).error,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        contentPadding:
                            EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
                        suffixIcon: Icon(
                          Icons.search_rounded,
                          color: FlutterFlowTheme.of(context).secondaryText,
                        ),
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium,
                      cursorColor: FlutterFlowTheme.of(context).primary,
                      validator:
                          _model.textControllerValidator.asValidator(context),
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 8.0, 0.0, 8.0),
                              child: FlutterFlowChoiceChips(
                                options: [
                                  ChipData('For You'),
                                  ChipData('Trending'),
                                  ChipData('News'),
                                  ChipData('Entertainment'),
                                  ChipData('Sports'),
                                  ChipData('Technology'),
                                  ChipData('Politics')
                                ],
                                onChanged: (val) => setState(
                                    () => _model.choiceChipsValue = val?.first),
                                selectedChipStyle: ChipStyle(
                                  backgroundColor:
                                      FlutterFlowTheme.of(context).primary,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Urbanist',
                                        color:
                                            FlutterFlowTheme.of(context).info,
                                      ),
                                  iconColor: FlutterFlowTheme.of(context).info,
                                  iconSize: 18.0,
                                  elevation: 2.0,
                                  borderColor:
                                      FlutterFlowTheme.of(context).accent1,
                                  borderWidth: 1.0,
                                  borderRadius: BorderRadius.circular(16.0),
                                ),
                                unselectedChipStyle: ChipStyle(
                                  backgroundColor:
                                      FlutterFlowTheme.of(context).alternate,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Urbanist',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                      ),
                                  iconColor: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  iconSize: 18.0,
                                  elevation: 0.0,
                                  borderColor: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  borderWidth: 1.0,
                                  borderRadius: BorderRadius.circular(16.0),
                                ),
                                chipSpacing: 5.0,
                                rowSpacing: 12.0,
                                multiselect: false,
                                initialized: _model.choiceChipsValue != null,
                                alignment: WrapAlignment.start,
                                controller:
                                    _model.choiceChipsValueController ??=
                                        FormFieldController<List<String>>(
                                  ['For You'],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ]
                          .addToStart(SizedBox(width: 16.0))
                          .addToEnd(SizedBox(width: 16.0)),
                    ),
                  ),
                  Divider(
                    thickness: 1.0,
                    color: FlutterFlowTheme.of(context).alternate,
                  ),
                  if (_model.choiceChipsValue == 'For You')
                    Container(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      height: 200.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: Image.asset(
                            'assets/images/CNX_UPhysics_09_00_Baseball.jpg',
                          ).image,
                        ),
                      ),
                    ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 0.0, 0.0),
                    child: Text(
                      'Popular Today',
                      style: FlutterFlowTheme.of(context).labelMedium,
                    ),
                  ),
                  Container(
                    width: 100.0,
                    height: 100.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 32.0),
                      child: StreamBuilder<List<UserPostsRecord>>(
                        stream: queryUserPostsRecord(
                          queryBuilder: (userPostsRecord) => userPostsRecord
                              .orderBy('timePosted', descending: true),
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
                            children: List.generate(
                                socialFeedUserPostsRecordList.length,
                                (socialFeedIndex) {
                              final socialFeedUserPostsRecord =
                                  socialFeedUserPostsRecordList[
                                      socialFeedIndex];
                              return Container(
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
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                  ),
                                                ),
                                              ),
                                            );
                                          }
                                          final userPostUsersRecord =
                                              snapshot.data!;
                                          return Container(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
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
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 8.0, 2.0, 4.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Container(
                                                        width: 200.0,
                                                        height: 50.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              Color(0xAB000000),
                                                          borderRadius:
                                                              BorderRadius.only(
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    0.0),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    16.0),
                                                            topLeft:
                                                                Radius.circular(
                                                                    0.0),
                                                            topRight:
                                                                Radius.circular(
                                                                    16.0),
                                                          ),
                                                        ),
                                                        child: InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            context.pushNamed(
                                                              'profileOther',
                                                              queryParameters: {
                                                                'userDetails':
                                                                    serializeParam(
                                                                  userPostUsersRecord,
                                                                  ParamType
                                                                      .Document,
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
                                                                MainAxisSize
                                                                    .max,
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
                                                                  clipBehavior:
                                                                      Clip.antiAliasWithSaveLayer,
                                                                  shape:
                                                                      RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            20.0),
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            1.0,
                                                                            1.0,
                                                                            1.0,
                                                                            1.0),
                                                                    child:
                                                                        Container(
                                                                      width:
                                                                          40.0,
                                                                      height:
                                                                          40.0,
                                                                      clipBehavior:
                                                                          Clip.antiAlias,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        shape: BoxShape
                                                                            .circle,
                                                                      ),
                                                                      child:
                                                                          CachedNetworkImage(
                                                                        fadeInDuration:
                                                                            Duration(milliseconds: 500),
                                                                        fadeOutDuration:
                                                                            Duration(milliseconds: 500),
                                                                        imageUrl:
                                                                            valueOrDefault<String>(
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
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
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
                                                          Icons
                                                              .keyboard_control,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          size: 20.0,
                                                        ),
                                                        onPressed: () async {
                                                          await showModalBottomSheet(
                                                            isScrollControlled:
                                                                true,
                                                            backgroundColor:
                                                                Color(
                                                                    0x00000000),
                                                            barrierColor: Color(
                                                                0x00000000),
                                                            context: context,
                                                            builder: (context) {
                                                              return GestureDetector(
                                                                onTap: () => FocusScope.of(
                                                                        context)
                                                                    .requestFocus(
                                                                        _model
                                                                            .unfocusNode),
                                                                child: Padding(
                                                                  padding: MediaQuery
                                                                      .viewInsetsOf(
                                                                          context),
                                                                  child:
                                                                      Container(
                                                                    height:
                                                                        250.0,
                                                                    child:
                                                                        PostMenuWidget(),
                                                                  ),
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
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          1.0,
                                                  height:
                                                      MediaQuery.sizeOf(context)
                                                              .height *
                                                          0.3,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      bottomLeft:
                                                          Radius.circular(0.0),
                                                      bottomRight:
                                                          Radius.circular(0.0),
                                                      topLeft:
                                                          Radius.circular(0.0),
                                                      topRight:
                                                          Radius.circular(16.0),
                                                    ),
                                                  ),
                                                  child: Stack(
                                                    children: [
                                                      Stack(
                                                        children: [
                                                          Container(
                                                            width: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width *
                                                                1.0,
                                                            height: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .height *
                                                                0.34,
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .only(
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        0.0),
                                                                bottomRight: Radius
                                                                    .circular(
                                                                        0.0),
                                                                topLeft: Radius
                                                                    .circular(
                                                                        0.0),
                                                                topRight: Radius
                                                                    .circular(
                                                                        20.0),
                                                              ),
                                                            ),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceEvenly,
                                                                    children: [
                                                                      Align(
                                                                        alignment: AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              8.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              StreamBuilder<List<UserPostsRecord>>(
                                                                            stream:
                                                                                queryUserPostsRecord(
                                                                              singleRecord: true,
                                                                            ),
                                                                            builder:
                                                                                (context, snapshot) {
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
                                                                              // Return an empty Container when the item does not exist.
                                                                              if (snapshot.data!.isEmpty) {
                                                                                return Container();
                                                                              }
                                                                              final containerUserPostsRecord = containerUserPostsRecordList.isNotEmpty ? containerUserPostsRecordList.first : null;
                                                                              return Container(
                                                                                width: MediaQuery.sizeOf(context).width * 0.9,
                                                                                height: MediaQuery.sizeOf(context).height * 0.28,
                                                                                decoration: BoxDecoration(
                                                                                  color: Color(0xAB000000),
                                                                                  borderRadius: BorderRadius.circular(20.0),
                                                                                ),
                                                                                child: Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 5.0, 5.0),
                                                                                  child: Column(
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
                                                                                                      dateTimeFormat(
                                                                                                        'relative',
                                                                                                        containerUserPostsRecord!.timePosted!,
                                                                                                        locale: FFLocalizations.of(context).languageCode,
                                                                                                      ),
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
                                                                                                        InkWell(
                                                                                                          splashColor: Colors.transparent,
                                                                                                          focusColor: Colors.transparent,
                                                                                                          hoverColor: Colors.transparent,
                                                                                                          highlightColor: Colors.transparent,
                                                                                                          onLongPress: () async {
                                                                                                            if (currentUserEmailVerified == true) {
                                                                                                              if (socialFeedUserPostsRecord.votes1.contains(currentUserReference) || socialFeedUserPostsRecord.votes2.contains(currentUserReference) || socialFeedUserPostsRecord.votes3.contains(currentUserReference) || socialFeedUserPostsRecord.votes4.contains(currentUserReference)) {
                                                                                                                context.pushNamed(
                                                                                                                  'postDev',
                                                                                                                  queryParameters: {
                                                                                                                    'postReference': serializeParam(
                                                                                                                      socialFeedUserPostsRecord.reference,
                                                                                                                      ParamType.DocumentReference,
                                                                                                                    ),
                                                                                                                    'userRecord': serializeParam(
                                                                                                                      userPostUsersRecord,
                                                                                                                      ParamType.Document,
                                                                                                                    ),
                                                                                                                  }.withoutNulls,
                                                                                                                  extra: <String, dynamic>{
                                                                                                                    'userRecord': userPostUsersRecord,
                                                                                                                  },
                                                                                                                );

                                                                                                                return;
                                                                                                              } else {
                                                                                                                ScaffoldMessenger.of(context).showSnackBar(
                                                                                                                  SnackBar(
                                                                                                                    content: Text(
                                                                                                                      'Submit a vote to see Analytics',
                                                                                                                      style: TextStyle(
                                                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                    duration: Duration(milliseconds: 4000),
                                                                                                                    backgroundColor: FlutterFlowTheme.of(context).secondary,
                                                                                                                  ),
                                                                                                                );
                                                                                                                return;
                                                                                                              }
                                                                                                            } else {
                                                                                                              ScaffoldMessenger.of(context).showSnackBar(
                                                                                                                SnackBar(
                                                                                                                  content: Text(
                                                                                                                    'Please verify your email before voting in a poll',
                                                                                                                    style: TextStyle(
                                                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                  duration: Duration(milliseconds: 4000),
                                                                                                                  backgroundColor: FlutterFlowTheme.of(context).secondary,
                                                                                                                ),
                                                                                                              );
                                                                                                              return;
                                                                                                            }
                                                                                                          },
                                                                                                          child: FFButtonWidget(
                                                                                                            onPressed: () async {
                                                                                                              if (currentUserEmailVerified == true) {
                                                                                                                if (socialFeedUserPostsRecord.votes1.contains(currentUserReference) || socialFeedUserPostsRecord.votes2.contains(currentUserReference) || socialFeedUserPostsRecord.votes3.contains(currentUserReference) || socialFeedUserPostsRecord.votes4.contains(currentUserReference)) {
                                                                                                                  return;
                                                                                                                }

                                                                                                                await socialFeedUserPostsRecord.reference.update({
                                                                                                                  'votes4': FieldValue.arrayUnion([currentUserReference]),
                                                                                                                  'timeVoted': FieldValue.arrayUnion([getCurrentTimestamp]),
                                                                                                                });

                                                                                                                await VotesRecord.collection.doc().set(createVotesRecordData(
                                                                                                                      poll: socialFeedUserPostsRecord.reference,
                                                                                                                      timeVoted: getCurrentTimestamp,
                                                                                                                      voteChoice: 4,
                                                                                                                      voter: currentUserReference,
                                                                                                                    ));
                                                                                                              } else {
                                                                                                                ScaffoldMessenger.of(context).showSnackBar(
                                                                                                                  SnackBar(
                                                                                                                    content: Text(
                                                                                                                      'Please verify your email before voting in a poll',
                                                                                                                      style: TextStyle(
                                                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                    duration: Duration(milliseconds: 4000),
                                                                                                                    backgroundColor: FlutterFlowTheme.of(context).secondary,
                                                                                                                  ),
                                                                                                                );
                                                                                                              }
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
                                                                                                        ),
                                                                                                      Padding(
                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                                        child: InkWell(
                                                                                                          splashColor: Colors.transparent,
                                                                                                          focusColor: Colors.transparent,
                                                                                                          hoverColor: Colors.transparent,
                                                                                                          highlightColor: Colors.transparent,
                                                                                                          onLongPress: () async {
                                                                                                            if (currentUserEmailVerified == true) {
                                                                                                              if (socialFeedUserPostsRecord.votes1.contains(currentUserReference) || socialFeedUserPostsRecord.votes2.contains(currentUserReference) || socialFeedUserPostsRecord.votes3.contains(currentUserReference) || socialFeedUserPostsRecord.votes4.contains(currentUserReference)) {
                                                                                                                context.pushNamed(
                                                                                                                  'postDev',
                                                                                                                  queryParameters: {
                                                                                                                    'postReference': serializeParam(
                                                                                                                      socialFeedUserPostsRecord.reference,
                                                                                                                      ParamType.DocumentReference,
                                                                                                                    ),
                                                                                                                    'userRecord': serializeParam(
                                                                                                                      userPostUsersRecord,
                                                                                                                      ParamType.Document,
                                                                                                                    ),
                                                                                                                  }.withoutNulls,
                                                                                                                  extra: <String, dynamic>{
                                                                                                                    'userRecord': userPostUsersRecord,
                                                                                                                  },
                                                                                                                );

                                                                                                                return;
                                                                                                              } else {
                                                                                                                ScaffoldMessenger.of(context).showSnackBar(
                                                                                                                  SnackBar(
                                                                                                                    content: Text(
                                                                                                                      'Submit a vote to see Analytics',
                                                                                                                      style: TextStyle(
                                                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                    duration: Duration(milliseconds: 4000),
                                                                                                                    backgroundColor: FlutterFlowTheme.of(context).secondary,
                                                                                                                  ),
                                                                                                                );
                                                                                                                return;
                                                                                                              }
                                                                                                            } else {
                                                                                                              ScaffoldMessenger.of(context).showSnackBar(
                                                                                                                SnackBar(
                                                                                                                  content: Text(
                                                                                                                    'Please verify your email before voting in a poll',
                                                                                                                    style: TextStyle(
                                                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                  duration: Duration(milliseconds: 4000),
                                                                                                                  backgroundColor: FlutterFlowTheme.of(context).secondary,
                                                                                                                ),
                                                                                                              );
                                                                                                              return;
                                                                                                            }
                                                                                                          },
                                                                                                          child: FFButtonWidget(
                                                                                                            onPressed: () async {
                                                                                                              if (currentUserEmailVerified == true) {
                                                                                                                if (socialFeedUserPostsRecord.votes1.contains(currentUserReference) || socialFeedUserPostsRecord.votes2.contains(currentUserReference) || socialFeedUserPostsRecord.votes3.contains(currentUserReference) || socialFeedUserPostsRecord.votes4.contains(currentUserReference)) {
                                                                                                                  return;
                                                                                                                }

                                                                                                                await socialFeedUserPostsRecord.reference.update({
                                                                                                                  'votes2': FieldValue.arrayUnion([currentUserReference]),
                                                                                                                  'timeVoted': FieldValue.arrayUnion([getCurrentTimestamp]),
                                                                                                                });

                                                                                                                await VotesRecord.collection.doc().set(createVotesRecordData(
                                                                                                                      poll: socialFeedUserPostsRecord.reference,
                                                                                                                      timeVoted: getCurrentTimestamp,
                                                                                                                      voteChoice: 2,
                                                                                                                      voter: currentUserReference,
                                                                                                                    ));
                                                                                                              } else {
                                                                                                                ScaffoldMessenger.of(context).showSnackBar(
                                                                                                                  SnackBar(
                                                                                                                    content: Text(
                                                                                                                      'Please verify your email before voting in a poll',
                                                                                                                      style: TextStyle(
                                                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                    duration: Duration(milliseconds: 4000),
                                                                                                                    backgroundColor: FlutterFlowTheme.of(context).secondary,
                                                                                                                  ),
                                                                                                                );
                                                                                                              }
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
                                                                                                      ),
                                                                                                      Padding(
                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                                        child: InkWell(
                                                                                                          splashColor: Colors.transparent,
                                                                                                          focusColor: Colors.transparent,
                                                                                                          hoverColor: Colors.transparent,
                                                                                                          highlightColor: Colors.transparent,
                                                                                                          onLongPress: () async {
                                                                                                            if (currentUserEmailVerified == true) {
                                                                                                              if (socialFeedUserPostsRecord.votes1.contains(currentUserReference) || socialFeedUserPostsRecord.votes2.contains(currentUserReference) || socialFeedUserPostsRecord.votes3.contains(currentUserReference) || socialFeedUserPostsRecord.votes4.contains(currentUserReference)) {
                                                                                                                context.pushNamed(
                                                                                                                  'postDev',
                                                                                                                  queryParameters: {
                                                                                                                    'postReference': serializeParam(
                                                                                                                      socialFeedUserPostsRecord.reference,
                                                                                                                      ParamType.DocumentReference,
                                                                                                                    ),
                                                                                                                    'userRecord': serializeParam(
                                                                                                                      userPostUsersRecord,
                                                                                                                      ParamType.Document,
                                                                                                                    ),
                                                                                                                  }.withoutNulls,
                                                                                                                  extra: <String, dynamic>{
                                                                                                                    'userRecord': userPostUsersRecord,
                                                                                                                  },
                                                                                                                );

                                                                                                                return;
                                                                                                              } else {
                                                                                                                ScaffoldMessenger.of(context).showSnackBar(
                                                                                                                  SnackBar(
                                                                                                                    content: Text(
                                                                                                                      'Submit a vote to see Analytics',
                                                                                                                      style: TextStyle(
                                                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                    duration: Duration(milliseconds: 4000),
                                                                                                                    backgroundColor: FlutterFlowTheme.of(context).secondary,
                                                                                                                  ),
                                                                                                                );
                                                                                                                return;
                                                                                                              }
                                                                                                            } else {
                                                                                                              ScaffoldMessenger.of(context).showSnackBar(
                                                                                                                SnackBar(
                                                                                                                  content: Text(
                                                                                                                    'Please verify your email before voting in a poll',
                                                                                                                    style: TextStyle(
                                                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                  duration: Duration(milliseconds: 4000),
                                                                                                                  backgroundColor: FlutterFlowTheme.of(context).secondary,
                                                                                                                ),
                                                                                                              );
                                                                                                              return;
                                                                                                            }
                                                                                                          },
                                                                                                          child: FFButtonWidget(
                                                                                                            onPressed: () async {
                                                                                                              if (currentUserEmailVerified == true) {
                                                                                                                if (socialFeedUserPostsRecord.votes1.contains(currentUserReference) || socialFeedUserPostsRecord.votes2.contains(currentUserReference) || socialFeedUserPostsRecord.votes3.contains(currentUserReference) || socialFeedUserPostsRecord.votes4.contains(currentUserReference)) {
                                                                                                                  return;
                                                                                                                }

                                                                                                                await socialFeedUserPostsRecord.reference.update({
                                                                                                                  'votes1': FieldValue.arrayUnion([currentUserReference]),
                                                                                                                  'timeVoted': FieldValue.arrayUnion([getCurrentTimestamp]),
                                                                                                                });

                                                                                                                await VotesRecord.collection.doc().set(createVotesRecordData(
                                                                                                                      poll: socialFeedUserPostsRecord.reference,
                                                                                                                      timeVoted: getCurrentTimestamp,
                                                                                                                      voteChoice: 1,
                                                                                                                      voter: currentUserReference,
                                                                                                                    ));
                                                                                                              } else {
                                                                                                                ScaffoldMessenger.of(context).showSnackBar(
                                                                                                                  SnackBar(
                                                                                                                    content: Text(
                                                                                                                      'Please verify your email before voting in a poll',
                                                                                                                      style: TextStyle(
                                                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                    duration: Duration(milliseconds: 4000),
                                                                                                                    backgroundColor: FlutterFlowTheme.of(context).secondary,
                                                                                                                  ),
                                                                                                                );
                                                                                                              }
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
                                                                                                      ),
                                                                                                      if (socialFeedUserPostsRecord.postAnswer3 != null && socialFeedUserPostsRecord.postAnswer3 != '')
                                                                                                        Padding(
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                                          child: InkWell(
                                                                                                            splashColor: Colors.transparent,
                                                                                                            focusColor: Colors.transparent,
                                                                                                            hoverColor: Colors.transparent,
                                                                                                            highlightColor: Colors.transparent,
                                                                                                            onLongPress: () async {
                                                                                                              if (currentUserEmailVerified == true) {
                                                                                                                if (socialFeedUserPostsRecord.votes1.contains(currentUserReference) || socialFeedUserPostsRecord.votes2.contains(currentUserReference) || socialFeedUserPostsRecord.votes3.contains(currentUserReference) || socialFeedUserPostsRecord.votes4.contains(currentUserReference)) {
                                                                                                                  context.pushNamed(
                                                                                                                    'postDev',
                                                                                                                    queryParameters: {
                                                                                                                      'postReference': serializeParam(
                                                                                                                        socialFeedUserPostsRecord.reference,
                                                                                                                        ParamType.DocumentReference,
                                                                                                                      ),
                                                                                                                      'userRecord': serializeParam(
                                                                                                                        userPostUsersRecord,
                                                                                                                        ParamType.Document,
                                                                                                                      ),
                                                                                                                    }.withoutNulls,
                                                                                                                    extra: <String, dynamic>{
                                                                                                                      'userRecord': userPostUsersRecord,
                                                                                                                    },
                                                                                                                  );

                                                                                                                  return;
                                                                                                                } else {
                                                                                                                  ScaffoldMessenger.of(context).showSnackBar(
                                                                                                                    SnackBar(
                                                                                                                      content: Text(
                                                                                                                        'Submit a vote to see Analytics',
                                                                                                                        style: TextStyle(
                                                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                      duration: Duration(milliseconds: 4000),
                                                                                                                      backgroundColor: FlutterFlowTheme.of(context).secondary,
                                                                                                                    ),
                                                                                                                  );
                                                                                                                  return;
                                                                                                                }
                                                                                                              } else {
                                                                                                                ScaffoldMessenger.of(context).showSnackBar(
                                                                                                                  SnackBar(
                                                                                                                    content: Text(
                                                                                                                      'Please verify your email before voting in a poll',
                                                                                                                      style: TextStyle(
                                                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                    duration: Duration(milliseconds: 4000),
                                                                                                                    backgroundColor: FlutterFlowTheme.of(context).secondary,
                                                                                                                  ),
                                                                                                                );
                                                                                                                return;
                                                                                                              }
                                                                                                            },
                                                                                                            child: FFButtonWidget(
                                                                                                              onPressed: () async {
                                                                                                                if (currentUserEmailVerified == true) {
                                                                                                                  if (socialFeedUserPostsRecord.votes1.contains(currentUserReference) || socialFeedUserPostsRecord.votes2.contains(currentUserReference) || socialFeedUserPostsRecord.votes3.contains(currentUserReference) || socialFeedUserPostsRecord.votes4.contains(currentUserReference)) {
                                                                                                                    return;
                                                                                                                  }

                                                                                                                  await socialFeedUserPostsRecord.reference.update({
                                                                                                                    'votes3': FieldValue.arrayUnion([currentUserReference]),
                                                                                                                    'timeVoted': FieldValue.arrayUnion([getCurrentTimestamp]),
                                                                                                                  });

                                                                                                                  await VotesRecord.collection.doc().set(createVotesRecordData(
                                                                                                                        poll: socialFeedUserPostsRecord.reference,
                                                                                                                        timeVoted: getCurrentTimestamp,
                                                                                                                        voteChoice: 3,
                                                                                                                        voter: currentUserReference,
                                                                                                                      ));
                                                                                                                  return;
                                                                                                                } else {
                                                                                                                  ScaffoldMessenger.of(context).showSnackBar(
                                                                                                                    SnackBar(
                                                                                                                      content: Text(
                                                                                                                        'Please verify your email before voting in a poll',
                                                                                                                        style: TextStyle(
                                                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                      duration: Duration(milliseconds: 4000),
                                                                                                                      backgroundColor: FlutterFlowTheme.of(context).secondary,
                                                                                                                    ),
                                                                                                                  );
                                                                                                                }
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
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          1.0,
                                                  height: 46.0,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            16.0),
                                                  ),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Container(
                                                        width: 180.0,
                                                        height: 46.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              Color(0xAB000000),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
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
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Container(
                                                                  width: 80.0,
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
                                                                        width:
                                                                            25.0,
                                                                        height:
                                                                            30.0,
                                                                        decoration:
                                                                            BoxDecoration(),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Align(
                                                                              alignment: AlignmentDirectional(0.0, 0.0),
                                                                              child: Container(
                                                                                width: 25.0,
                                                                                height: 30.0,
                                                                                child: Stack(
                                                                                  children: [
                                                                                    Align(
                                                                                      alignment: AlignmentDirectional(0.0, 0.25),
                                                                                      child: Icon(
                                                                                        Icons.timer,
                                                                                        color: FlutterFlowTheme.of(context).primary,
                                                                                        size: 25.0,
                                                                                      ).animateOnActionTrigger(animationsMap['iconOnActionTriggerAnimation']!, hasBeenTriggered: hasIconTriggered),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            2.0,
                                                                            3.0,
                                                                            0.0,
                                                                            3.0),
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              40.0,
                                                                          height:
                                                                              50.0,
                                                                          decoration:
                                                                              BoxDecoration(),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Container(
                                                                                width: 40.0,
                                                                                height: 100.0,
                                                                                decoration: BoxDecoration(),
                                                                                child: Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                                  children: [
                                                                                    Container(
                                                                                      width: 40.0,
                                                                                      height: 40.0,
                                                                                      decoration: BoxDecoration(),
                                                                                      child: Column(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                                                        children: [
                                                                                          AutoSizeText(
                                                                                            socialFeedUserPostsRecord.expiry != null
                                                                                                ? dateTimeFormat(
                                                                                                    'relative',
                                                                                                    socialFeedUserPostsRecord.expiry!,
                                                                                                    locale: FFLocalizations.of(context).languageShortCode ?? FFLocalizations.of(context).languageCode,
                                                                                                  )
                                                                                                : socialFeedUserPostsRecord.nullExpiry,
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
                                                              width: 60.0,
                                                              height: 100.0,
                                                              decoration:
                                                                  BoxDecoration(),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            5.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        Container(
                                                                      width:
                                                                          24.0,
                                                                      height:
                                                                          50.0,
                                                                      decoration:
                                                                          BoxDecoration(),
                                                                      child:
                                                                          Stack(
                                                                        children: [
                                                                          if (functions.votes(socialFeedUserPostsRecord).toString() ==
                                                                              '0')
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 3.0, 0.0),
                                                                              child: Icon(
                                                                                Icons.how_to_vote_rounded,
                                                                                color: Color(0xFF95A1AC),
                                                                                size: 30.0,
                                                                              ),
                                                                            ),
                                                                          if (functions.votes(socialFeedUserPostsRecord).toString() !=
                                                                              '0')
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                              child: Icon(
                                                                                Icons.how_to_vote_rounded,
                                                                                color: Color(0xFF048BCA),
                                                                                size: 30.0,
                                                                              ),
                                                                            ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        Container(
                                                                      width:
                                                                          30.0,
                                                                      height:
                                                                          50.0,
                                                                      decoration:
                                                                          BoxDecoration(),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            15.0,
                                                                            0.0,
                                                                            15.0),
                                                                        child:
                                                                            Text(
                                                                          functions
                                                                              .votes(socialFeedUserPostsRecord)
                                                                              .toString(),
                                                                          textAlign:
                                                                              TextAlign.center,
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
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            if (socialFeedUserPostsRecord.votes1.contains(currentUserReference) ||
                                                                socialFeedUserPostsRecord
                                                                    .votes2
                                                                    .contains(
                                                                        currentUserReference) ||
                                                                socialFeedUserPostsRecord
                                                                    .votes3
                                                                    .contains(
                                                                        currentUserReference) ||
                                                                socialFeedUserPostsRecord
                                                                    .votes4
                                                                    .contains(
                                                                        currentUserReference))
                                                              FlutterFlowIconButton(
                                                                borderColor: Colors
                                                                    .transparent,
                                                                borderRadius:
                                                                    20.0,
                                                                borderWidth:
                                                                    1.0,
                                                                buttonSize:
                                                                    40.0,
                                                                icon: Icon(
                                                                  Icons
                                                                      .analytics,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondary,
                                                                  size: 24.0,
                                                                ),
                                                                onPressed:
                                                                    () async {
                                                                  context
                                                                      .pushNamed(
                                                                    'postDetails',
                                                                    queryParameters:
                                                                        {
                                                                      'postReference':
                                                                          serializeParam(
                                                                        socialFeedUserPostsRecord
                                                                            .reference,
                                                                        ParamType
                                                                            .DocumentReference,
                                                                      ),
                                                                      'userRecord':
                                                                          serializeParam(
                                                                        userPostUsersRecord,
                                                                        ParamType
                                                                            .Document,
                                                                      ),
                                                                    }.withoutNulls,
                                                                    extra: <String,
                                                                        dynamic>{
                                                                      'userRecord':
                                                                          userPostUsersRecord,
                                                                    },
                                                                  );
                                                                },
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
                              );
                            }),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
