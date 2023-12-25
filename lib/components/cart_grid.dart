import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/components/cart_item.dart';
import 'package:shop/models/cart.dart';

class CartItemsGrid extends StatefulWidget {
  const CartItemsGrid({super.key});

  @override
  State<CartItemsGrid> createState() => _CartItemsGridState();
}

class _CartItemsGridState extends State<CartItemsGrid> {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);

    return Expanded(
      child: ListView.builder(
        itemCount: cart.itemsCount,
        itemBuilder: (ctx, i) => CartItemWidget(
          cartItem: cart.items.values.toList()[i],
        ),
      ),
    );
  }
}
