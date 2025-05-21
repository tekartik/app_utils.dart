import 'dart:async';

import 'package:tekartik_browser_utils/css_utils.dart';

Future loadIronFlexLayoutCss() async {
  await loadStylesheet(
    'packages/tekartik_app_utils/iron_flex_layout/css/iron_flex_layout.css',
  );
}
