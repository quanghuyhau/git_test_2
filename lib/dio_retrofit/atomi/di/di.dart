import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:learn_flutter/dio_retrofit/atomi/di/di.config.dart';

final getIt = GetIt.instance;

@InjectableInit()
Future<void> configureDependencies() async{
  await getIt.init();
}
