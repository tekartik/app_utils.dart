import 'dart:async';

import 'package:tekartik_app_utils/preoutput/pre_output_interop.dart';
import 'package:tekartik_app_utils/recaptcha/recaptcha.dart';
import 'package:tekartik_common_utils/common_utils_import.dart';

Future main() async {
  var siteKey = '6LdXqY0UAAAAADHEJ-K2IiDsDBkw8f15qg3WORJj';
  final output = PreOutput(id: 'output');
  output.writeln('waiting for non-robot');
  var token = await grecaptchaV3Wait(siteKey: siteKey, action: 'test');
  output.writeln('token: $token');
}
