import '../utils/import_export.dart';
import 'package:flutter/material.dart';

class ECommerceView extends StatefulWidget {
  const ECommerceView({super.key});

  @override
  State<ECommerceView> createState() => _ECommerceViewState();
}

class _ECommerceViewState extends State<ECommerceView> with TickerProviderStateMixin {
  late final TabController _tabController;
  TextEditingController searchController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  List<CategoryModel> filteredList = [];
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    filteredList = productController.productList.cast<CategoryModel>();
  }

  void filterSearch(String query) {
    final filtered = productController.productList.where((item) {
      final nameLower = (item.name ?? '').toLowerCase();
      final searchLower = query.toLowerCase();
      return nameLower.contains(searchLower);
    }).toList();

    setState(() {
      filteredList = filtered.cast<CategoryModel>();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "VidzzMart",
          style: TextStyle(
            color: Colors.deepPurple,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart, color: Colors.deepPurple),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => CartItemsPage()),
              );
            },
          ),
        ],
      ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              TextFormField(
                controller: searchController,
                onChanged: filterSearch,
                decoration: const InputDecoration(
                  hintText: "Search products...",
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 12),
              Expanded(
                child: GridView.builder(
                  itemCount: filteredList.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    mainAxisExtent: 280,
                  ),
                  itemBuilder: (context, index) {
                    final item = filteredList[index];
                    final isInCart = productController.cartList.contains(item);
                    return Card(
                      color: Colors.deepPurple.shade50,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Image.asset(
                              item.imageUrl,
                              width: double.infinity,
                              fit: BoxFit.contain,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              item.name ?? "",
                              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              "₹${item.price}",
                              style: const TextStyle(fontSize: 14, color: Colors.green),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: IconButton(
                              onPressed: isInCart
                                  ? null
                                  : () {
                                setState(() {
                                  productController.cartList.add(item);
                                });
                              },
                              icon: Icon(
                                isInCart ? Icons.check : Icons.add_shopping_cart,
                                color: isInCart ? Colors.grey : Colors.blue,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
