@TestOn('browser')
library;

import 'package:tekartik_app_utils/material_asset/loader.dart';
import 'package:test/test.dart';

void main() {
  group('material_asset', () {
    test('roboto-condensed', () async {
      await loadRobotoCondensedFontCss();
    });
    test('roboto-slab', () async {
      await loadRobotoSlabFontCss();
    });
    test('roboto', () async {
      await loadRobotoFontCss();
    });
    test('material_icons', () async {
      await loadMaterialIconCss();
    });
  });
}
