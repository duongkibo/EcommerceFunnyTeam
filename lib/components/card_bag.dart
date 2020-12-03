import 'package:flutter/material.dart';
import 'package:welcome_demo/size_config.dart';

class CardBag extends StatelessWidget{
  const CardBag ({Key key, this.image, this.productName, this.functionMenu, this.size, this.color, this.quantity, this.functionAdd
  , this.functionRemove, this.cost}) : super(key: key);
  final String image;
  final String productName;
  final Function functionMenu;
  final Function functionRemove;
  final Function functionAdd;
  final String color;
  final String size;
  final String cost;
  final String quantity;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SizedBox(
      width: double.infinity,
      child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Image.asset(
              image,
              width: SizeConfig.screenWidth*0.3,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text(
                      productName,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                      ),
                    ),
                    SizedBox(width: getPropotionateScreenWitdh(SizeConfig.screenWidth*0.18),),
                    IconButton(
                        icon: Icon(Icons.more_vert),
                        onPressed: functionMenu
                    )
                  ],
                ),
                Row(
                  children: <Widget>[
                    Text('Color: '),Text(color, style: TextStyle(fontWeight: FontWeight.bold),),
                    Text('  '),
                    Text('Size: '),Text(size, style: TextStyle(fontWeight: FontWeight.bold),),
                  ],
                ),
                Row(
                  children: <Widget>[
                    SizedBox(
                      width: SizeConfig.screenWidth*0.12,
                      height: SizeConfig.screenHeight*0.1,
                      child: FloatingActionButton(
                          backgroundColor: Colors.white,
                          onPressed: functionRemove,
                          child: Icon(Icons.remove),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(quantity),
                    ),
                    SizedBox(
                      width: SizeConfig.screenWidth*0.12,
                      height: SizeConfig.screenHeight*0.1,
                      child: FloatingActionButton(
                        backgroundColor: Colors.white,
                        onPressed: functionAdd,
                        child:  Icon(Icons.add),
                      ),
                    ),
                    SizedBox(width: getPropotionateScreenWitdh(SizeConfig.screenWidth*0.13),),
                    Text(
                      cost,
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}