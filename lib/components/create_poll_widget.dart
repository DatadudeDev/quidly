import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_place_picker.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/place.dart';
import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'create_poll_model.dart';
export 'create_poll_model.dart';

class CreatePollWidget extends StatefulWidget {
  const CreatePollWidget({Key? key}) : super(key: key);

  @override
  _CreatePollWidgetState createState() => _CreatePollWidgetState();
}

class _CreatePollWidgetState extends State<CreatePollWidget> {
  late CreatePollModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CreatePollModel());

    _model.textController1 ??= TextEditingController();
    _model.choicesTWOanswerONEController1 ??= TextEditingController();
    _model.choicesTWOanswerTWOController1 ??= TextEditingController();
    _model.choicesTHREEanswerONEController ??=
        TextEditingController(text: _model.answer1);
    _model.choicesTHREEanswerTWOController ??=
        TextEditingController(text: _model.answer2);
    _model.choicesTHREEanswerTHREEController ??= TextEditingController();
    _model.choicesFOURanswerONEController ??=
        TextEditingController(text: _model.answer1);
    _model.choicesFOURanswerTWOController ??=
        TextEditingController(text: _model.answer2);
    _model.choicesFOURanswerTHREEController ??=
        TextEditingController(text: _model.answer3);
    _model.choicesFOURanswerFOURController ??= TextEditingController();
    _model.choicesTWOanswerONEController2 ??= TextEditingController();
    _model.choicesTWOanswerTWOController2 ??= TextEditingController();
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
      height: MediaQuery.sizeOf(context).height * 1.0,
      decoration: BoxDecoration(
        color: Colors.black,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: MediaQuery.sizeOf(context).width * 1.0,
                height: 80.0,
                decoration: BoxDecoration(
                  color: Color(0x00FFFFFF),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            FlutterFlowIconButton(
                              borderColor: Color(0x00FFFFFF),
                              borderRadius: 20.0,
                              borderWidth: 1.0,
                              buttonSize: 40.0,
                              fillColor: Color(0x00FFFFFF),
                              icon: Icon(
                                Icons.close,
                                color: Color(0xFFDCDCDC),
                                size: 24.0,
                              ),
                              onPressed: () async {
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 20.0, 0.0),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  var _shouldSetState = false;
                                  _model.poll = _model.textController1.text;
                                  _model.answer1 = _model
                                      .choicesTWOanswerONEController1.text;
                                  _model.answer2 = _model
                                      .choicesTWOanswerTWOController1.text;
                                  _model.answer3 = _model
                                      .choicesTHREEanswerTHREEController.text;
                                  _model.answer4 = _model
                                      .choicesFOURanswerFOURController.text;
                                  _model.pollExpiry = _model.datePicked3 != null
                                      ? _model.datePicked3
                                      : (_model.datePicked2 != null
                                          ? _model.datePicked2
                                          : _model.datePicked1);
                                  _model.nullExpiry = '∞';
                                  _model.pollLocation =
                                      _model.placePickerValue3 != null
                                          ? _model.placePickerValue3
                                          : (_model.placePickerValue2 != null
                                              ? _model.placePickerValue2
                                              : _model.placePickerValue1);
                                  _model.apiResultpwv = await ApiTestCall.call(
                                    poll: _model.poll,
                                    answer2: _model.answer2,
                                    answer3: _model.answer3,
                                    answer4: _model.answer4,
                                    answer1: _model.answer1,
                                  );
                                  _shouldSetState = true;
                                  if ((_model.apiResultpwv?.succeeded ??
                                      true)) {
                                    _model.apiResult9jo =
                                        await GetURLCall.call();
                                    _shouldSetState = true;
                                    if ((_model.apiResult9jo?.succeeded ??
                                        true)) {
                                      _model.imageURL = GetURLCall.imageURL(
                                        (_model.apiResult9jo?.jsonBody ?? ''),
                                      );
                                      if (_model.pollExpiry != null) {
                                        await UserPostsRecord.collection
                                            .doc()
                                            .set(createUserPostsRecordData(
                                              postUser: currentUserReference,
                                              timePosted: getCurrentTimestamp,
                                              postOwner: true,
                                              postPoll: _model.poll,
                                              postAnswer1: _model.answer1,
                                              postAnswer2: _model.answer2,
                                              postAnswer3: _model.answer3,
                                              postAnswer4: _model.answer4,
                                              imageURL: _model.imageURL,
                                              expiry: _model.datePicked3 != null
                                                  ? _model.datePicked3
                                                  : (_model.datePicked2 != null
                                                      ? _model.datePicked2
                                                      : _model.datePicked1),
                                              pollLocation:
                                                  _model.pollLocation!.latLng,
                                            ));
                                        Navigator.pop(context);
                                      } else {
                                        await UserPostsRecord.collection
                                            .doc()
                                            .set(createUserPostsRecordData(
                                              postUser: currentUserReference,
                                              timePosted: getCurrentTimestamp,
                                              postOwner: true,
                                              postPoll: _model.poll,
                                              postAnswer1: _model.answer1,
                                              postAnswer2: _model.answer2,
                                              postAnswer3: _model.answer3,
                                              postAnswer4: _model.answer4,
                                              imageURL: _model.imageURL,
                                              nullExpiry: _model.nullExpiry,
                                              pollLocation:
                                                  _model.pollLocation!.latLng,
                                            ));
                                        Navigator.pop(context);
                                      }
                                    } else {
                                      if (_shouldSetState) setState(() {});
                                      return;
                                    }
                                  } else {
                                    if (_shouldSetState) setState(() {});
                                    return;
                                  }

                                  if (_shouldSetState) setState(() {});
                                },
                                text: 'Submit',
                                options: FFButtonOptions(
                                  width: 70.0,
                                  height: 30.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: FlutterFlowTheme.of(context).primary,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Urbanist',
                                        color: Colors.white,
                                      ),
                                  elevation: 3.0,
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(20.0),
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
                  Container(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    height: 420.0,
                    decoration: BoxDecoration(),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 20.0, 0.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20.0, 0.0, 0.0, 0.0),
                                child: Container(
                                  width: 200.0,
                                  height: 55.0,
                                  decoration: BoxDecoration(),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            1.0, 1.0, 1.0, 1.0),
                                        child: AuthUserStreamWidget(
                                          builder: (context) => Container(
                                            width: 40.0,
                                            height: 40.0,
                                            clipBehavior: Clip.antiAlias,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                            ),
                                            child: CachedNetworkImage(
                                              fadeInDuration:
                                                  Duration(milliseconds: 500),
                                              fadeOutDuration:
                                                  Duration(milliseconds: 500),
                                              imageUrl: currentUserPhoto ==
                                                          null ||
                                                      currentUserPhoto == ''
                                                  ? 'https://www.pngfind.com/pngs/m/540-5404923_my-wedding-missing-profile-picture-icon-hd-png.png'
                                                  : valueOrDefault<String>(
                                                      currentUserPhoto,
                                                      'https://www.pngfind.com/pngs/m/540-5404923_my-wedding-missing-profile-picture-icon-hd-png.png',
                                                    ),
                                              fit: BoxFit.fitWidth,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      10.0, 0.0, 20.0, 0.0),
                                              child: FFButtonWidget(
                                                onPressed: () {
                                                  print('Button pressed ...');
                                                },
                                                text: 'Public  ▼',
                                                options: FFButtonOptions(
                                                  width: 70.0,
                                                  height: 30.0,
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 0.0),
                                                  iconPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 0.0,
                                                              0.0, 0.0),
                                                  color: Color(0xAA000000),
                                                  textStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily: 'Urbanist',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        fontSize: 12.0,
                                                        fontWeight:
                                                            FontWeight.w300,
                                                      ),
                                                  elevation: 3.0,
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20.0),
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
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    40.0, 10.0, 16.0, 0.0),
                                child: Container(
                                  width:
                                      MediaQuery.sizeOf(context).width * 0.86,
                                  child: TextFormField(
                                    controller: _model.textController1,
                                    onChanged: (_) => EasyDebounce.debounce(
                                      '_model.textController1',
                                      Duration(milliseconds: 500),
                                      () async {
                                        setState(() {
                                          _model.poll =
                                              _model.textController1.text;
                                        });
                                      },
                                    ),
                                    autofocus: true,
                                    textCapitalization:
                                        TextCapitalization.sentences,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily: 'Outfit',
                                            color: Color(0xB9B2B2B2),
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.w300,
                                            decoration:
                                                TextDecoration.underline,
                                          ),
                                      hintText: 'Ask a question...',
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily: 'Outfit',
                                            color: Color(0xB9B2B2B2),
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.w300,
                                          ),
                                      enabledBorder: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      errorBorder: InputBorder.none,
                                      focusedErrorBorder: InputBorder.none,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Urbanist',
                                          color: FlutterFlowTheme.of(context)
                                              .background,
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                    maxLines: 3,
                                    minLines: 1,
                                    cursorColor:
                                        FlutterFlowTheme.of(context).background,
                                    validator: _model.textController1Validator
                                        .asValidator(context),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 20.0, 0.0, 80.0),
                                      child: Container(
                                        width: 50.0,
                                        height: 150.0,
                                        decoration: BoxDecoration(),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            FlutterFlowIconButton(
                                              borderRadius: 20.0,
                                              borderWidth: 1.0,
                                              buttonSize: 40.0,
                                              icon: Icon(
                                                Icons.format_list_bulleted,
                                                color: _model.multipleChoice ==
                                                        true
                                                    ? FlutterFlowTheme.of(
                                                            context)
                                                        .primary
                                                    : Color(0xB9B2B2B2),
                                                size: 24.0,
                                              ),
                                              onPressed: () async {
                                                setState(() {
                                                  _model.writeIn = false;
                                                  _model.multipleChoice = true;
                                                  _model.trueFalse = false;
                                                });
                                              },
                                            ),
                                            FlutterFlowIconButton(
                                              borderRadius: 20.0,
                                              borderWidth: 1.0,
                                              buttonSize: 40.0,
                                              icon: FaIcon(
                                                FontAwesomeIcons.penFancy,
                                                color: _model.writeIn == true
                                                    ? FlutterFlowTheme.of(
                                                            context)
                                                        .primary
                                                    : Color(0xB9B2B2B2),
                                                size: 24.0,
                                              ),
                                              onPressed: () async {
                                                setState(() {
                                                  _model.writeIn = true;
                                                  _model.multipleChoice = false;
                                                  _model.trueFalse = false;
                                                  _model.answer1 = '';
                                                  _model.answer2 = '';
                                                  _model.answer3 = '';
                                                  _model.answer4 = '';
                                                });
                                              },
                                            ),
                                            FlutterFlowIconButton(
                                              borderRadius: 20.0,
                                              borderWidth: 1.0,
                                              buttonSize: 40.0,
                                              icon: Icon(
                                                Icons.rule,
                                                color: _model.trueFalse == true
                                                    ? FlutterFlowTheme.of(
                                                            context)
                                                        .primary
                                                    : Color(0xB9B2B2B2),
                                                size: 24.0,
                                              ),
                                              onPressed: () async {
                                                setState(() {
                                                  _model.writeIn = false;
                                                  _model.multipleChoice = false;
                                                  _model.trueFalse = true;
                                                  _model.answer3 = '';
                                                  _model.answer4 = '';
                                                });
                                              },
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
                              children: [
                                Container(
                                  width: 350.0,
                                  height: 250.0,
                                  decoration: BoxDecoration(),
                                  child: Stack(
                                    children: [
                                      if (valueOrDefault<bool>(
                                            _model.multipleChoice == true,
                                            false,
                                          ) &&
                                          (_model.answer2 == null ||
                                              _model.answer2 == '') &&
                                          (_model.answer1 == null ||
                                              _model.answer1 == ''))
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 5.0, 0.0, 0.0),
                                          child: Container(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                0.85,
                                            height: 145.0,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              border: Border.all(
                                                color: Color(0x6395A1AC),
                                                width: 1.0,
                                              ),
                                            ),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  10.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
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
                                                                        5.0,
                                                                        0.0,
                                                                        5.0),
                                                            child: Container(
                                                              width: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .width *
                                                                  0.7,
                                                              height: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .height *
                                                                  0.11,
                                                              decoration:
                                                                  BoxDecoration(),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Container(
                                                                            width:
                                                                                MediaQuery.sizeOf(context).width * 0.7,
                                                                            height:
                                                                                40.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              borderRadius: BorderRadius.circular(10.0),
                                                                              border: Border.all(
                                                                                color: Color(0x6395A1AC),
                                                                                width: 1.0,
                                                                              ),
                                                                            ),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Expanded(
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                                                                                    child: TextFormField(
                                                                                      controller: _model.choicesTWOanswerONEController1,
                                                                                      autofocus: true,
                                                                                      obscureText: false,
                                                                                      decoration: InputDecoration(
                                                                                        labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                              fontFamily: 'Outfit',
                                                                                              color: Color(0x6395A1AC),
                                                                                              fontSize: 15.0,
                                                                                            ),
                                                                                        hintText: 'Choice 1',
                                                                                        hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                              fontFamily: 'Outfit',
                                                                                              color: Color(0x6395A1AC),
                                                                                              fontSize: 14.0,
                                                                                            ),
                                                                                        enabledBorder: InputBorder.none,
                                                                                        focusedBorder: InputBorder.none,
                                                                                        errorBorder: InputBorder.none,
                                                                                        focusedErrorBorder: InputBorder.none,
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Urbanist',
                                                                                            color: FlutterFlowTheme.of(context).primaryText,
                                                                                          ),
                                                                                      maxLines: 3,
                                                                                      validator: _model.choicesTWOanswerONEController1Validator.asValidator(context),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            7.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Container(
                                                                              width: MediaQuery.sizeOf(context).width * 0.7,
                                                                              height: 40.0,
                                                                              decoration: BoxDecoration(
                                                                                borderRadius: BorderRadius.circular(10.0),
                                                                                border: Border.all(
                                                                                  color: Color(0x6395A1AC),
                                                                                  width: 1.0,
                                                                                ),
                                                                              ),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Expanded(
                                                                                    child: Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                                                                                      child: TextFormField(
                                                                                        controller: _model.choicesTWOanswerTWOController1,
                                                                                        autofocus: true,
                                                                                        obscureText: false,
                                                                                        decoration: InputDecoration(
                                                                                          labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                fontFamily: 'Outfit',
                                                                                                color: Color(0x6395A1AC),
                                                                                                fontSize: 17.0,
                                                                                              ),
                                                                                          hintText: 'Choice 2',
                                                                                          hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                fontFamily: 'Outfit',
                                                                                                color: Color(0x6395A1AC),
                                                                                                fontSize: 14.0,
                                                                                                fontWeight: FontWeight.w300,
                                                                                              ),
                                                                                          enabledBorder: InputBorder.none,
                                                                                          focusedBorder: InputBorder.none,
                                                                                          errorBorder: InputBorder.none,
                                                                                          focusedErrorBorder: InputBorder.none,
                                                                                        ),
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'Urbanist',
                                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                                            ),
                                                                                        validator: _model.choicesTWOanswerTWOController1Validator.asValidator(context),
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
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  8.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Column(
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
                                                                        0.0,
                                                                        10.0,
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
                                                                          25.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      FlutterFlowIconButton(
                                                                    borderColor:
                                                                        Colors
                                                                            .transparent,
                                                                    borderRadius:
                                                                        20.0,
                                                                    borderWidth:
                                                                        1.0,
                                                                    buttonSize:
                                                                        40.0,
                                                                    icon: Icon(
                                                                      Icons.add,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                      size:
                                                                          24.0,
                                                                    ),
                                                                    onPressed:
                                                                        () async {
                                                                      setState(
                                                                          () {
                                                                        _model.answer1 = _model
                                                                            .choicesTWOanswerONEController1
                                                                            .text;
                                                                        _model.answer2 = _model
                                                                            .choicesTWOanswerTWOController1
                                                                            .text;
                                                                        _model.date1 =
                                                                            _model.datePicked1;
                                                                      });
                                                                    },
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
                                                    Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Container(
                                                          width:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .width *
                                                                  0.73,
                                                          height: 38.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .only(
                                                              bottomLeft: Radius
                                                                  .circular(
                                                                      20.0),
                                                              bottomRight:
                                                                  Radius
                                                                      .circular(
                                                                          20.0),
                                                              topLeft: Radius
                                                                  .circular(
                                                                      0.0),
                                                              topRight: Radius
                                                                  .circular(
                                                                      0.0),
                                                            ),
                                                          ),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      FlutterFlowIconButton(
                                                                        borderColor:
                                                                            Colors.transparent,
                                                                        borderRadius:
                                                                            20.0,
                                                                        borderWidth:
                                                                            1.0,
                                                                        buttonSize:
                                                                            38.0,
                                                                        icon:
                                                                            Icon(
                                                                          Icons
                                                                              .alarm,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primary,
                                                                          size:
                                                                              20.0,
                                                                        ),
                                                                        onPressed:
                                                                            () async {
                                                                          final _datePicked1Date =
                                                                              await showDatePicker(
                                                                            context:
                                                                                context,
                                                                            initialDate:
                                                                                getCurrentTimestamp,
                                                                            firstDate:
                                                                                getCurrentTimestamp,
                                                                            lastDate:
                                                                                DateTime(2050),
                                                                          );

                                                                          if (_datePicked1Date !=
                                                                              null) {
                                                                            setState(() {
                                                                              _model.datePicked1 = DateTime(
                                                                                _datePicked1Date.year,
                                                                                _datePicked1Date.month,
                                                                                _datePicked1Date.day,
                                                                              );
                                                                            });
                                                                          }
                                                                        },
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ],
                                                              ),
                                                              Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Container(
                                                                        width:
                                                                            100.0,
                                                                        height:
                                                                            15.0,
                                                                        decoration:
                                                                            BoxDecoration(),
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              3.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            'Poll ends on:',
                                                                            textAlign:
                                                                                TextAlign.start,
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Urbanist',
                                                                                  color: Color(0xCCB2B2B2),
                                                                                  fontSize: 10.0,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Container(
                                                                        width:
                                                                            100.0,
                                                                        height:
                                                                            20.0,
                                                                        decoration:
                                                                            BoxDecoration(),
                                                                        child:
                                                                            Text(
                                                                          valueOrDefault<
                                                                              String>(
                                                                            dateTimeFormat('relative',
                                                                                _model.datePicked1),
                                                                            'Never',
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Urbanist',
                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                fontSize: 12.0,
                                                                                fontWeight: FontWeight.bold,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ],
                                                              ),
                                                              Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Container(
                                                                        width:
                                                                            140.0,
                                                                        height:
                                                                            35.0,
                                                                        decoration:
                                                                            BoxDecoration(),
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Container(
                                                                                  width: 140.0,
                                                                                  height: 35.0,
                                                                                  decoration: BoxDecoration(),
                                                                                  child: FlutterFlowPlacePicker(
                                                                                    iOSGoogleMapsApiKey: 'AIzaSyBBzVycKke2mKHYdJlxidz4TDgmco1tW98',
                                                                                    androidGoogleMapsApiKey: 'AIzaSyBBzVycKke2mKHYdJlxidz4TDgmco1tW98',
                                                                                    webGoogleMapsApiKey: 'AIzaSyBBzVycKke2mKHYdJlxidz4TDgmco1tW98',
                                                                                    onSelect: (place) async {
                                                                                      setState(() => _model.placePickerValue1 = place);
                                                                                    },
                                                                                    defaultText: 'Select Location',
                                                                                    icon: Icon(
                                                                                      Icons.place,
                                                                                      color: Color(0xFF00AEFF),
                                                                                      size: 20.0,
                                                                                    ),
                                                                                    buttonOptions: FFButtonOptions(
                                                                                      width: 140.0,
                                                                                      height: 40.0,
                                                                                      color: Colors.black,
                                                                                      textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                            fontFamily: 'Urbanist',
                                                                                            color: Color(0xFF00AEFF),
                                                                                            fontSize: 14.0,
                                                                                          ),
                                                                                      elevation: 2.0,
                                                                                      borderSide: BorderSide(
                                                                                        color: Colors.transparent,
                                                                                        width: 1.0,
                                                                                      ),
                                                                                      borderRadius: BorderRadius.circular(8.0),
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
                                                                ],
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
                                        ),
                                      if ((_model.answer2 != null &&
                                              _model.answer2 != '') &&
                                          (_model.answer3 == null ||
                                              _model.answer3 == '') &&
                                          (_model.multipleChoice == true))
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 5.0, 0.0, 0.0),
                                          child: Container(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                0.85,
                                            height: 190.0,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              border: Border.all(
                                                color: Color(0x6395A1AC),
                                                width: 1.0,
                                              ),
                                            ),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  10.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
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
                                                                        5.0,
                                                                        0.0,
                                                                        5.0),
                                                            child: Container(
                                                              width: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .width *
                                                                  0.7,
                                                              height: 135.0,
                                                              decoration:
                                                                  BoxDecoration(),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Container(
                                                                            width:
                                                                                MediaQuery.sizeOf(context).width * 0.7,
                                                                            height:
                                                                                40.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              borderRadius: BorderRadius.circular(10.0),
                                                                              border: Border.all(
                                                                                color: Color(0x6395A1AC),
                                                                                width: 1.0,
                                                                              ),
                                                                            ),
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                                                                              child: TextFormField(
                                                                                controller: _model.choicesTHREEanswerONEController,
                                                                                autofocus: true,
                                                                                obscureText: false,
                                                                                decoration: InputDecoration(
                                                                                  labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                        fontFamily: 'Outfit',
                                                                                        color: Color(0x6395A1AC),
                                                                                      ),
                                                                                  hintText: _model.answer1,
                                                                                  hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                        fontFamily: 'Outfit',
                                                                                        fontSize: 14.0,
                                                                                      ),
                                                                                  enabledBorder: InputBorder.none,
                                                                                  focusedBorder: InputBorder.none,
                                                                                  errorBorder: InputBorder.none,
                                                                                  focusedErrorBorder: InputBorder.none,
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Urbanist',
                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                    ),
                                                                                validator: _model.choicesTHREEanswerONEControllerValidator.asValidator(context),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            7.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Container(
                                                                              width: MediaQuery.sizeOf(context).width * 0.7,
                                                                              height: 40.0,
                                                                              decoration: BoxDecoration(
                                                                                borderRadius: BorderRadius.circular(10.0),
                                                                                border: Border.all(
                                                                                  color: Color(0x6395A1AC),
                                                                                  width: 1.0,
                                                                                ),
                                                                              ),
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                                                                                child: TextFormField(
                                                                                  controller: _model.choicesTHREEanswerTWOController,
                                                                                  autofocus: true,
                                                                                  obscureText: false,
                                                                                  decoration: InputDecoration(
                                                                                    labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                          fontFamily: 'Outfit',
                                                                                          color: Color(0x6395A1AC),
                                                                                        ),
                                                                                    hintText: _model.answer2,
                                                                                    hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                          fontFamily: 'Outfit',
                                                                                          fontSize: 14.0,
                                                                                        ),
                                                                                    enabledBorder: InputBorder.none,
                                                                                    focusedBorder: InputBorder.none,
                                                                                    errorBorder: InputBorder.none,
                                                                                    focusedErrorBorder: InputBorder.none,
                                                                                  ),
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Urbanist',
                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                      ),
                                                                                  validator: _model.choicesTHREEanswerTWOControllerValidator.asValidator(context),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            7.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Container(
                                                                              width: MediaQuery.sizeOf(context).width * 0.7,
                                                                              height: 40.0,
                                                                              decoration: BoxDecoration(
                                                                                borderRadius: BorderRadius.circular(10.0),
                                                                                border: Border.all(
                                                                                  color: Color(0x6395A1AC),
                                                                                  width: 1.0,
                                                                                ),
                                                                              ),
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                                                                                child: TextFormField(
                                                                                  controller: _model.choicesTHREEanswerTHREEController,
                                                                                  autofocus: true,
                                                                                  obscureText: false,
                                                                                  decoration: InputDecoration(
                                                                                    labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                          fontFamily: 'Outfit',
                                                                                          color: Color(0x6395A1AC),
                                                                                        ),
                                                                                    hintText: 'Choice 3 (optional)',
                                                                                    hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                          fontFamily: 'Outfit',
                                                                                          color: Color(0xCCB2B2B2),
                                                                                          fontSize: 14.0,
                                                                                          fontWeight: FontWeight.w300,
                                                                                        ),
                                                                                    enabledBorder: InputBorder.none,
                                                                                    focusedBorder: InputBorder.none,
                                                                                    errorBorder: InputBorder.none,
                                                                                    focusedErrorBorder: InputBorder.none,
                                                                                  ),
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Urbanist',
                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                      ),
                                                                                  validator: _model.choicesTHREEanswerTHREEControllerValidator.asValidator(context),
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
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  8.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Column(
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
                                                                        0.0,
                                                                        10.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Stack(
                                                                  children: [
                                                                    if ((_model.multipleChoice ==
                                                                            true) &&
                                                                        (_model.answer3 ==
                                                                                null ||
                                                                            _model.answer3 ==
                                                                                ''))
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            75.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            FlutterFlowIconButton(
                                                                          borderColor:
                                                                              Colors.transparent,
                                                                          borderRadius:
                                                                              20.0,
                                                                          borderWidth:
                                                                              1.0,
                                                                          buttonSize:
                                                                              40.0,
                                                                          icon:
                                                                              Icon(
                                                                            Icons.add,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            size:
                                                                                20.0,
                                                                          ),
                                                                          onPressed:
                                                                              () async {
                                                                            setState(() {
                                                                              _model.answer3 = _model.choicesTHREEanswerTHREEController.text;
                                                                              _model.pollExpiry = _model.datePicked2 != null ? _model.datePicked2 : _model.pollExpiry;
                                                                              _model.date2 = _model.datePicked2;
                                                                            });
                                                                          },
                                                                        ),
                                                                      ),
                                                                    if ((_model.multipleChoice ==
                                                                            true) &&
                                                                        (_model.answer3 !=
                                                                                null &&
                                                                            _model.answer3 !=
                                                                                ''))
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            75.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            FlutterFlowIconButton(
                                                                          borderColor:
                                                                              Colors.transparent,
                                                                          borderRadius:
                                                                              20.0,
                                                                          borderWidth:
                                                                              1.0,
                                                                          buttonSize:
                                                                              40.0,
                                                                          icon:
                                                                              Icon(
                                                                            Icons.remove,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            size:
                                                                                20.0,
                                                                          ),
                                                                          onPressed:
                                                                              () async {
                                                                            setState(() {
                                                                              _model.answer3 = '';
                                                                            });
                                                                          },
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
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Container(
                                                      width: MediaQuery.sizeOf(
                                                                  context)
                                                              .width *
                                                          0.73,
                                                      height: 38.0,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius.only(
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  20.0),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  20.0),
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
                                                          Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            5.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        FlutterFlowIconButton(
                                                                      borderColor:
                                                                          Colors
                                                                              .transparent,
                                                                      borderRadius:
                                                                          20.0,
                                                                      borderWidth:
                                                                          1.0,
                                                                      buttonSize:
                                                                          38.0,
                                                                      icon:
                                                                          Icon(
                                                                        Icons
                                                                            .alarm,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                        size:
                                                                            20.0,
                                                                      ),
                                                                      onPressed:
                                                                          () async {
                                                                        final _datePicked2Date =
                                                                            await showDatePicker(
                                                                          context:
                                                                              context,
                                                                          initialDate:
                                                                              getCurrentTimestamp,
                                                                          firstDate:
                                                                              getCurrentTimestamp,
                                                                          lastDate:
                                                                              DateTime(2050),
                                                                        );

                                                                        if (_datePicked2Date !=
                                                                            null) {
                                                                          setState(
                                                                              () {
                                                                            _model.datePicked2 =
                                                                                DateTime(
                                                                              _datePicked2Date.year,
                                                                              _datePicked2Date.month,
                                                                              _datePicked2Date.day,
                                                                            );
                                                                          });
                                                                        }
                                                                      },
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                          Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Container(
                                                                    width:
                                                                        100.0,
                                                                    height:
                                                                        10.0,
                                                                    decoration:
                                                                        BoxDecoration(),
                                                                    child: Text(
                                                                      'Poll ends on:',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Urbanist',
                                                                            color:
                                                                                Color(0xCCB2B2B2),
                                                                            fontSize:
                                                                                10.0,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Container(
                                                                    width:
                                                                        100.0,
                                                                    height:
                                                                        25.0,
                                                                    decoration:
                                                                        BoxDecoration(),
                                                                    child: Text(
                                                                      _model.datePicked2 !=
                                                                              null
                                                                          ? dateTimeFormat(
                                                                              'relative',
                                                                              _model
                                                                                  .datePicked2)
                                                                          : dateTimeFormat(
                                                                              'relative',
                                                                              _model.date1),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Urbanist',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            fontSize:
                                                                                12.0,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                          Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Container(
                                                                    width:
                                                                        140.0,
                                                                    height:
                                                                        35.0,
                                                                    decoration:
                                                                        BoxDecoration(),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Container(
                                                                              width: 140.0,
                                                                              height: 35.0,
                                                                              decoration: BoxDecoration(),
                                                                              child: FlutterFlowPlacePicker(
                                                                                iOSGoogleMapsApiKey: 'AIzaSyBBzVycKke2mKHYdJlxidz4TDgmco1tW98',
                                                                                androidGoogleMapsApiKey: 'AIzaSyBBzVycKke2mKHYdJlxidz4TDgmco1tW98',
                                                                                webGoogleMapsApiKey: 'AIzaSyBBzVycKke2mKHYdJlxidz4TDgmco1tW98',
                                                                                onSelect: (place) async {
                                                                                  setState(() => _model.placePickerValue2 = place);
                                                                                },
                                                                                defaultText: 'Select Location',
                                                                                icon: Icon(
                                                                                  Icons.place,
                                                                                  color: Color(0xFF00AEFF),
                                                                                  size: 20.0,
                                                                                ),
                                                                                buttonOptions: FFButtonOptions(
                                                                                  width: 140.0,
                                                                                  height: 40.0,
                                                                                  color: Colors.black,
                                                                                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                        fontFamily: 'Urbanist',
                                                                                        color: Color(0xFF00AEFF),
                                                                                        fontSize: 14.0,
                                                                                      ),
                                                                                  elevation: 2.0,
                                                                                  borderSide: BorderSide(
                                                                                    color: Colors.transparent,
                                                                                    width: 1.0,
                                                                                  ),
                                                                                  borderRadius: BorderRadius.circular(8.0),
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
                                        ),
                                      if ((_model.multipleChoice == true) &&
                                          (_model.answer3 != null &&
                                              _model.answer3 != ''))
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 5.0, 0.0, 0.0),
                                          child: Container(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                0.85,
                                            height: 231.0,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              border: Border.all(
                                                color: Color(0x6395A1AC),
                                                width: 1.0,
                                              ),
                                            ),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  10.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
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
                                                                        5.0,
                                                                        0.0,
                                                                        5.0),
                                                            child: Container(
                                                              width: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .width *
                                                                  0.7,
                                                              height: 181.0,
                                                              decoration:
                                                                  BoxDecoration(),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Container(
                                                                            width:
                                                                                MediaQuery.sizeOf(context).width * 0.7,
                                                                            height:
                                                                                40.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              borderRadius: BorderRadius.circular(10.0),
                                                                              border: Border.all(
                                                                                color: Color(0x6395A1AC),
                                                                                width: 1.0,
                                                                              ),
                                                                            ),
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                                                                              child: TextFormField(
                                                                                controller: _model.choicesFOURanswerONEController,
                                                                                autofocus: true,
                                                                                obscureText: false,
                                                                                decoration: InputDecoration(
                                                                                  labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                        fontFamily: 'Outfit',
                                                                                        color: Color(0x6395A1AC),
                                                                                      ),
                                                                                  hintText: _model.answer1,
                                                                                  hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                        fontFamily: 'Outfit',
                                                                                        fontSize: 14.0,
                                                                                      ),
                                                                                  enabledBorder: InputBorder.none,
                                                                                  focusedBorder: InputBorder.none,
                                                                                  errorBorder: InputBorder.none,
                                                                                  focusedErrorBorder: InputBorder.none,
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Urbanist',
                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                    ),
                                                                                validator: _model.choicesFOURanswerONEControllerValidator.asValidator(context),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            7.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Container(
                                                                              width: MediaQuery.sizeOf(context).width * 0.7,
                                                                              height: 40.0,
                                                                              decoration: BoxDecoration(
                                                                                borderRadius: BorderRadius.circular(10.0),
                                                                                border: Border.all(
                                                                                  color: Color(0x6395A1AC),
                                                                                  width: 1.0,
                                                                                ),
                                                                              ),
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                                                                                child: TextFormField(
                                                                                  controller: _model.choicesFOURanswerTWOController,
                                                                                  autofocus: true,
                                                                                  obscureText: false,
                                                                                  decoration: InputDecoration(
                                                                                    labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                          fontFamily: 'Outfit',
                                                                                          color: Color(0x6395A1AC),
                                                                                        ),
                                                                                    hintText: _model.answer2,
                                                                                    hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                          fontFamily: 'Outfit',
                                                                                          fontSize: 14.0,
                                                                                        ),
                                                                                    enabledBorder: InputBorder.none,
                                                                                    focusedBorder: InputBorder.none,
                                                                                    errorBorder: InputBorder.none,
                                                                                    focusedErrorBorder: InputBorder.none,
                                                                                  ),
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Urbanist',
                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                      ),
                                                                                  validator: _model.choicesFOURanswerTWOControllerValidator.asValidator(context),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            7.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Container(
                                                                              width: MediaQuery.sizeOf(context).width * 0.7,
                                                                              height: 40.0,
                                                                              decoration: BoxDecoration(
                                                                                borderRadius: BorderRadius.circular(10.0),
                                                                                border: Border.all(
                                                                                  color: Color(0x6395A1AC),
                                                                                  width: 1.0,
                                                                                ),
                                                                              ),
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                                                                                child: TextFormField(
                                                                                  controller: _model.choicesFOURanswerTHREEController,
                                                                                  autofocus: true,
                                                                                  obscureText: false,
                                                                                  decoration: InputDecoration(
                                                                                    labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                          fontFamily: 'Outfit',
                                                                                          color: Color(0x6395A1AC),
                                                                                        ),
                                                                                    hintText: _model.answer3,
                                                                                    hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                          fontFamily: 'Outfit',
                                                                                          color: FlutterFlowTheme.of(context).background,
                                                                                          fontSize: 14.0,
                                                                                        ),
                                                                                    enabledBorder: InputBorder.none,
                                                                                    focusedBorder: InputBorder.none,
                                                                                    errorBorder: InputBorder.none,
                                                                                    focusedErrorBorder: InputBorder.none,
                                                                                  ),
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Urbanist',
                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                      ),
                                                                                  validator: _model.choicesFOURanswerTHREEControllerValidator.asValidator(context),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            7.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Container(
                                                                              width: MediaQuery.sizeOf(context).width * 0.7,
                                                                              height: 40.0,
                                                                              decoration: BoxDecoration(
                                                                                borderRadius: BorderRadius.circular(10.0),
                                                                                border: Border.all(
                                                                                  color: Color(0x6395A1AC),
                                                                                  width: 1.0,
                                                                                ),
                                                                              ),
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                                                                                child: TextFormField(
                                                                                  controller: _model.choicesFOURanswerFOURController,
                                                                                  autofocus: true,
                                                                                  obscureText: false,
                                                                                  decoration: InputDecoration(
                                                                                    hintText: 'Choice 4 (optional)',
                                                                                    hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                          fontFamily: 'Outfit',
                                                                                          color: Color(0x6395A1AC),
                                                                                          fontSize: 14.0,
                                                                                          fontWeight: FontWeight.w300,
                                                                                        ),
                                                                                    enabledBorder: InputBorder.none,
                                                                                    focusedBorder: InputBorder.none,
                                                                                    errorBorder: InputBorder.none,
                                                                                    focusedErrorBorder: InputBorder.none,
                                                                                  ),
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Urbanist',
                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                      ),
                                                                                  validator: _model.choicesFOURanswerFOURControllerValidator.asValidator(context),
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
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  8.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Column(
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
                                                                        0.0,
                                                                        10.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Container(
                                                                  width: 35.0,
                                                                  height: 35.0,
                                                                  decoration:
                                                                      BoxDecoration(),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            60.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        FlutterFlowIconButton(
                                                                      borderColor:
                                                                          Colors
                                                                              .transparent,
                                                                      borderRadius:
                                                                          30.0,
                                                                      buttonSize:
                                                                          40.0,
                                                                      icon:
                                                                          FaIcon(
                                                                        FontAwesomeIcons
                                                                            .minus,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                        size:
                                                                            20.0,
                                                                      ),
                                                                      onPressed:
                                                                          () async {
                                                                        setState(
                                                                            () {
                                                                          _model.answer3 =
                                                                              '';
                                                                        });
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
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Container(
                                                      width: MediaQuery.sizeOf(
                                                                  context)
                                                              .width *
                                                          0.841,
                                                      height: 38.0,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius.only(
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  20.0),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  20.0),
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
                                                          Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            5.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        FlutterFlowIconButton(
                                                                      borderColor:
                                                                          Colors
                                                                              .transparent,
                                                                      borderRadius:
                                                                          20.0,
                                                                      borderWidth:
                                                                          1.0,
                                                                      buttonSize:
                                                                          38.0,
                                                                      icon:
                                                                          Icon(
                                                                        Icons
                                                                            .alarm,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                        size:
                                                                            20.0,
                                                                      ),
                                                                      onPressed:
                                                                          () async {
                                                                        final _datePicked3Date =
                                                                            await showDatePicker(
                                                                          context:
                                                                              context,
                                                                          initialDate:
                                                                              getCurrentTimestamp,
                                                                          firstDate:
                                                                              getCurrentTimestamp,
                                                                          lastDate:
                                                                              DateTime(2050),
                                                                        );

                                                                        if (_datePicked3Date !=
                                                                            null) {
                                                                          setState(
                                                                              () {
                                                                            _model.datePicked3 =
                                                                                DateTime(
                                                                              _datePicked3Date.year,
                                                                              _datePicked3Date.month,
                                                                              _datePicked3Date.day,
                                                                            );
                                                                          });
                                                                        }
                                                                      },
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                          Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Container(
                                                                    width:
                                                                        100.0,
                                                                    height:
                                                                        10.0,
                                                                    decoration:
                                                                        BoxDecoration(),
                                                                    child: Text(
                                                                      'Poll ends on:',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Urbanist',
                                                                            color:
                                                                                Color(0xCCB2B2B2),
                                                                            fontSize:
                                                                                10.0,
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Container(
                                                                    width:
                                                                        100.0,
                                                                    height:
                                                                        20.0,
                                                                    decoration:
                                                                        BoxDecoration(),
                                                                    child: Text(
                                                                      _model.datePicked3 !=
                                                                              null
                                                                          ? dateTimeFormat(
                                                                              'relative',
                                                                              _model
                                                                                  .datePicked3)
                                                                          : dateTimeFormat(
                                                                              'relative',
                                                                              _model.date2),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Urbanist',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            fontSize:
                                                                                12.0,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                          Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Container(
                                                                    width:
                                                                        140.0,
                                                                    height:
                                                                        35.0,
                                                                    decoration:
                                                                        BoxDecoration(),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Container(
                                                                              width: 140.0,
                                                                              height: 35.0,
                                                                              decoration: BoxDecoration(),
                                                                              child: FlutterFlowPlacePicker(
                                                                                iOSGoogleMapsApiKey: 'AIzaSyBBzVycKke2mKHYdJlxidz4TDgmco1tW98',
                                                                                androidGoogleMapsApiKey: 'AIzaSyBBzVycKke2mKHYdJlxidz4TDgmco1tW98',
                                                                                webGoogleMapsApiKey: 'AIzaSyBBzVycKke2mKHYdJlxidz4TDgmco1tW98',
                                                                                onSelect: (place) async {
                                                                                  setState(() => _model.placePickerValue3 = place);
                                                                                },
                                                                                defaultText: 'Select Location',
                                                                                icon: Icon(
                                                                                  Icons.place,
                                                                                  color: Color(0xFF00AEFF),
                                                                                  size: 20.0,
                                                                                ),
                                                                                buttonOptions: FFButtonOptions(
                                                                                  width: 140.0,
                                                                                  height: 40.0,
                                                                                  color: Colors.black,
                                                                                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                        fontFamily: 'Urbanist',
                                                                                        color: Color(0xFF00AEFF),
                                                                                        fontSize: 14.0,
                                                                                      ),
                                                                                  elevation: 2.0,
                                                                                  borderSide: BorderSide(
                                                                                    color: Colors.transparent,
                                                                                    width: 1.0,
                                                                                  ),
                                                                                  borderRadius: BorderRadius.circular(8.0),
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
                                        ),
                                      if (valueOrDefault<bool>(
                                            _model.multipleChoice == true,
                                            false,
                                          ) &&
                                          (_model.answer2 == null ||
                                              _model.answer2 == '') &&
                                          (_model.answer1 == null ||
                                              _model.answer1 == ''))
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 5.0, 0.0, 0.0),
                                          child: Container(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                0.85,
                                            height: 145.0,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              border: Border.all(
                                                color: Color(0x6395A1AC),
                                                width: 1.0,
                                              ),
                                            ),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  10.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
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
                                                                        5.0,
                                                                        0.0,
                                                                        5.0),
                                                            child: Container(
                                                              width: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .width *
                                                                  0.7,
                                                              height: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .height *
                                                                  0.11,
                                                              decoration:
                                                                  BoxDecoration(),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Container(
                                                                            width:
                                                                                MediaQuery.sizeOf(context).width * 0.7,
                                                                            height:
                                                                                40.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              borderRadius: BorderRadius.circular(10.0),
                                                                              border: Border.all(
                                                                                color: Color(0x6395A1AC),
                                                                                width: 1.0,
                                                                              ),
                                                                            ),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Expanded(
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                                                                                    child: TextFormField(
                                                                                      controller: _model.choicesTWOanswerONEController2,
                                                                                      autofocus: true,
                                                                                      obscureText: false,
                                                                                      decoration: InputDecoration(
                                                                                        labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                              fontFamily: 'Outfit',
                                                                                              color: Color(0x6395A1AC),
                                                                                              fontSize: 15.0,
                                                                                            ),
                                                                                        hintText: 'True',
                                                                                        hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                              fontFamily: 'Outfit',
                                                                                              color: Color(0x6395A1AC),
                                                                                              fontSize: 14.0,
                                                                                            ),
                                                                                        enabledBorder: InputBorder.none,
                                                                                        focusedBorder: InputBorder.none,
                                                                                        errorBorder: InputBorder.none,
                                                                                        focusedErrorBorder: InputBorder.none,
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Urbanist',
                                                                                            color: FlutterFlowTheme.of(context).primaryText,
                                                                                          ),
                                                                                      maxLines: 3,
                                                                                      validator: _model.choicesTWOanswerONEController2Validator.asValidator(context),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            7.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Container(
                                                                              width: MediaQuery.sizeOf(context).width * 0.7,
                                                                              height: 40.0,
                                                                              decoration: BoxDecoration(
                                                                                borderRadius: BorderRadius.circular(10.0),
                                                                                border: Border.all(
                                                                                  color: Color(0x6395A1AC),
                                                                                  width: 1.0,
                                                                                ),
                                                                              ),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  if ((_model.trueFalse == true) && (_model.answer3 == null || _model.answer3 == ''))
                                                                                    Expanded(
                                                                                      child: Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                                                                                        child: TextFormField(
                                                                                          controller: _model.choicesTWOanswerTWOController2,
                                                                                          autofocus: true,
                                                                                          obscureText: false,
                                                                                          decoration: InputDecoration(
                                                                                            labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                  fontFamily: 'Outfit',
                                                                                                  color: Color(0x6395A1AC),
                                                                                                  fontSize: 17.0,
                                                                                                ),
                                                                                            hintText: 'False',
                                                                                            hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                  fontFamily: 'Outfit',
                                                                                                  color: Color(0x6395A1AC),
                                                                                                  fontSize: 14.0,
                                                                                                  fontWeight: FontWeight.w300,
                                                                                                ),
                                                                                            enabledBorder: InputBorder.none,
                                                                                            focusedBorder: InputBorder.none,
                                                                                            errorBorder: InputBorder.none,
                                                                                            focusedErrorBorder: InputBorder.none,
                                                                                          ),
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: 'Urbanist',
                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                              ),
                                                                                          validator: _model.choicesTWOanswerTWOController2Validator.asValidator(context),
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
                                                    Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Container(
                                                          width:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .width *
                                                                  0.73,
                                                          height: 38.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .only(
                                                              bottomLeft: Radius
                                                                  .circular(
                                                                      20.0),
                                                              bottomRight:
                                                                  Radius
                                                                      .circular(
                                                                          20.0),
                                                              topLeft: Radius
                                                                  .circular(
                                                                      0.0),
                                                              topRight: Radius
                                                                  .circular(
                                                                      0.0),
                                                            ),
                                                          ),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      FlutterFlowIconButton(
                                                                        borderColor:
                                                                            Colors.transparent,
                                                                        borderRadius:
                                                                            20.0,
                                                                        borderWidth:
                                                                            1.0,
                                                                        buttonSize:
                                                                            38.0,
                                                                        icon:
                                                                            Icon(
                                                                          Icons
                                                                              .alarm,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primary,
                                                                          size:
                                                                              20.0,
                                                                        ),
                                                                        onPressed:
                                                                            () async {
                                                                          final _datePicked4Date =
                                                                              await showDatePicker(
                                                                            context:
                                                                                context,
                                                                            initialDate:
                                                                                getCurrentTimestamp,
                                                                            firstDate:
                                                                                getCurrentTimestamp,
                                                                            lastDate:
                                                                                DateTime(2050),
                                                                          );

                                                                          if (_datePicked4Date !=
                                                                              null) {
                                                                            setState(() {
                                                                              _model.datePicked4 = DateTime(
                                                                                _datePicked4Date.year,
                                                                                _datePicked4Date.month,
                                                                                _datePicked4Date.day,
                                                                              );
                                                                            });
                                                                          }
                                                                        },
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ],
                                                              ),
                                                              Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Container(
                                                                        width:
                                                                            100.0,
                                                                        height:
                                                                            15.0,
                                                                        decoration:
                                                                            BoxDecoration(),
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              3.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            'Poll ends on:',
                                                                            textAlign:
                                                                                TextAlign.start,
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Urbanist',
                                                                                  color: Color(0xCCB2B2B2),
                                                                                  fontSize: 10.0,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Container(
                                                                        width:
                                                                            100.0,
                                                                        height:
                                                                            20.0,
                                                                        decoration:
                                                                            BoxDecoration(),
                                                                        child:
                                                                            Text(
                                                                          valueOrDefault<
                                                                              String>(
                                                                            dateTimeFormat('relative',
                                                                                _model.datePicked4),
                                                                            'Never',
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Urbanist',
                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                fontSize: 12.0,
                                                                                fontWeight: FontWeight.bold,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ],
                                                              ),
                                                              Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Container(
                                                                        width:
                                                                            140.0,
                                                                        height:
                                                                            35.0,
                                                                        decoration:
                                                                            BoxDecoration(),
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Container(
                                                                                  width: 140.0,
                                                                                  height: 35.0,
                                                                                  decoration: BoxDecoration(),
                                                                                  child: FlutterFlowPlacePicker(
                                                                                    iOSGoogleMapsApiKey: 'AIzaSyBBzVycKke2mKHYdJlxidz4TDgmco1tW98',
                                                                                    androidGoogleMapsApiKey: 'AIzaSyBBzVycKke2mKHYdJlxidz4TDgmco1tW98',
                                                                                    webGoogleMapsApiKey: 'AIzaSyBBzVycKke2mKHYdJlxidz4TDgmco1tW98',
                                                                                    onSelect: (place) async {
                                                                                      setState(() => _model.placePickerValue4 = place);
                                                                                    },
                                                                                    defaultText: 'Select Location',
                                                                                    icon: Icon(
                                                                                      Icons.place,
                                                                                      color: Color(0xFF00AEFF),
                                                                                      size: 20.0,
                                                                                    ),
                                                                                    buttonOptions: FFButtonOptions(
                                                                                      width: 140.0,
                                                                                      height: 40.0,
                                                                                      color: Colors.black,
                                                                                      textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                            fontFamily: 'Urbanist',
                                                                                            color: Color(0xFF00AEFF),
                                                                                            fontSize: 14.0,
                                                                                          ),
                                                                                      elevation: 2.0,
                                                                                      borderSide: BorderSide(
                                                                                        color: Colors.transparent,
                                                                                        width: 1.0,
                                                                                      ),
                                                                                      borderRadius: BorderRadius.circular(8.0),
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
                                                                ],
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
            ],
          ),
        ],
      ),
    );
  }
}
