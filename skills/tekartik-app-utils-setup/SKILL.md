---
name: tekartik-app-utils-setup
description: >-
  Use when a plain Dart web app needs to know which environment it is served
  from or needs the legacy tekartik css assets, with tekartik_app_utils:
  AppHostTarget (local/dev/staging/prod, fromLocationInfo, fromHost, fromPath,
  fromArguments, fromTargetName), LocationInfo, locationInfoWeb,
  MockLocationInfo, locationSearchGetArguments, the css loaders
  loadCssAppResetCss, loadBassCss, loadFlexBoxGridCss, loadIronFlexLayoutCss,
  loadSideBarCss, loadMaterialIconCss, loadRobotoFontCss, the PreOutput
  pre_output_interop helper and csv escapeString - and to know which of its
  libraries are deprecated dart:html leftovers.
---

# Web app helpers (tekartik_app_utils)

`tekartik_app_utils` is an old grab bag of plain-Dart (webdev, not Flutter) web
app helpers. Only a small part of it is still alive: `AppHostTarget`, which
derives the environment (`local` / `dev` / `staging` / `prod`) from the browser
location, the css asset loaders, and the `PreOutput` console-in-a-page helper.
Its README states the package is "to deprecate": use it for existing apps, do
not build new features on the deprecated libraries listed below.

## Guidelines

* Git dependency (not on pub.dev), single package at the repo root, so no
  `path:`:
  ```yaml
  dependencies:
    tekartik_app_utils:
      git:
        url: https://github.com/tekartik/app_utils.dart
      version: '>=0.1.0'
  ```
  It pulls `tekartik_browser_utils`, `tekartik_common_utils`,
  `tekartik_platform_browser` and `package:web`. The css asset paths assume the
  app is compiled by `build_runner` / `webdev`, which serve package assets
  under `packages/<package>/...`.
* Host target: `package:tekartik_app_utils/app_host_target_web.dart` is the
  import for web code. It re-exports `app_host_target.dart` and adds
  `locationInfoWeb`, a `LocationInfo` built from `web.window.location` (it
  throws `UnsupportedError` when compiled off the web, so guard it with
  `kDartIsWeb` from `package:tekartik_common_utils/env_utils.dart` in shared
  code). For non-web code (tests, logic) import `app_host_target.dart` alone.
* `AppHostTarget` is a `StringEnum`: the constants are `AppHostTarget.local`,
  `.dev`, `.staging`, `.prod`, all of them in `AppHostTarget.all`, compared by
  value (`==`) and printed with `.name`.
  - `AppHostTarget.fromLocationInfo(locationInfo)` is the one to call: it looks
    at the query arguments first (`?dev`, `?staging`...), then the host, then
    the path.
  - `fromHost(host)` matches `localhost` -> `local`, `-dev.` -> `dev`,
    `-staging.` -> `staging`; `fromPath(path)` matches `-dev/` and `-staging/`.
    Neither ever returns `prod`.
  - `fromArguments(map)` returns the target whose name is a key of the query
    arguments; `fromTargetName('dev')` parses a name.
  - Every one of them returns `null` when nothing matches: default to
    `AppHostTarget.prod` yourself (`?? AppHostTarget.prod`).
* `LocationInfo` is an interface (`host`, `path`, `arguments`). Implement it -
  or use `MockLocationInfo` from
  `package:tekartik_app_utils/app_host_target_mock.dart`, whose three fields are
  mutable - to unit test the target resolution on the vm.
  `locationSearchGetArguments(window.location.search)` parses a query string
  (with or without the leading `?`) into a `Map<String, String>`.
* Css loaders, each an idempotent `Future` that injects a `<link>` (through
  `tekartik_browser_utils`), to `await` before showing the UI:
  `css_app_reset/loader.dart` -> `loadCssAppResetCss()`;
  `basscss/loader.dart` -> `loadBassCss()`;
  `flexboxgrid/loader.dart` -> `loadFlexBoxGridCss()`,
  `loadFlexBoxGridHideCss()`, `loadFlexBoxGridPlusCss()` (both at once);
  `iron_flex_layout/loader.dart` -> `loadIronFlexLayoutCss()`;
  `side_bar_layout/loader.dart` -> `loadSideBarCss()`.
* `material_asset/loader.dart` (`loadMaterialIconCss()`, `loadRobotoFontCss()`,
  `loadRobotoCondensedFontCss()`, `loadRobotoSlabFontCss()`) loads assets from
  `packages/tekartik_material_asset/...`: add the `tekartik_material_asset`
  git dependency (`url: https://github.com/tekartik/material_asset.dart`) to
  the app or the fonts 404.
* `package:tekartik_app_utils/preoutput/pre_output_interop.dart` is the
  `package:web` version of `PreOutput`: `PreOutput(id: 'output')` (a leading
  `#` is accepted) or `PreOutput(preElement: ...)` with `write`, `writeln` and
  `clear` on a `<pre>` element. Its `preoutput/pre_output.dart` sibling is the
  deprecated `dart:html` one.
* `package:tekartik_app_utils/csv/csv_utils.dart` exposes a single
  `escapeString(text)` that quotes a csv field when it contains `"`, `,`, CR or
  LF (and doubles the quotes). Import it with a prefix, the name is generic.
* Deprecated, `dart:html`-based, do not use in new code (they are kept only for
  old apps): `splash/splash.dart` (use the `tekartik_web_splash` package
  instead), `recaptcha/recaptcha.dart`,
  `side_bar_layout/side_bar_layout.dart`, `preoutput/pre_output.dart`,
  `json/json_pack.dart` (use `package:tekartik_common_utils/pack/pack.dart`)
  and `app_host_target_browser.dart` (use `app_host_target_web.dart`).
* Tests: `dart_test.yaml` declares `vm` and `chrome` with the `dart2js`
  compiler. Pure logic tests (`AppHostTarget` + `MockLocationInfo`, `csv`) run
  on the vm; anything touching the css loaders or `locationInfoWeb` needs
  `@TestOn('browser')`.

## Examples

### Picking the environment in a web app

```dart
import 'package:tekartik_app_utils/app_host_target_web.dart';

/// Defaults to prod: fromHost/fromPath never return prod.
final appTarget = AppHostTarget.fromLocationInfo(locationInfoWeb) ??
    AppHostTarget.prod;

String get apiUrl => switch (appTarget.name) {
  'local' => 'http://localhost:8080/api',
  'dev' => 'https://api-dev.example.com',
  'staging' => 'https://api-staging.example.com',
  _ => 'https://api.example.com',
};
```

### Unit testing the target resolution on the vm

```dart
import 'package:tekartik_app_utils/app_host_target_mock.dart';
import 'package:test/test.dart';

void main() {
  test('target from location', () {
    var location = MockLocationInfo()
      ..host = 'my-app-staging.example.com'
      ..path = '/index.html'
      ..arguments = {};
    expect(AppHostTarget.fromLocationInfo(location), AppHostTarget.staging);

    location.arguments = {'dev': null};
    expect(AppHostTarget.fromLocationInfo(location), AppHostTarget.dev);
    expect(AppHostTarget.fromTargetName('dummy'), isNull);
  });
}
```

### Parsing a query string without the browser

```dart
import 'package:tekartik_app_utils/app_host_target.dart';

AppHostTarget targetFromSearch(String search) {
  var arguments = locationSearchGetArguments(search); // '?dev&x=1' ok
  return AppHostTarget.fromArguments(arguments) ?? AppHostTarget.prod;
}
```

### Loading the css assets before showing the app

```dart
import 'package:tekartik_app_utils/css_app_reset/loader.dart';
import 'package:tekartik_app_utils/flexboxgrid/loader.dart';
import 'package:tekartik_app_utils/material_asset/loader.dart';

Future<void> main() async {
  await Future.wait([
    loadCssAppResetCss(),
    loadFlexBoxGridPlusCss(), // flexboxgrid + its hide helpers
    loadRobotoFontCss(),
    loadMaterialIconCss(),
  ]);
}
```

### Writing to a pre element and escaping csv

```dart
import 'package:tekartik_app_utils/csv/csv_utils.dart' as csv;
import 'package:tekartik_app_utils/preoutput/pre_output_interop.dart';

void dumpCsv(List<List<String>> rows) {
  var output = PreOutput(id: 'output'); // <pre id="output"></pre>
  output.clear();
  for (var row in rows) {
    output.writeln(row.map(csv.escapeString).join(','));
  }
}
```

## Common mistakes

* Expecting `fromHost`/`fromPath` to return `AppHostTarget.prod`: they return
  `null`, prod is the fallback you write.
* Touching `locationInfoWeb` from vm/test code: it throws `UnsupportedError`
  off the web.
* Importing `app_host_target_browser.dart`, `splash/splash.dart` or
  `preoutput/pre_output.dart`: `dart:html` compat libraries, all deprecated.
* Loading the material assets without the `tekartik_material_asset`
  dependency, or serving the app outside `webdev`/`build_runner` (the
  `packages/...` css urls then do not resolve).
