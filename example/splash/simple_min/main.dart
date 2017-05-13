// Copyright (c) 2016, Alexandre Roux Tekartik. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:tekartik_app_utils/splash/splash.dart';
import 'package:tekartik_common_utils/common_utils_import.dart';

main() async {

  splash.init(minDisplayDuration: 1000);
  devPrint('main');
  await splash.hide();
  devPrint('hidden');
}
