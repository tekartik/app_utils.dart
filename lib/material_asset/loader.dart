import 'dart:async';

import 'package:tekartik_browser_utils/css_utils.dart';

Future loadMaterialIconCss() async {
  await loadStylesheet(
    'packages/tekartik_material_asset/font/material-icons/material-icons.css',
  );
}

Future loadRobotoFontCss() async {
  await loadStylesheet(
    'packages/tekartik_material_asset/font/roboto/roboto-fonts.css',
  );
}

Future loadRobotoCondensedFontCss() async {
  await loadStylesheet(
    'packages/tekartik_material_asset/font/roboto-condensed/roboto-condensed-fonts.css',
  );
}

Future loadRobotoSlabFontCss() async {
  await loadStylesheet(
    'packages/tekartik_material_asset/font/roboto-slab/roboto-slab-fonts.css',
  );
}
