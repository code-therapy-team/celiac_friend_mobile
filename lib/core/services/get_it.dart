import 'package:celus_fe/core/api/dio_consumer.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;
Future<void> initializationGetIt() async {
  _initCoreDependencies();
  _initFeaturesDependencies();
}

void _initCoreDependencies() {
  getIt.registerLazySingleton<Dio>(() => Dio());
  getIt.registerLazySingleton<DioConsumer>(() => DioConsumer(dio: getIt<Dio>()));
}

void _initFeaturesDependencies() {}
