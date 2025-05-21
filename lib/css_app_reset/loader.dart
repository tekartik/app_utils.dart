import 'dart:async';

import 'package:tekartik_browser_utils/css_utils.dart';

Future loadCssAppResetCss() async {
  await loadStylesheet(
    'packages/tekartik_app_utils/css_app_reset/css_app_reset.css',
  );
}
