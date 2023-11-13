import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/cart.dart';

class cart_item extends StatelessWidget {
  final String title;
  final String id;
  final int quantity;
  final double price;
  cart_item(
      {required this.id,
      required this.price,
      required this.quantity,
      required this.title});

  @override
  Widget build(BuildContext context) {
    final cart_pv = Provider.of<cart>(context);
    return Dismissible(
      key: ValueKey(id),
      background: Container(
        color: Colors.red,
        child: Icon(
          Icons.delete,
          color: Colors.white,
        ),
        alignment: Alignment.centerRight,
      ),
      child: Card(
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: ListTile(
            leading: CircleAvatar(
              child: Text('$price'),
              radius: 30,
            ),
            title: Text('$title'),
            subtitle: Text('$quantity X'),
            trailing: Text('\$${price * quantity}'),
          ),
        ),
      ),
      direction: DismissDirection.endToStart,
      onDismissed: (_) {
        cart_pv.remove_list(id);
      },
    );
  }
}
