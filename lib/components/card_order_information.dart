import 'package:flutter/material.dart';
import 'package:welcome_demo/size_config.dart';

class CardOrderInformation extends StatelessWidget{
  const CardOrderInformation ({Key key, this.image, this.productName, this.size, this.color, this.units, this.cost, this.branch}) : super(key: key);
  final String image;
  final String productName;
  final String color;
  final String size;
  final String cost;
  final String units;
  final String branch;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SizedBox(
      width: double.infinity,
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: Row(
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
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Text(branch),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Text('Color: '),Text(color, style: TextStyle(fontWeight: FontWeight.bold),),
                    Text('  '),
                    Text('Size: '),Text(size, style: TextStyle(fontWeight: FontWeight.bold),),
                    SizedBox(width: getPropotionateScreenWitdh(SizeConfig.screenWidth*0.2),),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Text(
                      'Units :'
                    ),
                    Text(
                      units,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: getPropotionateScreenWitdh(SizeConfig.screenWidth*0.15),),
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