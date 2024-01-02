import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/components/product_order_item.dart';
import 'package:shop/models/cart.dart';
import 'package:shop/models/cart_item.dart';

class CartItemWidget extends StatelessWidget {
  final CartItem cartItem;
  const CartItemWidget({super.key, required this.cartItem});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);

    return Dismissible(
      key: ValueKey(cartItem.id),
      direction: DismissDirection.endToStart,
      onDismissed: (_) => {
        cart.removeItem(cartItem.productId),
      },
      background: Container(
        color: Theme.of(context).hintColor,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
        child: const Icon(
          Icons.delete,
          color: Colors.white,
          size: 40,
        ),
      ),
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
        child: ProductOrderItem(
          cartItem: cartItem,
        ),
      ),
    );
  }
}
