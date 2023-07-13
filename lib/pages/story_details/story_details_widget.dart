import '/backend/backend.dart';
import '/components/comments/comments_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_media_display.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'story_details_model.dart';
export 'story_details_model.dart';

class StoryDetailsWidget extends StatefulWidget {
  const StoryDetailsWidget({
    Key? key,
    this.initialStoryIndex,
  }) : super(key: key);

  final int? initialStoryIndex;

  @override
  _StoryDetailsWidgetState createState() => _StoryDetailsWidgetState();
}

class _StoryDetailsWidgetState extends State<StoryDetailsWidget> {
  late StoryDetailsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StoryDetailsModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryDark,
      body: SafeArea(
        top: true,
        child: Stack(
          children: [
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: StreamBuilder<List<UserStoriesRecord>>(
                    stream: queryUserStoriesRecord(),
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return Center(
                          child: SizedBox(
                            width: 50.0,
                            height: 50.0,
                            child: CircularProgressIndicator(
                              color: FlutterFlowTheme.of(context).primary,
                            ),
                          ),
                        );
                      }
                      List<UserStoriesRecord> pageViewUserStoriesRecordList =
                          snapshot.data!;
                      return Container(
                        width: double.infinity,
                        height: double.infinity,
                        child: Stack(
                          children: [
                            PageView.builder(
                              controller: _model.pageViewController ??=
                                  PageController(
                                      initialPage: min(
                                          valueOrDefault<int>(
                                            widget.initialStoryIndex,
                                            0,
                                          ),
                                          pageViewUserStoriesRecordList.length -
                                              1)),
                              scrollDirection: Axis.vertical,
                              itemCount: pageViewUserStoriesRecordList.length,
                              itemBuilder: (context, pageViewIndex) {
                                final pageViewUserStoriesRecord =
                                    pageViewUserStoriesRecordList[
                                        pageViewIndex];
                                return Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Container(
                                      width: 400.0,
                                      height: 650.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                      child: SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            FlutterFlowMediaDisplay(
                                              path: pageViewUserStoriesRecord
                                                  .storyVideo,
                                              imageBuilder: (path) => ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(0.0),
                                                child: Image.network(
                                                  path,
                                                  width: 390.0,
                                                  height: 650.0,
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                              videoPlayerBuilder: (path) =>
                                                  FlutterFlowVideoPlayer(
                                                path: path,
                                                width: 390.0,
                                                height: 650.0,
                                                autoPlay: true,
                                                looping: true,
                                                showControls: true,
                                                allowFullScreen: true,
                                                allowPlaybackSpeedMenu: true,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 12.0, 16.0, 8.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              await showModalBottomSheet(
                                                isScrollControlled: true,
                                                backgroundColor:
                                                    Color(0x00000000),
                                                barrierColor: Color(0x00000000),
                                                context: context,
                                                builder: (context) {
                                                  return Padding(
                                                    padding:
                                                        MediaQuery.viewInsetsOf(
                                                            context),
                                                    child: Container(
                                                      height: 600.0,
                                                      child: CommentsWidget(
                                                        story:
                                                            pageViewUserStoriesRecord,
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ).then(
                                                  (value) => setState(() {}));
                                            },
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Icon(
                                                  Icons.mode_comment_outlined,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .tertiary,
                                                  size: 24.0,
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          8.0, 0.0, 0.0, 0.0),
                                                  child: Text(
                                                    pageViewUserStoriesRecord
                                                        .numComments
                                                        .toString(),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Urbanist',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .tertiary,
                                                        ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                Builder(
                                                  builder: (context) =>
                                                      FlutterFlowIconButton(
                                                    borderColor:
                                                        Colors.transparent,
                                                    borderRadius: 30.0,
                                                    buttonSize: 48.0,
                                                    icon: Icon(
                                                      Icons.ios_share,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .tertiary,
                                                      size: 30.0,
                                                    ),
                                                    onPressed: () async {
                                                      await Share.share(
                                                        'This post is really awesome!',
                                                        sharePositionOrigin:
                                                            getWidgetBoundingBox(
                                                                context),
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
                                  ],
                                );
                              },
                            ),
                            Align(
                              alignment: AlignmentDirectional(0.95, 0.7),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 10.0),
                                child:
                                    smooth_page_indicator.SmoothPageIndicator(
                                  controller: _model.pageViewController ??=
                                      PageController(
                                          initialPage: min(
                                              valueOrDefault<int>(
                                                widget.initialStoryIndex,
                                                0,
                                              ),
                                              pageViewUserStoriesRecordList
                                                      .length -
                                                  1)),
                                  count: pageViewUserStoriesRecordList.length,
                                  axisDirection: Axis.vertical,
                                  onDotClicked: (i) async {
                                    await _model.pageViewController!
                                        .animateToPage(
                                      i,
                                      duration: Duration(milliseconds: 500),
                                      curve: Curves.ease,
                                    );
                                  },
                                  effect:
                                      smooth_page_indicator.ExpandingDotsEffect(
                                    expansionFactor: 2.0,
                                    spacing: 8.0,
                                    radius: 16.0,
                                    dotWidth: 8.0,
                                    dotHeight: 4.0,
                                    dotColor: Color(0x65DBE2E7),
                                    activeDotColor:
                                        FlutterFlowTheme.of(context).tertiary,
                                    paintStyle: PaintingStyle.fill,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                FlutterFlowIconButton(
                  borderColor: Colors.transparent,
                  borderRadius: 30.0,
                  buttonSize: 46.0,
                  icon: Icon(
                    Icons.arrow_back_rounded,
                    color: FlutterFlowTheme.of(context).secondaryText,
                    size: 24.0,
                  ),
                  onPressed: () async {
                    context.pop();
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
