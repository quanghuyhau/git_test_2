import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

@module
abstract class InjectionModule {
  @singleton
  FirebaseAuth get firebaseAuth => FirebaseAuth.instance;

  @lazySingleton
  Logger get logger => Logger();

}
