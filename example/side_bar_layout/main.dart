// ignore_for_file: deprecated_member_use_from_same_package

import 'package:tekartik_app_utils/side_bar_layout/loader.dart';
import 'package:tekartik_app_utils/side_bar_layout/side_bar_layout.dart';
import 'package:tekartik_bootstrap/bootstrap_loader.dart';
import 'package:tekartik_common_utils/common_utils_import.dart';
import 'package:web/web.dart' as web;

Future main() async {
  //devPrint('hi');
  await loadBootstrap();
  await loadSideBarCss();
  final sideBarLayout = SideBarLayout();
  web.document.querySelector('#menu-toggle')!.onClick.listen((e) {
    e.preventDefault();
    //querySelector('#wrapper').classes.toggle('toggled');
    sideBarLayout.toggle();
  });
  web.document.querySelector('#menu-show')!.onClick.listen((e) {
    e.preventDefault();
    //querySelector('#wrapper').classes.add('show');
    sideBarLayout.showMenu();
  });
  web.document.querySelector('#menu-reset')!.onClick.listen((e) {
    e.preventDefault();
    sideBarLayout.reset();
    //querySelector('#wrapper').classes.add('show');
  });
}
