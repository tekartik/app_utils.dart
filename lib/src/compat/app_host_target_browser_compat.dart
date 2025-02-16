@Deprecated('Do not use')
library;

import 'dart:html';

import 'package:tekartik_app_utils/app_host_target.dart';

class BrowserLocationInfo implements LocationInfo {
  Location location;
  @override
  Map<String, String>? arguments;

  BrowserLocationInfo(this.location) {
    arguments = locationSearchGetArguments(location.search);
  }

  @override
  String get host => location.host;

  @override
  String? get path => location.pathname;

  @override
  String toString() {
    final map = <String, dynamic>{'host': host, 'path': path};
    if (arguments!.isNotEmpty) {
      map['arguments'] = arguments;
    }
    return map.toString();
  }
}

LocationInfo? _locationInfo;

LocationInfo get locationInfo =>
    _locationInfo ??
    () {
      _locationInfo = BrowserLocationInfo(window.location);
      return _locationInfo;
    }()!;
