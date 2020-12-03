import 'package:flutter/material.dart';
import 'package:welcome_demo/size_config.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

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
                    RatingBar.builder(
                    initialRating: 3,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      itemSize: 20,
                      onRatingUpdate: (rating) {
                        print(rating);
                      },
                    )
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