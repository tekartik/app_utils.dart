import 'dart:async';

import 'package:tekartik_app_utils/material_asset/loader.dart';
import 'package:web/web.dart' as web;

final output = web.document.getElementById('output') as web.HTMLPreElement;

void message(String msg) {
  output.textContent = '${output.textContent}$msg\n';
}

Future main() async {
  await Future.wait([
    () async {
      await loadRobotoSlabFontCss();
    }(),
    () async {
      await loadRobotoFontCss();
    }(),
    () async {
      await loadRobotoCondensedFontCss();
    }(),
  ]);
  message('hi');
}
