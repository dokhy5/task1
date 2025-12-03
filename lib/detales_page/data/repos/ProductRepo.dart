import 'package:dartz/dartz.dart';
import 'package:task1/core/errors/failure.dart';
import 'package:task1/detales_page/data/models/poductmodel/poductmodel.dart';

abstract class ProductRepo {
  Future<Either<Failure, List<Poductmodel>>> fetchAllProducts();

  Future<Either<Failure, List<Poductmodel>>> fetchProductsByCategory({
    required String category,
  });

  Future<Either<Failure, Poductmodel>> fetchProductDetails({required int id});
}
