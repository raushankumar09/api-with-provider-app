import 'package:api_with_provider/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      context.read<ProductProvider>().featchProducts();
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ProductProvider>();

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: const Text('Products', style: TextStyle(color: Colors.white)),
        ),
        backgroundColor: Colors.blue,
      ),

      body: provider.isLoading
          ? const Center(child: CircularProgressIndicator())
          : provider.errorMessage.isNotEmpty
          ? Center(child: Text(provider.errorMessage))
          : ListView.builder(
              itemCount: provider.products.length,

              itemBuilder: (context, index) {
                final product = provider.products[index];

                return Card(
                  margin: const EdgeInsets.all(10),

                  child: ListTile(
                    leading: Image.network(
                      product.image,
                      width: 60,
                      height: 60,
                    ),

                    title: Text(product.title),

                    subtitle: Text('\$${product.price}'),
                  ),
                );
              },
            ),
    );
  }
}
