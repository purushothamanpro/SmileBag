import 'package:flutter/material.dart';

import 'components/ProductDetails.dart';
import 'ShopHomePage.dart';

final GlobalKey<ShopHomePageState> firstWidgetGlobalKey =
    new GlobalKey<ShopHomePageState>();

class Product extends StatefulWidget {
  // final Function() notifyParent;
  // Product({Key key, @required this.notifyParent}) : super(key: key);

  @override
  _ProductState createState() => _ProductState();
}

class _ProductState extends State<Product> {
  var productList = [
    {
      "name": "potato",
      "picture": "Images/potato.png",
      "oldPrice": "40",
      "new_price": "30",
      "productMeasurement": "kg"
    },
    {
      "name": "Shapoo",
      "picture": "Images/shampoo.png",
      "oldPrice": "100",
      "new_price": "70",
      "productMeasurement": ""
    },
    {
      "name": "Cucumber",
      "picture": "Images/veg5.png",
      "oldPrice": "20",
      "new_price": "15",
      "productMeasurement": "kg"
    },
    {
      "name": "Tomato",
      "picture": "Images/veg4.png",
      "oldPrice": "30",
      "new_price": "20",
      "productMeasurement": "kg"
    }
  ];
  @override
  Widget build(BuildContext context) {
    // return Text("Product");
    return Container(
      child: GridView.builder(
          itemCount: productList.length,
          physics: NeverScrollableScrollPhysics(),
          // shrinkWrap: true,
          gridDelegate:
              new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemBuilder: (BuildContext contex, int index) {
            return SingleProduct(
              productName: productList[index]["name"],
              productImage: productList[index]["picture"],
              oldPrice: productList[index]["oldPrice"],
              productPrice: productList[index]["new_price"],
              productMeasurement: productList[index]["productMeasurement"],
            );
          }),
    );
  }
}

class SingleProduct extends StatelessWidget {
  final productName;
  final productImage;
  final oldPrice;
  final productPrice;
  final productMeasurement;

  SingleProduct(
      {this.productName,
      this.productImage,
      this.oldPrice,
      this.productPrice,
      this.productMeasurement});
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
          // tag: productName,
          child: Material(
        child: InkWell(
          onTap: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => ProductDetails(
                    productDetailName: productName,
                    productDetailImage: productImage,
                    productDetailOldPrice: oldPrice,
                    productDetailNewPrice: productPrice,
                  ))),
          child: GridTile(
              footer: Container(
                  // height: 40,
                  color: Colors.white70,
                  child: Row(
                    children: [
                      Padding(padding: EdgeInsets.all(1.0)),
                      Expanded(
                          child: Text(
                        productName,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 12),
                      )),
                      Expanded(
                          child: Row(
                        children: [
                          Text(
                            "\₹$oldPrice",
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                                decoration: TextDecoration.lineThrough),
                          ),
                          Text(
                            " \₹$productPrice",
                            style: TextStyle(
                                color: Colors.deepOrangeAccent,
                                fontSize: 12,
                                fontWeight: FontWeight.bold),
                          ),
                          productMeasurement == ""
                              ? Text("")
                              : Text(
                                  " \/$productMeasurement",
                                  style: TextStyle(fontSize: 12.0),
                                )
                        ],
                      )),
                      Expanded(
                          child: MaterialButton(
                              splashColor: Colors.green,
                              textColor: Colors.green,
                              child: Icon(
                                Icons.add,
                                size: 26.0,
                              ),
                              onPressed: () {
                                firstWidgetGlobalKey.currentState.counter = 1;
                              }))
                    ],
                  )),
              child: Image.asset(
                productImage,
                fit: BoxFit.cover,
              )),
        ),
      )),
    );
  }
}
