library;

import 'package:test/test.dart';

// Use urlAddParam instead
String urlAddParam(String url, String param, dynamic value) {
  if (!url.contains('?')) {
    return '$url?$param=$value';
  } else {
    return '$url&$param=$value';
  }
}

String uriPath(String path) {
  final uri = Uri.parse(path);
  return uri.path;
}

String urlPath(String path) {
  final uri = Uri.parse(path);
  return uri.path;
}

// remove / prefix
String urlNonAbsolutePath(String path) {
  if (path.startsWith('/')) {
    return path.substring(1);
  }
  return path;
}

String urlChangeQueryParameters(
  String url,
  Map<String, String> newQueryParams,
) {
  final uri = Uri.parse(url);
  return uriChangeQueryParameters(uri, newQueryParams).toString();
}

Uri uriChangeQueryParameters(Uri uri, Map<String, String> newQueryParams) {
  return Uri(
    scheme: uri.scheme,
    userInfo: uri.userInfo,
    host: uri.host,
    port: uri.port,
    path: uri.path, //
    queryParameters: newQueryParams, //
    fragment: null,
  );
}

Uri uriNoParamNoFragment(Uri uri) {
  return Uri(
    scheme: uri.scheme,
    userInfo: uri.userInfo, //
    host: uri.host,
    port: uri.port, //
    path: uri.path,
  );
}

String urlNoParamNoFragment(String url) {
  return uriNoParamNoFragment(Uri.parse(url)).toString();
}

String urlRoot(String url) {
  return uriRoot(Uri.parse(url)).toString();
}

Uri uriRoot(Uri uri) {
  return Uri(
    scheme: uri.scheme,
    userInfo: uri.userInfo, //
    host: uri.host,
    port: uri.port,
  );
}

String urlHashFix(String hash) {
  if (hash.startsWith('#')) {
    hash = hash.substring(1);
  }
  return hash;
}

/// find the part hash or a url (without the #)
String? urlHash(String url) {
  final sharp = url.indexOf('#');
  if (sharp != -1) {
    return url.substring(sharp + 1);
  }
  return null;
}

void main() => defineTests();

void defineTests() {
  test('urlPath', () {
    //print(uriPath('.'));
    //print(uriPath('.'));
    expect(urlPath('file:///path/file?env'), equals('/path/file'));
  });

  test('urlRoot', () {
    expect(
      urlRoot('http://localhost:8080/gsitesw.html#alexcavaquinho'),
      'http://localhost:8080',
    );
  });
}
