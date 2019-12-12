import 'dart:async';

import 'package:tekartik_app_utils/preoutput/pre_output.dart';
import 'package:tekartik_app_utils/recaptcha/recaptcha.dart';
import 'package:tekartik_browser_utils/browser_utils_import.dart';

Future main() async {
  // querySelector('#output').text = 'Your Dart app is running.';

  final output = PreOutput(id: 'output');
  output.writeln('waiting for non-robot');
  await grecaptchaLoadJs();
  var token =
      await grecaptchaWait(siteKey: '6Lc4rI0UAAAAAK1B-0lJR_svGSMedTwuWk4jADxC');
  output.writeln('token: $token');
}
