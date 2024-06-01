import 'dart:html';

import 'package:tekartik_browser_utils/browser_utils_import.dart';

Splash splash = Splash();

class _NullTreeSanitizer implements NodeTreeSanitizer {
  @override
  void sanitizeTree(node) {}
}

NodeTreeSanitizer nullTreeSanitizer = _NullTreeSanitizer();

Element spinnerElement() {
  // ignore: unsafe_html
  final element = Element.html('''
  <div class="tka-spinner-svg-wrapper" width="65px" height="65px">
<svg class="tka-spinner-svg" width="65px" height="65px" viewBox="0 0 66 66" xmlns="http://www.w3.org/2000/svg">
  <circle class="tka-spinner-svg-path" fill="none" stroke-width="6" stroke-linecap="round" cx="33" cy="33" r="30"></circle>
  </svg>
  </div>
''', treeSanitizer: nullTreeSanitizer);
  return element;
}

class Splash {
  int? _minDisplayDuration = 100;
  final _minTransitionDuration = 350;

  Element? _splashElement;

  void _removeSplashElement([_]) {
    if (_splashElement != null) {
      _splashElement!.remove();
      _splashElement = null;
    }
  }

  late Stopwatch sw;

  Splash() {
    sw = Stopwatch()..start();
    init();
  }

  void init({int? msTimeout, int? minDisplayDuration}) {
    _minDisplayDuration = minDisplayDuration;
    // simple call for initialization
    if (_splashElement == null) {
      _splashElement = document.getElementById('tka_splash');
      if (_splashElement != null) {
        _splashElement!.children.add(spinnerElement());
        _splashElement!.on['transitionend'].listen(_removeSplashElement);
      }
    }
    if (msTimeout != null) {
      () async {
        await sleep(msTimeout);
        await hide();
      }();
    }
  }

  Future hide() async {
    if (_splashElement != null) {
      final elapsed = sw.elapsedMilliseconds;
      final delayMin = _minDisplayDuration ?? 0;
      if (elapsed < delayMin) {
        await sleep(delayMin - elapsed);
      }
      document.body!.classes.remove('tka-loading');
      await sleep(_minTransitionDuration); // transition delay
      _removeSplashElement();
    }
  }
}
