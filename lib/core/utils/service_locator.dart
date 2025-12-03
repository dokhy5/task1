import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:task1/core/utils/api_service.dart';
import 'package:task1/detales_page/data/repos/ProductRepoImpl.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  // تسجيل ApiService مع Dio
  getIt.registerSingleton<ApiService>(ApiService(Dio()));

  // تسجيل Repository
  getIt.registerSingleton<ProductRepoImpl>(
    ProductRepoImpl(getIt.get<ApiService>()),
  );
}
