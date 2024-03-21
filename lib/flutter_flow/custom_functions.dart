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

double? subtotaItem(
  int qty,
  double precio,
) {
  return qty * precio;
}

double? cupon10(double amount) {
  return amount * 0.90;
}

double? funcionBiblia(
  int qty,
  double precio,
) {
  return qty * precio;
}

double? cuponmasenvio10(double amount) {
  return amount * 0.90 + 15;
}

bool? showSearchResult2(
  String textSearchFor,
  String textSearchIn,
) {
  return textSearchIn.toLowerCase().contains(textSearchFor.toLowerCase());
}

double? envioprovincia(double amount) {
  return amount + 20;
}

double? enviolejos(double amount) {
  return amount + 35;
}

double? envio(double amount) {
  return amount + 15;
}

double? cupon(double amount) {
  return amount * 0.80;
}

double? cuponmasenvio(double amount) {
  return amount * 0.80 + 15;
}
