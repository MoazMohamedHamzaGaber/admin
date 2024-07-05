import 'package:flutter/material.dart';
import '../../manage/cubit/states.dart';
import 'custom_grid_view.dart';

Widget buildGridViewBasedOnState(AllProductsStates state) {
  if (state is AllProductsLoadingStates) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  } else if (state is AllProductsSuccessStates || state is SearchProductsSuccessStates) {
    final products = (state is AllProductsSuccessStates)
        ? state.products
        : (state as SearchProductsSuccessStates).products;

    if (products.isEmpty) {
      return Center(
        child: Text(
          state is AllProductsSuccessStates
              ? "No product has been added"
              : "No results found",
        ),
      );
    }

    // Display the CustomGridView with products
    return CustomGridView(products: products);
  } else if (state is AllProductsErrorStates) {
    // Display error message if an error state is reached
    return Center(
      child: Text(
        state.errMessage,
        style: const TextStyle(
          fontSize: 30,
        ),
      ),
    );
  }

  // Show a loading indicator as a default for any other state
  return const Center(child: CircularProgressIndicator());
}