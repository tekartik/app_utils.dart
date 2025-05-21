import 'dart:async';

import 'package:tekartik_build_utils/webdev/webdev.dart';

Future main() async {
  final port = 8060;
  print('Serving `example` on http://localhost:$port');
  print('<http://localhost:$port/recaptcha/index.html>');
  print('<http://localhost:$port/recaptcha/v3/index.html>');
  await serve([
    'example:$port',
    //'--hot-reload',
    '--live-reload',
    //    '--hostname',
    //  '0.0.0.0'
  ]);
}
