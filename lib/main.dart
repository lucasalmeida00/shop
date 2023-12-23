import 'package:flutter/material.dart';
import 'package:shop/pages/product_detail.page.dart';
import 'package:shop/pages/products_overview_page.dart';
import 'package:shop/utils/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shop',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        hintColor: Colors.deepOrange,
        fontFamily: 'Lato',
      ),
      home: ProductsOverviewPage(),
      debugShowCheckedModeBanner: false,
      routes: {
        AppRoutes.PRODUCTS_LIST: (ctx) => ProductsOverviewPage(),
        AppRoutes.PRODUCT_DETAIL: (ctx) => const ProductDetailPage(),
      },
    );
  }
}
