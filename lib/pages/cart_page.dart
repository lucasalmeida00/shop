import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/components/cart_grid.dart';
import 'package:shop/models/cart.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    final totalAmount = cart.totalAmount;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Carrinho'),
      ),
      body: Column(
        children: [
          const CartItemsGrid(),
          Card(
            margin: const EdgeInsets.all(25),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text('Total'),
                  const SizedBox(
                    width: 20,
                  ),
                  Chip(
                    // backgroundColor: Theme.of(context).primaryColor,
                    label: Text('R\$ $totalAmount'),
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () => {},
                    child: const Text('COMPRAR'),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
