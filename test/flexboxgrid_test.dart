@TestOn('browser')
library;

import 'package:tekartik_app_utils/flexboxgrid/loader.dart';
import 'package:test/test.dart';

void main() {
  group('flexboxgrid', () {
    test('loader', () async {
      await loadFlexBoxGridCss();
    });
  });
}
