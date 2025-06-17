import '../utils/import_export.dart';
import 'package:flutter/material.dart';

class CartItemsPage extends StatefulWidget {
  const CartItemsPage({super.key});
  @override
  State<CartItemsPage> createState() => _CartItemsPageState();
}

class _CartItemsPageState extends State<CartItemsPage> {
  TextEditingController searchController = TextEditingController();
  List<dynamic> displayedCart = [];

  @override
  void initState() {
    super.initState();
    displayedCart = List.from(productController.cartList);
  }

  void removeItem(int index) {
    setState(() {
      productController.cartList.remove(displayedCart[index]);
      displayedCart.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    final bool isEmpty = displayedCart.isEmpty;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text(
          "VidzzMart",
          style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,
            fontSize: 24, ),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.shopping_cart,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => ECommerceView()),
              );
            },
          ),
        ],
        centerTitle: true,
      ),
      body: SafeArea(
        child: isEmpty
            ? Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.shopping_cart_outlined,
                        size: 100, color: Colors.grey),
                    SizedBox(height: 24),
                    Text("Your cart is empty",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    SizedBox(height: 12),
                    Text("Start adding items to see them here.",
                        textAlign: TextAlign.center),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (_) => ECommerceView()),
                        );
                      },
                      child: Text("Go to Shop"),
                    ),
                  ],
                ),
              )
            : Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    TextField(
                      controller: searchController,
                      decoration: InputDecoration(
                        hintText: "Search cart items...",
                        prefixIcon: Icon(Icons.search),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                      ),
                      onChanged: (value) {
                        setState(() {
                          displayedCart = productController.cartList
                              .where((item) => item.name
                                  .toLowerCase()
                                  .contains(value.toLowerCase()))
                              .toList();
                        });
                      },
                    ),
                    SizedBox(height: 16),
                    Expanded(
                      child: displayedCart.isEmpty
                          ? Center(child: Text("No matching items"))
                          : ListView.builder(
                              itemCount: displayedCart.length,
                              itemBuilder: (context, index) {
                                final item = displayedCart[index];
                                return Card(
                                  margin: EdgeInsets.only(bottom: 12),
                                  child: ListTile(
                                    leading: Image.asset(item.imageUrl,
                                        width: 50, height: 50),
                                    title: Text(item.name),
                                    subtitle: Text("₹${item.price}"),
                                    trailing: IconButton(
                                      icon:
                                          Icon(Icons.delete, color: Colors.red),
                                      onPressed: () {
                                        showDialog(
                                          context: context,
                                          builder: (_) => AlertDialog(
                                            title: Text("Remove item"),
                                            content: Text(
                                                "Remove this item from cart?"),
                                            actions: [
                                              TextButton(
                                                child: Text("Cancel"),
                                                onPressed: () =>
                                                    Navigator.pop(context),
                                              ),
                                              TextButton(
                                                child: Text("Remove",
                                                    style: TextStyle(
                                                        color: Colors.red)),
                                                onPressed: () {
                                                  removeItem(index);
                                                  Navigator.pop(context);
                                                },
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                );
                              },
                            ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Checkout coming soon!")),
                        );
                      },
                      child: Text("Checkout"),
                    )
                  ],
                ),
              ),
      ),
    );
  }
}
