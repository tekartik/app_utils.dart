// Copyright (c) 2016, Alexandre Roux Tekartik. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package

import 'dart:html';
import 'package:tekartik_app_utils/app_host_target_browser.dart';

void main() {
  querySelector('#output')!.text =
      '''
$locationInfo
${AppHostTarget.fromLocationInfo(locationInfo)}
''';
  querySelector('#links')!.querySelectorAll('a').forEach((Element element) {
    (element as AnchorElement).text = element.href;
  });
}
