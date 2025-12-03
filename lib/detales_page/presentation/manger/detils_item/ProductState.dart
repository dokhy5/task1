import 'package:task1/core/errors/failure.dart';
import 'package:task1/detales_page/data/models/poductmodel/poductmodel.dart';

abstract class ProductState {}

class ProductInitial extends ProductState {}

class ProductLoading extends ProductState {}

class ProductSuccess extends ProductState {
  final List<Poductmodel> products;
  ProductSuccess({required this.products});
}

class ProductDetailsSuccess extends ProductState {
  final Poductmodel product;
  ProductDetailsSuccess({required this.product});
}

class ProductFailure extends ProductState {
  final Failure failure;
  ProductFailure({required this.failure});
}
