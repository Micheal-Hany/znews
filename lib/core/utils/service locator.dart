import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../features/home page/data/repos/home-repo-implemention.dart';
import 'api-service.dart';


final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<ApiService>(ApiService(Dio()));
  getIt.registerSingleton<HomeRepoImpl>(
      HomeRepoImpl(apiService: getIt.get<ApiService>()));
}
