import 'package:tekartik_app_utils/app_host_target.dart';
import 'package:web/web.dart' as web;

class LocationInfoWeb implements LocationInfo {
  web.Location location;
  @override
  Map<String, String>? arguments;

  LocationInfoWeb(this.location) {
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

LocationInfo get locationInfoWeb =>
    _locationInfo ??
    () {
      _locationInfo = LocationInfoWeb(web.window.location);
      return _locationInfo;
    }()!;
