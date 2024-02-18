import 'dart:developer' as developerLog;

import 'package:flutter/foundation.dart';

debugLog(String s) {
  if (kDebugMode) developerLog.log(s);
}
