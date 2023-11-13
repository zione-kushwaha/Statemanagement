import 'package:core_statemanagement/widget/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/cart.dart';

class CartScreen extends StatelessWidget {
  static const RouteName = '/cart_screen';

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<cart>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Your Cart'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Card(
            margin: const EdgeInsets.all(8),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Total : '),
                      Chip(
                          label: Text(
                              cartProvider.total_amount.toStringAsFixed(1))),
                      ElevatedButton(
                        onPressed: () {
                          // Logic for the order placement
                        },
                        child: Text('Order Now'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: cartProvider.list.length,
              itemBuilder: (ctx, index) {
                return cart_item(
                  id: cartProvider.list.values.toList()[index].id,
                  price: cartProvider.list.values.toList()[index].price,
                  quantity: cartProvider.list.values.toList()[index].quantity,
                  title: cartProvider.list.values.toList()[index].title,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
