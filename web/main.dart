// Copyright (c) 2016, Alexandre Roux Tekartik. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:tekartik_app_utils/app_host_target_web.dart';
import 'package:web/web.dart' as web;

final output = web.document.getElementById('output') as web.HTMLPreElement;

void message(String msg) {
  output.textContent = '${output.textContent}$msg\n';
}

void main() {
  message('''
$locationInfoWeb
${AppHostTarget.fromLocationInfo(locationInfoWeb)}
''');
  var list = web.document.querySelector('#links')!.querySelectorAll('a');
  for (var i = 0; i < list.length; i++) {
    var element = list.item(i) as web.HTMLAnchorElement;
    element.text = element.href;
  }
}
