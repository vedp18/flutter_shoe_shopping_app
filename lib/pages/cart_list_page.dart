import 'package:flutter/material.dart';
import 'package:flutter_shopping_app/Providers/cart_provider.dart';
import 'package:provider/provider.dart';

class CartListPage extends StatelessWidget {
  const CartListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context).productCart;
    return Scaffold(
        // appBar: title('Cart')
        appBar: AppBar(
          title: Center(
            child: Text(
              'Cart',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
        ),
        body: ListView.builder(
          itemCount: cart.length,
          itemBuilder: (context, index) {
            final cartItem = cart[index];

            return ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(cartItem['imageUrl'] as String),
                radius: 27,
              ),
              title: Text(
                cartItem['title'] as String,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              subtitle: Text('Size: ${cartItem['size'].toString()}'),
              trailing: IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text(
                          "Remove Product",
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        content: const Text(
                          "Are you sure you want to remove the product from the cart?",
                        ),
                        actions: [
                          // TextButton: YES
                          TextButton(
                            onPressed: () {
                              // removing from productCart[]
                              Provider.of<CartProvider>(context, listen: false)
                                  .removeProduct(cartItem);

                              // comming back to cart_list screen 
                              Navigator.of(context).pop();
                            },
                            child: Text(
                              "YES",
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.blue,
                              ),
                            ),
                          ),

                          // TextButton: NO
                          TextButton(
                            onPressed: () {
                              // comming back to cart_list screen 
                              Navigator.of(context).pop();
                            },
                            child: const Text(
                              "NO",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.red,
                              ),
                            ),
                          )
                        ],
                      );
                    },
                  );
                },
                icon: Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
              ),
            );
          },
        ));
  }
}
