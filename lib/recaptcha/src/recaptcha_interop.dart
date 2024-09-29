@JS()
library;

import 'package:js/js.dart';

@JS()
@anonymous
class GReCaptchaRenderParams {
  external String get sitekey;

  external Function get callback;

  external factory GReCaptchaRenderParams(
      {String? sitekey, Function? callback});
}

@JS()
@anonymous
class GReCaptchaExecuteParams {
  external String get action;

  external factory GReCaptchaExecuteParams({String? action});
}

@JS()
@anonymous
class GReCaptcha {
  external void render(String id, GReCaptchaRenderParams params);

  external void ready(Function readyFunction);

  external Object /* Promise */ execute(
      String? action, GReCaptchaExecuteParams params);
}

@JS('grecaptcha')
external GReCaptcha get grecaptcha;
