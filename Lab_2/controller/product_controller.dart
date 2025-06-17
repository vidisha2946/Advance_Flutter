import '../utils/import_export.dart';
class ProductController{

  List<dynamic> productList = [
    CategoryModel(name: 'BAGS', imageUrl: 'assets/bags.png', price: 2999),
    CategoryModel(name: 'ELECTRONICS', imageUrl: 'assets/electronics.png', price: 1499),
    CategoryModel(name: 'KURTIS', imageUrl: 'assets/kurtis.png', price: 799),
    CategoryModel(name: 'FOOTWEAR', imageUrl: 'assets/footwear.png', price: 999),
    CategoryModel(name: 'BAGS', imageUrl: 'assets/bags.png', price: 2999),
    CategoryModel(name: 'ELECTRONICS', imageUrl: 'assets/electronics.png', price: 1499),
    CategoryModel(name: 'KURTIS', imageUrl: 'assets/kurtis.png', price: 799),
    CategoryModel(name: 'FOOTWEAR', imageUrl: 'assets/footwear.png', price: 999),
    CategoryModel(name: 'BAGS', imageUrl: 'assets/bags.png', price: 2999),
    CategoryModel(name: 'ELECTRONICS', imageUrl: 'assets/electronics.png', price: 1499),
    CategoryModel(name: 'KURTIS', imageUrl: 'assets/kurtis.png', price: 799),
    CategoryModel(name: 'FOOTWEAR', imageUrl: 'assets/footwear.png', price: 999),
    CategoryModel(name: 'BAGS', imageUrl: 'assets/bags.png', price: 2999),
    CategoryModel(name: 'ELECTRONICS', imageUrl: 'assets/electronics.png', price: 1499),
    CategoryModel(name: 'KURTIS', imageUrl: 'assets/kurtis.png', price: 799),
    CategoryModel(name: 'FOOTWEAR', imageUrl: 'assets/footwear.png', price: 999),
  ];

  List<dynamic> cartList = [];

  void addToProductList(String name , String image , double price){
    CategoryModel newProduct = CategoryModel(name:name,imageUrl: image, price:price);
    productList.add(newProduct);
  }
  void addToCart(int productIndex){
    if(productIndex >= 0 && productIndex < productList.length){
      cartList.add(productList[productIndex]);
    }
  }

  void removeFromCart(int cartIndex){
    if(cartIndex >= 0 && cartIndex < cartList.length){
      cartList.removeAt(cartIndex);
    }
  }

}
final ProductController productController = ProductController();