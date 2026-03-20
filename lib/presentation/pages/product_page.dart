import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:product_app/presentation/viewmodel/product_viewmodel.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});
  
  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<ProductViewModel>();
    final state = viewModel.state;

    return Scaffold(
      appBar: AppBar(title: const Text("Products")),
      body: Builder(
        builder: (context) {
          if (state.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        
          if (state.error != null) {
            return Center(
              child: Text(state.error!),
            );
          }
          
          if (state.products.isEmpty) {
            return const Center(
              child: Text("No products loaded."),
            );
          }

          return ListView.builder(
            itemCount: state.products.length,
            itemBuilder: (context, index) {
              final product = state.products[index];
              return ListTile(
                leading: Image.network(
                  product.image,
                  width: 50,
                  height: 50,
                  errorBuilder: (context, error, stackTrace) => const Icon(Icons.error),
                ),
                title: Text(product.title),
                subtitle: Text("\$${product.price}"),
                trailing: IconButton(
                  icon: Icon(
                    product.isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: product.isFavorite ? Colors.red : null,
                  ),
                  onPressed: () {
                    viewModel.toggleFavorite(product.id);
                  },
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: viewModel.loadProducts,
        child: const Icon(Icons.download),
      ),
    );
  }
}