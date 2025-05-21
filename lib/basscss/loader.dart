import 'dart:async';

import 'package:tekartik_browser_utils/css_utils.dart';

StylesheetLoader _bassStylesheetLoader = StylesheetLoader(
  'packages/tekartik_app_utils/basscss/basscss.css',
);

FutureOr loadBassCss() => _bassStylesheetLoader.load();
