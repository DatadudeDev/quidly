import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_autocomplete_options_list.dart';
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
import 'package:flutter/scheduler.dart';
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

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        _model.multipleChoice = true;
      });
    });

    _model.textController1 ??= TextEditingController();
    _model.choicesFOURanswerONEController ??= TextEditingController();
    _model.choicesFOURanswerTWOController ??= TextEditingController();
    _model.choicesFOURanswerTHREEController ??= TextEditingController();
    _model.choicesFOURanswerFOURController ??= TextEditingController();
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
                                color: _model.isPrivate == true
                                    ? Color(0xFF9C2BF1)
                                    : FlutterFlowTheme.of(context).primary,
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
                                  _model.nullExpiry = '∞';
                                  _model.pollLocation = _model.placePickerValue;
                                  _model.answer4 = _model
                                      .choicesFOURanswerFOURController.text;
                                  _model.answer3 = _model
                                      .choicesFOURanswerTHREEController.text;
                                  _model.answer2 = _model
                                      .choicesFOURanswerTWOController.text;
                                  _model.answer1 = _model
                                      .choicesFOURanswerONEController.text;
                                  _model.pollExpiry = _model.datePicked;
                                  setState(() {
                                    _model.addToLabelVotes(_model.answer1!);
                                  });
                                  setState(() {
                                    _model.addToLabelVotes(_model.answer2!);
                                  });
                                  setState(() {
                                    _model.addToLabelVotes(_model.answer3!);
                                  });
                                  setState(() {
                                    _model.addToLabelVotes(_model.answer4!);
                                  });
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
                                      if (_model.autoCompleted == true) {
                                        if (_model.pollExpiry != null) {
                                          await UserPostsRecord.collection
                                              .doc()
                                              .set(createUserPostsRecordData(
                                                postUser: currentUserReference,
                                                timePosted: getCurrentTimestamp,
                                                postOwner: true,
                                                postPoll: _model.autoComplete,
                                                postAnswer1: _model.answer1,
                                                postAnswer2: _model.answer2,
                                                postAnswer3: _model.answer3,
                                                postAnswer4: _model.answer4,
                                                imageURL: _model.imageURL,
                                                expiry: _model.pollExpiry,
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
                                                postPoll: _model.autoComplete,
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
                                                expiry: _model.pollExpiry,
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
                                  color: _model.isPrivate == true
                                      ? Color(0xFF9C2BF1)
                                      : FlutterFlowTheme.of(context).primary,
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
                    height: 435.0,
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
                                          Stack(
                                            children: [
                                              if (_model.isPrivate == false)
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(10.0, 0.0,
                                                                20.0, 0.0),
                                                    child: FFButtonWidget(
                                                      onPressed: () async {
                                                        setState(() {
                                                          _model.isPrivate =
                                                              true;
                                                        });
                                                      },
                                                      text: 'Public  ▼',
                                                      options: FFButtonOptions(
                                                        width: 70.0,
                                                        height: 30.0,
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        iconPadding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        color:
                                                            Color(0xAA000000),
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Urbanist',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  fontSize:
                                                                      12.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w300,
                                                                ),
                                                        elevation: 3.0,
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20.0),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              if (_model.isPrivate == true)
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(10.0, 0.0,
                                                                20.0, 0.0),
                                                    child: FFButtonWidget(
                                                      onPressed: () async {
                                                        setState(() {
                                                          _model.isPrivate =
                                                              false;
                                                        });
                                                      },
                                                      text: 'Private ▲',
                                                      options: FFButtonOptions(
                                                        width: 70.0,
                                                        height: 30.0,
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        iconPadding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        color:
                                                            Color(0xAA000000),
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Urbanist',
                                                                  color: Color(
                                                                      0xFF9C2BF1),
                                                                  fontSize:
                                                                      12.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w300,
                                                                ),
                                                        elevation: 3.0,
                                                        borderSide: BorderSide(
                                                          color:
                                                              Color(0xFF9C2BF1),
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20.0),
                                                      ),
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
                            ],
                          ),
                        ),
                        Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: 50.0,
                          decoration: BoxDecoration(),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  if (_model.autoCompleted == false)
                                    Expanded(
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  40.0, 0.0, 16.0, 0.0),
                                          child: Container(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                0.86,
                                            child: Autocomplete<String>(
                                              initialValue: TextEditingValue(),
                                              optionsBuilder:
                                                  (textEditingValue) {
                                                if (textEditingValue.text ==
                                                    '') {
                                                  return const Iterable<
                                                      String>.empty();
                                                }
                                                return (getJsonField(
                                                  (_model.apiResulthc6
                                                          ?.jsonBody ??
                                                      ''),
                                                  r'''$.autocomplete''',
                                                ) as List)
                                                    .map<String>(
                                                        (s) => s.toString())
                                                    .toList()!
                                                    .where((option) {
                                                  final lowercaseOption =
                                                      option.toLowerCase();
                                                  return lowercaseOption
                                                      .contains(textEditingValue
                                                          .text
                                                          .toLowerCase());
                                                });
                                              },
                                              optionsViewBuilder: (context,
                                                  onSelected, options) {
                                                return AutocompleteOptionsList(
                                                  textFieldKey:
                                                      _model.textFieldKey,
                                                  textController:
                                                      _model.textController1!,
                                                  options: options.toList(),
                                                  onSelected: onSelected,
                                                  textStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium,
                                                  textHighlightStyle:
                                                      TextStyle(),
                                                  elevation: 4.0,
                                                  optionBackgroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primaryBackground,
                                                  optionHighlightColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryBackground,
                                                  maxHeight: 200.0,
                                                );
                                              },
                                              onSelected: (String selection) {
                                                setState(() => _model
                                                        .textFieldSelectedOption =
                                                    selection);
                                                FocusScope.of(context)
                                                    .unfocus();
                                              },
                                              fieldViewBuilder: (
                                                context,
                                                textEditingController,
                                                focusNode,
                                                onEditingComplete,
                                              ) {
                                                _model.textController1 =
                                                    textEditingController;
                                                return TextFormField(
                                                  key: _model.textFieldKey,
                                                  controller:
                                                      textEditingController,
                                                  focusNode: focusNode,
                                                  onEditingComplete:
                                                      onEditingComplete,
                                                  onChanged: (_) =>
                                                      EasyDebounce.debounce(
                                                    '_model.textController1',
                                                    Duration(milliseconds: 500),
                                                    () async {
                                                      setState(() {
                                                        _model.poll = _model
                                                            .textController1
                                                            .text;
                                                      });
                                                      _model.apiResulthc6 =
                                                          await AutoCompleteCall
                                                              .call(
                                                        poll: _model.poll,
                                                      );
                                                      if ((_model.apiResulthc6
                                                              ?.succeeded ??
                                                          true)) {
                                                        setState(() {
                                                          _model.autoComplete =
                                                              getJsonField(
                                                            (_model.apiResulthc6
                                                                    ?.jsonBody ??
                                                                ''),
                                                            r'''$.autocomplete''',
                                                          ).toString();
                                                        });
                                                      }

                                                      setState(() {});
                                                    },
                                                  ),
                                                  autofocus: true,
                                                  textCapitalization:
                                                      TextCapitalization
                                                          .sentences,
                                                  obscureText: false,
                                                  decoration: InputDecoration(
                                                    labelStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          color:
                                                              Color(0xB9B2B2B2),
                                                          fontSize: 20.0,
                                                          fontWeight:
                                                              FontWeight.w300,
                                                          decoration:
                                                              TextDecoration
                                                                  .underline,
                                                        ),
                                                    hintText:
                                                        'Ask a question...',
                                                    hintStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          color:
                                                              Color(0xB9B2B2B2),
                                                          fontSize: 20.0,
                                                          fontWeight:
                                                              FontWeight.w300,
                                                        ),
                                                    enabledBorder:
                                                        InputBorder.none,
                                                    focusedBorder:
                                                        InputBorder.none,
                                                    errorBorder:
                                                        InputBorder.none,
                                                    focusedErrorBorder:
                                                        InputBorder.none,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Urbanist',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .background,
                                                        fontSize: 20.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                  minLines: 1,
                                                  cursorColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .background,
                                                  validator: _model
                                                      .textController1Validator
                                                      .asValidator(context),
                                                );
                                              },
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
                        Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: 30.0,
                          decoration: BoxDecoration(),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        40.0, 0.0, 0.0, 0.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        setState(() {
                                          _model.poll = _model.autoComplete;
                                          _model.autoCompleted = true;
                                        });
                                      },
                                      child: Text(
                                        _model.autoComplete,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Urbanist',
                                              fontSize:
                                                  _model.autoCompleted == true
                                                      ? 20.0
                                                      : 14.0,
                                            ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
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
                                          0.0, 20.0, 0.0, 0.0),
                                      child: Container(
                                        width: 50.0,
                                        height: 240.0,
                                        decoration: BoxDecoration(),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Stack(
                                              children: [
                                                if (_model.multipleChoice ==
                                                    false)
                                                  FlutterFlowIconButton(
                                                    borderRadius: 20.0,
                                                    borderWidth: 1.0,
                                                    buttonSize: 40.0,
                                                    icon: Icon(
                                                      Icons
                                                          .format_list_bulleted,
                                                      color: Color(0xB9B2B2B2),
                                                      size: 18.0,
                                                    ),
                                                    onPressed: () async {
                                                      setState(() {
                                                        _model.writeIn = false;
                                                        _model.multipleChoice =
                                                            true;
                                                        _model.trueFalse =
                                                            false;
                                                        _model.imageChoice =
                                                            false;
                                                      });
                                                    },
                                                  ),
                                                if (_model.multipleChoice ==
                                                    true)
                                                  FlutterFlowIconButton(
                                                    borderColor:
                                                        Colors.transparent,
                                                    borderRadius: 20.0,
                                                    borderWidth: 1.0,
                                                    buttonSize: 40.0,
                                                    icon: Icon(
                                                      Icons
                                                          .format_list_bulleted,
                                                      color: _model.isPrivate ==
                                                              true
                                                          ? Color(0xFF9C2BF1)
                                                          : FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      size: 24.0,
                                                    ),
                                                    onPressed: () async {
                                                      setState(() {
                                                        _model.writeIn = false;
                                                        _model.multipleChoice =
                                                            true;
                                                        _model.trueFalse =
                                                            false;
                                                        _model.imageChoice =
                                                            false;
                                                      });
                                                    },
                                                  ),
                                              ],
                                            ),
                                            Stack(
                                              children: [
                                                if (_model.writeIn == false)
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child:
                                                        FlutterFlowIconButton(
                                                      borderColor:
                                                          Colors.transparent,
                                                      borderRadius: 20.0,
                                                      borderWidth: 1.0,
                                                      buttonSize: 40.0,
                                                      icon: FaIcon(
                                                        FontAwesomeIcons
                                                            .penFancy,
                                                        color:
                                                            Color(0xB9B2B2B2),
                                                        size: 18.0,
                                                      ),
                                                      onPressed: () async {
                                                        setState(() {
                                                          _model.writeIn = true;
                                                          _model.multipleChoice =
                                                              false;
                                                          _model.trueFalse =
                                                              false;
                                                          _model.answer1 = '';
                                                          _model.answer2 = '';
                                                          _model.answer3 = '';
                                                          _model.answer4 = '';
                                                          _model.imageChoice =
                                                              false;
                                                        });
                                                      },
                                                    ),
                                                  ),
                                                if (_model.writeIn == true)
                                                  FlutterFlowIconButton(
                                                    borderRadius: 20.0,
                                                    borderWidth: 1.0,
                                                    buttonSize: 40.0,
                                                    icon: FaIcon(
                                                      FontAwesomeIcons.penFancy,
                                                      color: _model.isPrivate ==
                                                              true
                                                          ? Color(0xFF9C2BF1)
                                                          : FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      size: 20.0,
                                                    ),
                                                    onPressed: () async {
                                                      setState(() {
                                                        _model.writeIn = true;
                                                        _model.multipleChoice =
                                                            false;
                                                        _model.trueFalse =
                                                            false;
                                                        _model.answer1 = '';
                                                        _model.answer2 = '';
                                                        _model.answer3 = '';
                                                        _model.answer4 = '';
                                                        _model.imageChoice =
                                                            false;
                                                      });
                                                    },
                                                  ),
                                              ],
                                            ),
                                            Stack(
                                              children: [
                                                if (_model.trueFalse == false)
                                                  FlutterFlowIconButton(
                                                    borderRadius: 20.0,
                                                    borderWidth: 1.0,
                                                    buttonSize: 40.0,
                                                    icon: Icon(
                                                      Icons.rule,
                                                      color: Color(0xB9B2B2B2),
                                                      size: 18.0,
                                                    ),
                                                    onPressed: () async {
                                                      setState(() {
                                                        _model.writeIn = false;
                                                        _model.multipleChoice =
                                                            false;
                                                        _model.trueFalse = true;
                                                        _model.answer3 = '';
                                                        _model.answer4 = '';
                                                        _model.imageChoice =
                                                            false;
                                                      });
                                                    },
                                                  ),
                                                if (_model.trueFalse == true)
                                                  FlutterFlowIconButton(
                                                    borderColor:
                                                        Colors.transparent,
                                                    borderRadius: 20.0,
                                                    borderWidth: 1.0,
                                                    buttonSize: 40.0,
                                                    icon: Icon(
                                                      Icons.rule,
                                                      color: _model.isPrivate ==
                                                              true
                                                          ? Color(0xFF9C2BF1)
                                                          : FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      size: 24.0,
                                                    ),
                                                    onPressed: () async {
                                                      setState(() {
                                                        _model.writeIn = false;
                                                        _model.multipleChoice =
                                                            false;
                                                        _model.trueFalse = true;
                                                        _model.answer3 = '';
                                                        _model.answer4 = '';
                                                        _model.imageChoice =
                                                            false;
                                                      });
                                                    },
                                                  ),
                                              ],
                                            ),
                                            Stack(
                                              children: [
                                                if (_model.imageChoice == false)
                                                  FlutterFlowIconButton(
                                                    borderColor:
                                                        Colors.transparent,
                                                    borderRadius: 20.0,
                                                    borderWidth: 1.0,
                                                    buttonSize: 40.0,
                                                    icon: Icon(
                                                      Icons.image_outlined,
                                                      color: Color(0xB9B2B2B2),
                                                      size: 18.0,
                                                    ),
                                                    onPressed: () async {
                                                      setState(() {
                                                        _model.writeIn = false;
                                                        _model.multipleChoice =
                                                            false;
                                                        _model.trueFalse =
                                                            false;
                                                        _model.answer3 = '';
                                                        _model.answer4 = '';
                                                        _model.imageChoice =
                                                            true;
                                                      });
                                                    },
                                                  ),
                                                if (_model.imageChoice == true)
                                                  FlutterFlowIconButton(
                                                    borderColor:
                                                        Colors.transparent,
                                                    borderRadius: 20.0,
                                                    borderWidth: 1.0,
                                                    buttonSize: 40.0,
                                                    icon: Icon(
                                                      Icons.image_outlined,
                                                      color: _model.isPrivate ==
                                                              true
                                                          ? Color(0xFF9C2BF1)
                                                          : FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      size: 24.0,
                                                    ),
                                                    onPressed: () async {
                                                      setState(() {
                                                        _model.writeIn = false;
                                                        _model.multipleChoice =
                                                            false;
                                                        _model.trueFalse =
                                                            false;
                                                        _model.answer3 = '';
                                                        _model.answer4 = '';
                                                        _model.answer2 = '';
                                                        _model.answer1 = '';
                                                      });
                                                    },
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
                              children: [
                                if (_model.multipleChoice == true)
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 5.0, 0.0, 0.0),
                                    child: Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          0.85,
                                      height: 235.0,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        border: Border.all(
                                          width: 0.0,
                                        ),
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    10.0,
                                                                    5.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Container(
                                                          width:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .width *
                                                                  0.7,
                                                          height: 40.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10.0),
                                                            border: Border.all(
                                                              color: Color(
                                                                  0x6395A1AC),
                                                              width: 1.0,
                                                            ),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        8.0,
                                                                        0.0,
                                                                        8.0,
                                                                        0.0),
                                                            child:
                                                                TextFormField(
                                                              controller: _model
                                                                  .choicesFOURanswerONEController,
                                                              autofocus: true,
                                                              obscureText:
                                                                  false,
                                                              decoration:
                                                                  InputDecoration(
                                                                labelStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Outfit',
                                                                      color: Color(
                                                                          0x6395A1AC),
                                                                      fontSize:
                                                                          14.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w300,
                                                                    ),
                                                                hintText:
                                                                    'Choice 1',
                                                                hintStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Outfit',
                                                                      color: Color(
                                                                          0x6395A1AC),
                                                                      fontSize:
                                                                          14.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w300,
                                                                    ),
                                                                enabledBorder:
                                                                    InputBorder
                                                                        .none,
                                                                focusedBorder:
                                                                    InputBorder
                                                                        .none,
                                                                errorBorder:
                                                                    InputBorder
                                                                        .none,
                                                                focusedErrorBorder:
                                                                    InputBorder
                                                                        .none,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Urbanist',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                  ),
                                                              validator: _model
                                                                  .choicesFOURanswerONEControllerValidator
                                                                  .asValidator(
                                                                      context),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Container(
                                                        width: 30.0,
                                                        height: 30.0,
                                                        decoration:
                                                            BoxDecoration(),
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
                                                                    10.0,
                                                                    5.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Container(
                                                          width:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .width *
                                                                  0.7,
                                                          height: 40.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10.0),
                                                            border: Border.all(
                                                              color: Color(
                                                                  0x6395A1AC),
                                                              width: 1.0,
                                                            ),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        8.0,
                                                                        0.0,
                                                                        8.0,
                                                                        0.0),
                                                            child:
                                                                TextFormField(
                                                              controller: _model
                                                                  .choicesFOURanswerTWOController,
                                                              autofocus: true,
                                                              obscureText:
                                                                  false,
                                                              decoration:
                                                                  InputDecoration(
                                                                labelStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Outfit',
                                                                      color: Color(
                                                                          0x6395A1AC),
                                                                    ),
                                                                hintText:
                                                                    'Choice 2',
                                                                hintStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Outfit',
                                                                      color: Color(
                                                                          0x6395A1AC),
                                                                      fontSize:
                                                                          14.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w300,
                                                                    ),
                                                                enabledBorder:
                                                                    InputBorder
                                                                        .none,
                                                                focusedBorder:
                                                                    InputBorder
                                                                        .none,
                                                                errorBorder:
                                                                    InputBorder
                                                                        .none,
                                                                focusedErrorBorder:
                                                                    InputBorder
                                                                        .none,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Urbanist',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                  ),
                                                              validator: _model
                                                                  .choicesFOURanswerTWOControllerValidator
                                                                  .asValidator(
                                                                      context),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Stack(
                                                        children: [
                                                          if ((_model.multipleChoice ==
                                                                  true) &&
                                                              (_model.row3 ==
                                                                  false) &&
                                                              (_model.row4 ==
                                                                  false))
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          5.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: InkWell(
                                                                splashColor: Colors
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
                                                                  setState(() {
                                                                    _model.answer1 =
                                                                        _model
                                                                            .choicesFOURanswerONEController
                                                                            .text;
                                                                    _model.answer2 =
                                                                        _model
                                                                            .choicesFOURanswerTWOController
                                                                            .text;
                                                                    _model.row3 =
                                                                        true;
                                                                  });
                                                                },
                                                                child: Icon(
                                                                  Icons.add,
                                                                  color: _model
                                                                              .isPrivate ==
                                                                          true
                                                                      ? Color(
                                                                          0xFF6920A1)
                                                                      : FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                  size: 24.0,
                                                                ),
                                                              ),
                                                            ),
                                                          if ((_model.multipleChoice ==
                                                                  true) &&
                                                              (_model.row3 ==
                                                                  true) &&
                                                              (_model.row4 ==
                                                                  false))
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0.0, 0.0),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            5.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: InkWell(
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
                                                                      _model.answer3 =
                                                                          '';
                                                                      _model.row3 =
                                                                          false;
                                                                    });
                                                                  },
                                                                  child: Icon(
                                                                    Icons
                                                                        .remove,
                                                                    color: _model.isPrivate ==
                                                                            true
                                                                        ? Color(
                                                                            0xFF6920A1)
                                                                        : FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                    size: 24.0,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          if (_model.row4 ==
                                                              true)
                                                            Container(
                                                              width: 30.0,
                                                              height: 30.0,
                                                              decoration:
                                                                  BoxDecoration(),
                                                            ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                  if ((_model.multipleChoice ==
                                                          true) &&
                                                      (_model.row3 == true))
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      10.0,
                                                                      5.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Container(
                                                            width: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width *
                                                                0.7,
                                                            height: 40.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10.0),
                                                              border:
                                                                  Border.all(
                                                                color: Color(
                                                                    0x6395A1AC),
                                                                width: 1.0,
                                                              ),
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          8.0,
                                                                          0.0,
                                                                          8.0,
                                                                          0.0),
                                                              child:
                                                                  TextFormField(
                                                                controller: _model
                                                                    .choicesFOURanswerTHREEController,
                                                                autofocus: true,
                                                                obscureText:
                                                                    false,
                                                                decoration:
                                                                    InputDecoration(
                                                                  labelStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Outfit',
                                                                        color: Color(
                                                                            0x6395A1AC),
                                                                      ),
                                                                  hintText:
                                                                      'Choice 3 (Optional)',
                                                                  hintStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Outfit',
                                                                        color: Color(
                                                                            0x6395A1AC),
                                                                        fontSize:
                                                                            14.0,
                                                                        fontWeight:
                                                                            FontWeight.w300,
                                                                      ),
                                                                  enabledBorder:
                                                                      InputBorder
                                                                          .none,
                                                                  focusedBorder:
                                                                      InputBorder
                                                                          .none,
                                                                  errorBorder:
                                                                      InputBorder
                                                                          .none,
                                                                  focusedErrorBorder:
                                                                      InputBorder
                                                                          .none,
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Urbanist',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                    ),
                                                                validator: _model
                                                                    .choicesFOURanswerTHREEControllerValidator
                                                                    .asValidator(
                                                                        context),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Stack(
                                                          children: [
                                                            if ((_model.multipleChoice ==
                                                                    true) &&
                                                                (_model.row3 ==
                                                                    true) &&
                                                                (_model.row4 ==
                                                                    false))
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            5.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: InkWell(
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
                                                                      _model.answer3 = _model
                                                                          .choicesFOURanswerTHREEController
                                                                          .text;
                                                                      _model.row4 =
                                                                          true;
                                                                    });
                                                                  },
                                                                  child: Icon(
                                                                    Icons.add,
                                                                    color: _model.isPrivate ==
                                                                            true
                                                                        ? Color(
                                                                            0xFF6920A1)
                                                                        : FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                    size: 24.0,
                                                                  ),
                                                                ),
                                                              ),
                                                            if ((_model.multipleChoice ==
                                                                    true) &&
                                                                (_model.row3 ==
                                                                    true) &&
                                                                (_model.row4 ==
                                                                    true))
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            5.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: InkWell(
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
                                                                      _model.answer4 =
                                                                          '';
                                                                      _model.row4 =
                                                                          false;
                                                                    });
                                                                  },
                                                                  child: Icon(
                                                                    Icons
                                                                        .remove,
                                                                    color: _model.isPrivate ==
                                                                            true
                                                                        ? Color(
                                                                            0xFF6920A1)
                                                                        : FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                    size: 24.0,
                                                                  ),
                                                                ),
                                                              ),
                                                            if ((_model.multipleChoice ==
                                                                    true) &&
                                                                (_model.row3 ==
                                                                    false))
                                                              Container(
                                                                width: 30.0,
                                                                height: 30.0,
                                                                decoration:
                                                                    BoxDecoration(),
                                                              ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  if ((_model.multipleChoice ==
                                                          true) &&
                                                      ((_model.row3 == true) &&
                                                          (_model.row4 ==
                                                              true)))
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      10.0,
                                                                      5.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Container(
                                                            width: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width *
                                                                0.7,
                                                            height: 40.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10.0),
                                                              border:
                                                                  Border.all(
                                                                color: Color(
                                                                    0x6395A1AC),
                                                                width: 1.0,
                                                              ),
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          8.0,
                                                                          0.0,
                                                                          8.0,
                                                                          0.0),
                                                              child:
                                                                  TextFormField(
                                                                controller: _model
                                                                    .choicesFOURanswerFOURController,
                                                                autofocus: true,
                                                                obscureText:
                                                                    false,
                                                                decoration:
                                                                    InputDecoration(
                                                                  hintText:
                                                                      'Choice 4 (optional)',
                                                                  hintStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Outfit',
                                                                        color: Color(
                                                                            0x6395A1AC),
                                                                        fontSize:
                                                                            14.0,
                                                                        fontWeight:
                                                                            FontWeight.w300,
                                                                      ),
                                                                  enabledBorder:
                                                                      InputBorder
                                                                          .none,
                                                                  focusedBorder:
                                                                      InputBorder
                                                                          .none,
                                                                  errorBorder:
                                                                      InputBorder
                                                                          .none,
                                                                  focusedErrorBorder:
                                                                      InputBorder
                                                                          .none,
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Urbanist',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                    ),
                                                                validator: _model
                                                                    .choicesFOURanswerFOURControllerValidator
                                                                    .asValidator(
                                                                        context),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Container(
                                                          width: 30.0,
                                                          height: 30.0,
                                                          decoration:
                                                              BoxDecoration(),
                                                        ),
                                                      ],
                                                    ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Container(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        0.841,
                                                height: 45.0,
                                                decoration: BoxDecoration(
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
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 10.0, 0.0, 0.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
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
                                                                  icon: Icon(
                                                                    Icons.alarm,
                                                                    color: _model.isPrivate ==
                                                                            true
                                                                        ? Color(
                                                                            0xFF9C2BF1)
                                                                        : FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                    size: 20.0,
                                                                  ),
                                                                  onPressed:
                                                                      () async {
                                                                    final _datePickedDate =
                                                                        await showDatePicker(
                                                                      context:
                                                                          context,
                                                                      initialDate:
                                                                          getCurrentTimestamp,
                                                                      firstDate:
                                                                          getCurrentTimestamp,
                                                                      lastDate:
                                                                          DateTime(
                                                                              2050),
                                                                    );

                                                                    if (_datePickedDate !=
                                                                        null) {
                                                                      setState(
                                                                          () {
                                                                        _model.datePicked =
                                                                            DateTime(
                                                                          _datePickedDate
                                                                              .year,
                                                                          _datePickedDate
                                                                              .month,
                                                                          _datePickedDate
                                                                              .day,
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
                                                            MainAxisSize.max,
                                                        children: [
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Container(
                                                                width: 100.0,
                                                                height: 10.0,
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
                                                                        color: Color(
                                                                            0xCCB2B2B2),
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
                                                                width: 100.0,
                                                                height: 30.0,
                                                                decoration:
                                                                    BoxDecoration(),
                                                                child: Text(
                                                                  _model.datePicked !=
                                                                          null
                                                                      ? dateTimeFormat(
                                                                          'relative',
                                                                          _model
                                                                              .datePicked,
                                                                          locale:
                                                                              FFLocalizations.of(context).languageShortCode ?? FFLocalizations.of(context).languageCode,
                                                                        )
                                                                      : dateTimeFormat(
                                                                          'relative',
                                                                          _model
                                                                              .date2,
                                                                          locale:
                                                                              FFLocalizations.of(context).languageShortCode ?? FFLocalizations.of(context).languageCode,
                                                                        ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Urbanist',
                                                                        color: _model.isPrivate ==
                                                                                true
                                                                            ? Color(0xFF9C2BF1)
                                                                            : FlutterFlowTheme.of(context).primary,
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
                                                            MainAxisSize.max,
                                                        children: [
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Container(
                                                                width: 140.0,
                                                                height: 35.0,
                                                                decoration:
                                                                    BoxDecoration(),
                                                                child: Column(
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
                                                                              FlutterFlowPlacePicker(
                                                                            iOSGoogleMapsApiKey:
                                                                                'AIzaSyBBzVycKke2mKHYdJlxidz4TDgmco1tW98',
                                                                            androidGoogleMapsApiKey:
                                                                                'AIzaSyBBzVycKke2mKHYdJlxidz4TDgmco1tW98',
                                                                            webGoogleMapsApiKey:
                                                                                'AIzaSyBBzVycKke2mKHYdJlxidz4TDgmco1tW98',
                                                                            onSelect:
                                                                                (place) async {
                                                                              setState(() => _model.placePickerValue = place);
                                                                            },
                                                                            defaultText:
                                                                                'Select Location',
                                                                            icon:
                                                                                Icon(
                                                                              Icons.place,
                                                                              color: Color(0xFF00AEFF),
                                                                              size: 20.0,
                                                                            ),
                                                                            buttonOptions:
                                                                                FFButtonOptions(
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
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
