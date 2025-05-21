import 'dart:async';

import 'package:tekartik_browser_utils/css_utils.dart';
import 'package:tekartik_common_utils/async_utils.dart';

Future loadFlexBoxGridPlusCss() => _plusCssLoader.run();

StylesheetLoader _cssLoader = StylesheetLoader(
  'packages/tekartik_app_utils/flexboxgrid/flexboxgrid.min.css',
);

FutureOr loadFlexBoxGridCss() => _cssLoader.load();

StylesheetLoader _hideCssLoader = StylesheetLoader(
  'packages/tekartik_app_utils/flexboxgrid/flexboxgrid_hide.css',
);

FutureOr loadFlexBoxGridHideCss() => _hideCssLoader.load();

AsyncOnceRunner _plusCssLoader = AsyncOnceRunner(() async {
  await loadFlexBoxGridCss();
  await loadFlexBoxGridHideCss();
});
