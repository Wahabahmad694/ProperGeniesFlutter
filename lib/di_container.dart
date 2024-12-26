import 'package:ProperGenies/utils/api_end_points.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'data/datasource/remote/dio/dio_client.dart';
import 'data/datasource/remote/dio/logging_interceptor.dart';
import 'data/repo/common_repo.dart';
import 'data/repo/main_repo.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // core
  // sl.registerLazySingleton(() => NetworkInfo(sl()));
  sl.registerLazySingleton(() => DioClient(ApiEndPoints.CUSTOMER_BASE_URL, sl(),
      loggingInterceptor: sl(), sharedPreferences: sl()));

  // Repository
  sl.registerLazySingleton(() => MainRepo(dioClient: sl(), sharedPreferences: sl()));
  sl.registerLazySingleton(() => CommonRepo(dioClient: sl(), sharedPreferences: sl()));


  // External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton(() => LoggingInterceptor());
  // sl.registerLazySingleton(() => Connectivity());
}
