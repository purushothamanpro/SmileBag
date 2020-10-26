import 'package:flutter/material.dart';

class ProductDetails extends StatefulWidget {
  final productDetailName;
  final productDetailImage;
  final productDetailOldPrice;
  final productDetailNewPrice;

  ProductDetails(
      {this.productDetailName,
      this.productDetailImage,
      this.productDetailOldPrice,
      this.productDetailNewPrice});
  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.1,
        backgroundColor: Color(0xff6CBE45),
        title: Center(
          child: Row(
            children: [
              Text(
                "Smile",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w800),
              ),
              Text(
                "Bag",
                style: TextStyle(
                    color: Colors.deepOrangeAccent,
                    fontWeight: FontWeight.w900),
              )
            ],
          ),
        ),
        actions: [
          IconButton(
              icon: Icon(
                Icons.notifications,
                color: Colors.white,
              ),
              onPressed: null)
        ],
      ),
      body: ListView(
        children: [
          Container(
            height: 300.0,
            child: GridTile(
              child: Container(
                color: Colors.white,
                child: Image.asset(widget.productDetailImage),
              ),
              footer: Container(
                color: Colors.white70,
                alignment: Alignment.center,
                child: ListTile(
                  leading: Text(
                    widget.productDetailName,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
                  ),
                  title: Center(
                    child: new Row(
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,

                      children: [
                        Padding(padding: EdgeInsets.only(left: 10.0)),
                        Expanded(
                            child: Text(
                          "\₹${widget.productDetailOldPrice}",
                          style: TextStyle(
                              color: Colors.grey,
                              decoration: TextDecoration.lineThrough),
                        )),
                        Expanded(
                            child: Text(
                          "\₹${widget.productDetailNewPrice}",
                          style: TextStyle(
                              color: Colors.deepOrangeAccent,
                              fontWeight: FontWeight.bold),
                        )),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                  child: MaterialButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return new AlertDialog(
                          title: Text("Quantity"),
                          content: Text("Choose the Quantity"),
                          actions: [
                            MaterialButton(
                              onPressed: () {
                                Navigator.of(context).pop(context);
                              },
                              child: Text(
                                "Close",
                                style:
                                    TextStyle(color: Colors.deepOrangeAccent),
                              ),
                            )
                          ],
                        );
                      });
                },
                color: Colors.white,
                textColor: Colors.grey,
                elevation: 0.2,
                child: Row(
                  children: [
                    Expanded(child: new Text("Qty")),
                    Expanded(child: new Icon(Icons.arrow_drop_down))
                  ],
                ),
              ))
            ],
          ),
          Row(
            children: [
              Expanded(
                child: MaterialButton(
                  onPressed: () {},
                  color: Colors.green,
                  textColor: Colors.white,
                  elevation: 0.2,
                  child: Text("Buy now"),
                ),
              ),
              Expanded(
                  child: IconButton(
                      icon: Icon(
                        Icons.add_shopping_cart,
                        color: Colors.deepOrangeAccent,
                      ),
                      color: Colors.green,
                      onPressed: null))
            ],
          ),
          Divider(
            color: Colors.green,
          ),
          ListTile(
            title: Text("Product Details"),
            subtitle: Text(
                "Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs."),
          )
        ],
      ),
    );
  }
}
