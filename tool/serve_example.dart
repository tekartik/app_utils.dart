import 'dart:async';
import 'dart:io';

import 'package:tekartik_build_utils/webdev/webdev.dart';

Future main() async {
  final port = 8060;
  stdout.writeln('Serving `example` on http://localhost:$port');
  stdout.writeln('<http://localhost:$port/recaptcha/index.html>');
  stdout.writeln('<http://localhost:$port/recaptcha/v3/index.html>');
  await serve([
    'example:$port',
    //'--hot-reload',
    '--live-reload',
    //    '--hostname',
    //  '0.0.0.0'
  ]);
}
