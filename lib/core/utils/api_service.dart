import 'package:dio/dio.dart';

class ApiService {
  final Dio dio;

  ApiService(this.dio) {
    dio.options.baseUrl = "https://task-two-plum-44.vercel.app/api/products/";
    dio.options.connectTimeout = const Duration(seconds: 5);
    dio.options.receiveTimeout = const Duration(seconds: 5);
  }

  /// جلب منتج محدد برقم 6 فقط
  Future<Map<String, dynamic>> getProduct6() async {
    try {
      final response = await dio.get("6");
      if (response.statusCode == 200) {
        final data = response.data;
        if (data is Map<String, dynamic>) {
          return data;
        } else if (data['data'] is Map<String, dynamic>) {
          return data['data'];
        } else {
          throw DioException(
            requestOptions: response.requestOptions,
            response: response,
            error: "صيغة البيانات غير متوقعة",
            type: DioExceptionType.badResponse,
          );
        }
      } else if (response.statusCode == 404) {
        throw DioException(
          requestOptions: response.requestOptions,
          response: response,
          error: "المنتج غير موجود",
          type: DioExceptionType.badResponse,
        );
      } else {
        throw DioException(
          requestOptions: response.requestOptions,
          response: response,
          error: 'خطأ في جلب المنتج: ${response.statusCode}',
          type: DioExceptionType.badResponse,
        );
      }
    } catch (e) {
      rethrow;
    }
  }
}
