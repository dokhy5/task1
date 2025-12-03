import 'package:dartz/dartz.dart';
import 'package:task1/core/errors/failure.dart';
import 'package:task1/detales_page/data/models/poductmodel/poductmodel.dart';

abstract class ProductRepo {
  /// جلب كل المنتجات
  Future<Either<Failure, List<Poductmodel>>> fetchAllProducts();

  /// جلب المنتجات حسب الفئة
  Future<Either<Failure, List<Poductmodel>>> fetchProductsByCategory({
    required String category,
  });

  /// جلب تفاصيل منتج محدد
  Future<Either<Failure, Poductmodel>> fetchProductDetails({required int id});
}
