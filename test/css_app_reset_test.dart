@TestOn('browser')
library;

import 'package:tekartik_app_utils/css_app_reset/loader.dart';
import 'package:test/test.dart';

void main() {
  group('css_reset', () {
    test('loader', () async {
      await loadCssAppResetCss();
    });
  });
}
