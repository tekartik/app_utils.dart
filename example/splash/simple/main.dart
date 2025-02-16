// Copyright (c) 2016, Alexandre Roux Tekartik. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

// ignore_for_file: deprecated_member_use_from_same_package

import 'dart:async';

import 'package:tekartik_app_utils/splash/splash.dart';

Future main() async {
  //await sleep(1500);

  splash.init();
  //devPrint("main");
  await splash.hide();
}
