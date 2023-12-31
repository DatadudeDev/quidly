import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/auth/firebase_auth/auth_util.dart';

int likes(UserPostsRecord? post) {
  return post!.likes!.length;
}

bool hasUploadedMedia(String? mediaPath) {
  return mediaPath != null && mediaPath.isNotEmpty;
}

int shits(UserPostsRecord? post) {
  return post!.shits!.length;
}

int votes(UserPostsRecord? post) {
  return post!.votes1!.length +
      post!.votes2!.length +
      post!.votes3!.length +
      post!.votes4!.length;
}
