import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:task1/core/errors/failure.dart';
import 'package:task1/core/utils/api_service.dart';
import 'package:task1/detales_page/data/models/poductmodel/poductmodel.dart';
import 'package:task1/detales_page/data/repos/ProductRepo.dart';

class ProductRepoImpl implements ProductRepo {
  final ApiService apiService;

  ProductRepoImpl(this.apiService);

  @override
  Future<Either<Failure, List<Poductmodel>>> fetchAllProducts() async {
    try {
      final data = await apiService.getProducts(); // جلب كل المنتجات
      final products =
          (data as List).map((e) => Poductmodel.fromJson(e)).toList();
      return right(products);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Poductmodel>>> fetchProductsByCategory({
    required String category,
  }) async {
    try {
      final data = await apiService.getProducts();
      final filtered =
          (data as List)
              .where((item) => item['category']['slug'] == category)
              .toList();
      final products = filtered.map((e) => Poductmodel.fromJson(e)).toList();
      return right(products);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Poductmodel>> fetchProductDetails({
    required int id,
  }) async {
    try {
      final data = await apiService.getProductById(id);
      final product = Poductmodel.fromJson(data);
      return right(product);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
