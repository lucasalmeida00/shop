// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/components/app_drawer.dart';
import 'package:shop/components/product_grid.dart';
import 'package:shop/models/cart.dart';
import 'package:shop/utils/routes.dart';

enum FilterOptions {
  Favorites,
  All,
}

class ProductsOverviewPage extends StatefulWidget {
  const ProductsOverviewPage({super.key});

  @override
  State<ProductsOverviewPage> createState() => _ProductsOverviewPageState();
}

class _ProductsOverviewPageState extends State<ProductsOverviewPage> {
  bool _showFavoriteOnly = false;

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('MyShop'),
        actions: [
          PopupMenuButton(
            icon: const Icon(Icons.more_vert),
            itemBuilder: (_) => [
              const PopupMenuItem(
                value: FilterOptions.Favorites,
                child: Text('Somente favoritos'),
              ),
              const PopupMenuItem(
                value: FilterOptions.All,
                child: Text('Mostrar todos'),
              ),
            ],
            onSelected: (FilterOptions selectedValue) {
              if (selectedValue == FilterOptions.Favorites) {
                setState(() {
                  _showFavoriteOnly = true;
                });
              } else {
                setState(() {
                  _showFavoriteOnly = false;
                });
              }
            },
          ),
          Badge(
            label: Text(cart.itemsCount.toString()),
            textStyle: const TextStyle(
              fontSize: 12,
            ),
            offset: const Offset(-3, 3),
            backgroundColor: Theme.of(context).hintColor,
            child: IconButton(
              onPressed: () => {
                Navigator.of(context).pushNamed(AppRoutes.CART),
              },
              icon: const Icon(Icons.shopping_cart),
            ),
          )
        ],
      ),
      body: ProductGrid(
        showFavoriteOnly: _showFavoriteOnly,
      ),
      drawer: const AppDrawer(),
    );
  }
}
