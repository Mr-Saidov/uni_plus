import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

const baseFileUrl = "https://bloom-api.kaktus365.uz/file/";

debugLog(String s) {
  if (kDebugMode) log(s);
}

String getErrorMessage(error) {
  String errorMessage = "w32".tr();
  if (error is DioException && error.response != null) {
    try {
      // if (errorList.contains(error.response?.data)) {
        errorMessage = error.response?.data;
      // }
    } catch (e) {
      debugLog("getErrorMessage $e");
    }
  }
  return errorMessage;
}

String currencyFormatter(double? number, {decimalDigit = 2}) {
  final formatCurrency = NumberFormat.currency(
      locale: "en_US", symbol: "", decimalDigits: decimalDigit);
  return formatCurrency.format(number).replaceAll(",", " ");
}

const int intMaxValue = 9223372036854775807;

String timerFormat(num seconds) =>
    "${(seconds ~/ 60).toString().padLeft(2, "0")}:${(seconds % 60).toString().padLeft(2, "0")}";

extension BuildContextX on BuildContext {
  void replaceSnackbar({
    required Widget content,
  }) {
    final scaffoldMessenger = ScaffoldMessenger.of(this);
    scaffoldMessenger.removeCurrentSnackBar();
    scaffoldMessenger.showSnackBar(
      SnackBar(content: content),
    );
  }
}

extension HexColor on Color {
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}
