import 'package:flutter/material.dart';
import 'package:shop/models/cart_item.dart';

class ProductOrderItem extends StatelessWidget {
  final CartItem cartItem;
  const ProductOrderItem({
    super.key,
    required this.cartItem,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: FittedBox(child: Text('R\$ ${cartItem.price}')),
        ),
      ),
      title: Text(cartItem.name),
      subtitle: Text('R\$ ${cartItem.price * cartItem.quantity}'),
      trailing: Text('${cartItem.quantity}x'),
    );
  }
}
