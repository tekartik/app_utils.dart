import 'app_firebase.dart';
import 'package:firebase/firebase.dart' as firebase;

firebase.App initializeApp(FirebaseOptions options, [String name]) {
  return firebase.initializeApp(
      apiKey: options.apiKey,
      authDomain: options.authDomain,
      databaseURL: options.databaseURL,
      storageBucket: options.storageBucket,
      name: name);
}