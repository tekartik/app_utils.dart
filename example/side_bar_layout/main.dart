import 'package:tekartik_browser_utils/browser_utils_import.dart';
import 'package:tekartik_app_utils/side_bar_layout/loader.dart';
import 'package:tekartik_bootstrap/bootstrap_loader.dart';
import 'package:tekartik_app_utils/side_bar_layout/side_bar_layout.dart';

main() async {
  devPrint('hi');
  await loadBootstrap();
  await loadSideBarCss();
  SideBarLayout sideBarLayout = new SideBarLayout();
  querySelector("#menu-toggle").onClick.listen((e) {
    e.preventDefault();
    //querySelector("#wrapper").classes.toggle("toggled");
    sideBarLayout.toggle();
  });
  querySelector("#menu-show").onClick.listen((e) {
    e.preventDefault();
    //querySelector("#wrapper").classes.add("show");
    sideBarLayout.showMenu();
  });
  querySelector("#menu-reset").onClick.listen((e) {
    e.preventDefault();
    sideBarLayout.reset();
    //querySelector("#wrapper").classes.add("show");
  });
}