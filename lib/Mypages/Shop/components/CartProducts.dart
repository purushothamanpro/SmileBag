import 'package:flutter/material.dart';

class CartProducts extends StatefulWidget {
  @override
  _CartProductsState createState() => _CartProductsState();
}

class _CartProductsState extends State<CartProducts> {
  var cartProductList = [
    {
      "name": "potato",
      "picture": "Images/potato.png",
      "new_price": "30",
      "productMeasurement": "kg",
      "quantity": "1"
    },
    {
      "name": "Shapoo",
      "picture": "Images/shampoo.png",
      "new_price": "70",
      "productMeasurement": "",
      "quantity": "1"
    },
    {
      "name": "Shapoo",
      "picture": "Images/shampoo.png",
      "new_price": "70",
      "productMeasurement": "",
      "quantity": "1"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 3,
        itemBuilder: (context, index) {
          return SingleCartProduct(
            productImage: cartProductList[index]["picture"],
            productName: cartProductList[index]["name"],
            productPrice: cartProductList[index]["new_price"],
            productMeasurement: cartProductList[index]["productMeasurement"],
            productQuantity: cartProductList[index]["quantity"],
          );
          // return Text("hfjs");
        });
  }
}

class SingleCartProduct extends StatelessWidget {
  final productName;
  final productImage;
  final productPrice;
  final productMeasurement;
  final productQuantity;

  SingleCartProduct(
      {this.productName,
      this.productImage,
      this.productPrice,
      this.productQuantity,
      this.productMeasurement});
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.asset(
          productImage,
          height: 100.0,
          width: 100.0,
        ),
        title: Text(productName),
        subtitle: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("Quantity"),
                ),
                Padding(
                  padding: EdgeInsets.all(0.0),
                  child: Text("\ $productQuantity"),
                ),
                productMeasurement == ""
                    ? Text("")
                    : Text(
                        " \/$productMeasurement",
                        style: TextStyle(fontSize: 12.0),
                      ),
              ],
            ),
            Container(
              alignment: Alignment.topLeft,
              child: Text(
                "\₹$productPrice",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17.0,
                    color: Colors.deepOrangeAccent),
              ),
            )
          ],
        ),
      ),
    );
  }
}
