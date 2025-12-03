import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:task1/core/utils/service_locator.dart';
import 'package:task1/detales_page/data/repos/ProductRepoImpl.dart';
import 'package:task1/detales_page/presentation/manger/detils_item/ProductCubit.dart';
import 'package:task1/detales_page/presentation/views/Detils_Page_Viwe.dart';

void main() {
  setupServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ProductCubit>(
          create:
              (_) =>
                  ProductCubit(getIt.get<ProductRepoImpl>())
                    ..fetchAllProducts(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const DetilsPageViwe(productId: 1), // مثال على ID صحيح
      ),
    );
  }
}
