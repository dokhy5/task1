import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task1/core/errors/failure.dart';
import 'package:task1/detales_page/data/repos/ProductRepoImpl.dart';
import 'package:task1/detales_page/presentation/manger/detils_item/ProductState.dart';

class ProductCubit extends Cubit<ProductState> {
  final ProductRepoImpl repo;

  ProductCubit(this.repo) : super(ProductInitial());

  void fetchAllProducts() async {
    emit(ProductLoading());
    final result = await repo.fetchAllProducts();
    result.fold(
      (failure) => emit(ProductFailure(failure: failure)),
      (products) => emit(ProductSuccess(products: products)),
    );
  }

  void fetchProductDetails(int id) async {
    emit(ProductLoading());
    final result = await repo.fetchProductDetails(id: id);
    result.fold(
      (failure) => emit(ProductFailure(failure: failure)),
      (product) => emit(ProductDetailsSuccess(product: product)),
    );
  }
}
