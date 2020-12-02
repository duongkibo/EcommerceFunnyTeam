import 'package:flutter/material.dart';
import 'package:welcome_demo/size_config.dart';

class CardCataLog extends StatelessWidget{
  const CardCataLog ({Key key, this.image, this.productName, this.cost, this.branch,}) : super(key: key);
  final String image;
  final String productName;
  final String cost;
  final String branch;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SizedBox(
      child: Card(
        child: Row(
          children: <Widget>[
            Image.asset(
              image,
              width: SizeConfig.screenWidth*0.3,
            ),
            Column(
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
                    ],
                  ),
                Row(
                  children: <Widget>[
                    Text(
                      branch
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Text(
                        'đánh giá sao ',
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Text(
                        cost
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