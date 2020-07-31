import 'package:flutter/material.dart';

class KeypadKeys extends StatelessWidget {

  KeypadKeys({Key key, this.color, this.value,this.textcolor,this.updateInput}):super(key:key);


  @required final Color color;
  @required final Color textcolor;
  @required final String value;
  final Function updateInput;



  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width / 4;
   // double height = (MediaQuery.of(context).size.height-250) / 5;
    double height = (MediaQuery.of(context).size.height-250) / 5;
    TextStyle textStyle = Theme.of(context).textTheme.headline4.copyWith(color: textcolor,);
    String s = "←";
    textStyle = s.contains(value)? Theme.of(context).textTheme.headline4.copyWith(color: textcolor,fontWeight: FontWeight.bold):textStyle;


    width = value=='0'?width*2:width;


    return  Container(

        decoration: BoxDecoration(
            border: Border.all(color: Colors.black,width: 0.5),
        ),
        width: width,
       // padding: EdgeInsets.all(0.1),

        height: height,
        child: FlatButton(

      //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
          shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(0)),
           color: color,
          // elevation: 4,
          child: Text(value, style: textStyle,),
           onPressed: updateInput,
        )
    );
  }

}
