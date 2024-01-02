import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shop/components/product_order_item.dart';
import 'package:shop/models/order.dart';

class OrderWidget extends StatefulWidget {
  final Order order;
  const OrderWidget({super.key, required this.order});

  @override
  State<OrderWidget> createState() => _OrderWidgetState();
}

class _OrderWidgetState extends State<OrderWidget> {
  bool _expanded = false;

  handleToggleExpanded() {
    setState(() {
      _expanded = !_expanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          ListTile(
            title: Text('R\$ ${widget.order.total.toStringAsFixed(2)}'),
            subtitle:
                Text(DateFormat('dd/MM/yyyy hh:mm').format(widget.order.date)),
            trailing: IconButton(
              icon: Icon(!_expanded ? Icons.expand_more : Icons.expand_less),
              onPressed: () {
                handleToggleExpanded();
              },
            ),
          ),
          if (_expanded)
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 4,
              ),
              height: 400,
              child: ListView(
                children: widget.order.products.map((product) {
                  return ProductOrderItem(cartItem: product);
                }).toList(),
              ),
            )
        ],
      ),
    );
  }
}
