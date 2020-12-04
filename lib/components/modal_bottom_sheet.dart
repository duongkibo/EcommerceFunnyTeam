import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:welcome_demo/components/defaul_button.dart';
import '../size_config.dart';

class DefaultModalBottomSheet extends StatelessWidget {
  final String text;
  final BuildContext context;
  static const List<String> sizes = ['XS', 'S', 'M', 'L', 'XL'];
  const DefaultModalBottomSheet({Key key, this.text, this.context}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    showModalBottomSheet(
      elevation: 1.0,
      context: context,
      builder: (context){
        return SizedBox(width: double.infinity,
          height: MediaQuery.of(context).size.height*.5,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(height: getProportionateScreenHeight(5)),
            Text(text, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),),
            SizedBox(height: getProportionateScreenHeight(25)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.baseline,
              children: List.generate(sizes.length, (index) => memorySizeBox(size: sizes[index]))
            ),
            SizedBox(height: getProportionateScreenHeight(15)),
            Divider(thickness: 1.0),
            ListTile(title: Text('Size Info'), trailing: IconButton(icon: Icon(Icons.arrow_forward_ios), onPressed: (){})),
            Divider(thickness: 1.0),
            Expanded(
                // padding: EdgeInsets.symmetric(horizontal: getProportionateScreenHeight(20)),
                child: Column(
                  children: [
                    SizedBox(height: getProportionateScreenHeight(35),),
                    DefaultButton(text: 'PRIMARY', press: (){}),
                    Spacer()
                  ],
            )
            )],
        ),);
      });
  }

  Row memorySizeBox({String size}) {
    return Row(
      children: [
        GestureDetector(
          onTap: (){},
          child: Container(
            padding: EdgeInsets.only(top: 10),
            width: MediaQuery.of(context).size.width*.15,
            height: getProportionateScreenHeight(40),
            decoration: BoxDecoration(shape: BoxShape.rectangle, border: Border.all(width: 1.0, color: Colors.black), borderRadius: BorderRadius.circular(5)),
            child:
            Text(size, style: TextStyle(fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
          ),
        ),
        SizedBox(width: getPropotionateScreenWitdh(10))
      ],
    );
  }
}
