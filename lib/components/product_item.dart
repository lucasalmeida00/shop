import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/models/cart.dart';
import 'package:shop/models/cart_item.dart';
import 'package:shop/models/product.dart';
import 'package:shop/utils/routes.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key});

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context);
    final cart = Provider.of<Cart>(context);

    handleAddToCart(Product product) {
      final isProductInCart = cart.isProductInCart(product.id);
      final cartItem = CartItem(
        id: DateTime.now().toString(),
        productId: product.id,
        name: product.title,
        quantity: 1,
        price: product.price,
      );

      isProductInCart ? cart.removeItem(product.id) : cart.addItem(cartItem);

      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(!isProductInCart
              ? 'Produto adicionado com sucesso!'
              : 'Produto removido com sucesso!'),
          duration: const Duration(seconds: 2),
          action: SnackBarAction(
            label: 'DESFAZER',
            onPressed: () {
              isProductInCart
                  ? cart.addItem(cartItem)
                  : cart.removeItem(product.id);
            },
          ),
        ),
      );
    }

    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          leading: IconButton(
            onPressed: () {
              product.toggleFavorite();
            },
            icon: Icon(
                product.isFavorite ? Icons.favorite : Icons.favorite_border),
            color: Theme.of(context).hintColor,
          ),
          title: Text(
            product.title,
            textAlign: TextAlign.center,
          ),
          trailing: IconButton(
            onPressed: () => handleAddToCart(product),
            icon: Icon(cart.isProductInCart(product.id)
                ? Icons.shopping_cart
                : Icons.shopping_cart_outlined),
            color: Theme.of(context).hintColor,
          ),
        ),
        child: GestureDetector(
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
          ),
          onTap: () {
            Navigator.of(context)
                .pushNamed(AppRoutes.PRODUCT_DETAIL, arguments: product);
          },
        ),
      ),
    );
  }
}
