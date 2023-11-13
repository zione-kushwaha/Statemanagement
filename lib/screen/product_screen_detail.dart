import 'package:core_statemanagement/provider/products.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class product_detail_screen extends StatelessWidget {
  product_detail_screen({super.key});
  static const router_name = '/product_detail';

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context)?.settings.arguments as String?;
    final prouctd = Provider.of<products>(context, listen: false)
        .findbyid(productId.toString());

    return Scaffold(
      appBar: AppBar(
        title: Text(prouctd.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(300)),
              height: 400,
              width: double.infinity,
              child: Image.network(
                prouctd.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Text('price: \$${prouctd.price}'),
            Text(
              '${prouctd.description}',
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
