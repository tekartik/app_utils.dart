// bool isRecaptchaOn
// ignore_for_file: deprecated_member_use

import 'dart:async';
import 'dart:html';

import 'package:js/js.dart';
import 'package:tekartik_app_utils/recaptcha/src/recaptcha_interop.dart' as js;
import 'package:tekartik_browser_utils/js_loader_utils.dart';

typedef GReCaptchaValidateFunction = void Function(String? token);

class GReCaptchaRenderParams {
  final String? siteKey;
  final GReCaptchaValidateFunction? callback;

  GReCaptchaRenderParams({required this.siteKey, this.callback});

  @override
  String toString() {
    return toMap().toString();
  }

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{};
    map['siteKey'] = siteKey;
    return map;
  }
}

class GReCaptchaExecuteParams {
  final String? action;

  GReCaptchaExecuteParams({this.action});

  @override
  String toString() {
    return toMap().toString();
  }

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{};
    map['action'] = action;
    return map;
  }
}

class GReCaptcha {
  Future<void> get ready {
    var completer = Completer<void>();
    js.grecaptcha.ready(
      allowInterop(([_]) {
        completer.complete();
      }),
    );
    return completer.future;
  }

  Element createElement(String id) {
    // ignore: unsafe_html
    return Element.html('<div id="$id" class="g-recaptcha"></div>');
  }

  void render(String id, GReCaptchaRenderParams params) {
    var jsCallback = (params.callback != null)
        ? (allowInterop(([Object? token, Object? param1, Object? param2]) {
            params.callback!(token?.toString());
          }))
        : null;
    var jsParams = js.GReCaptchaRenderParams(
      sitekey: params.siteKey,
      callback: jsCallback,
    );
    js.grecaptcha.render(id, jsParams);
  }

  Future<String> execute(
    String? siteKey,
    GReCaptchaExecuteParams params,
  ) async {
    var jsParams = js.GReCaptchaExecuteParams(action: params.action);

    final token =
        await promiseToFuture<Object?>(js.grecaptcha.execute(siteKey, jsParams))
            as String;
    return token;
  }
}

final grecaptcha = GReCaptcha();

JavascriptScriptLoader _loader = JavascriptScriptLoader(
  'https://www.google.com/recaptcha/api.js',
);

Future grecaptchaLoadJs() async {
  await _loader.load();
}

const String _defaultWidgetId = 'recaptcha_widget';
const String _defaultContainerId = 'recaptcha_container';

/// Insert a captcha V2 item and wait for
/// return a token once validated
Future<String> grecaptchaWait({
  String? siteKey,
  String containerId = _defaultContainerId,
  String widgetId = _defaultWidgetId,
}) => grecaptchaV2Wait(
  siteKey: siteKey,
  containerId: containerId,
  widgetId: widgetId,
);

Future<String> grecaptchaV2Wait({
  String? siteKey,
  String containerId = _defaultContainerId,
  String widgetId = _defaultWidgetId,
}) async {
  // await loadJs();
  await grecaptcha.ready;
  var completer = Completer<String>();
  var element = grecaptcha.createElement(widgetId);
  querySelector('#$containerId')!.children.add(element);
  grecaptcha.render(
    widgetId,
    GReCaptchaRenderParams(
      siteKey: siteKey,
      callback: (token) {
        completer.complete(token);
      },
    ),
  );
  return completer.future;
}

/// return a token once validated
Future<String> grecaptchaV3Wait({String? siteKey, String? action}) async {
  // await loadJs();
  await grecaptcha.ready;
  return grecaptcha.execute(siteKey, GReCaptchaExecuteParams(action: action));
}
