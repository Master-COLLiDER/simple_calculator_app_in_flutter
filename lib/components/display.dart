
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

    class Display extends StatelessWidget {

      Display({ Key key, this.outputMain,this.outputMini, this.height }) : super(key: key);

      final String outputMain;
      final String outputMini;
      final double height;

      String get _mainDisplayOutput => outputMain.toString();
      String get _miniDisplayOutput => outputMini.toString();
      double get _margin => (height / 10);

      final LinearGradient _gradient = const LinearGradient(colors: [ Colors.black26, Colors.black45 ]);

      @override
      Widget build(BuildContext context) {

        TextStyle style = Theme.of(context).textTheme.headline3
            .copyWith(color: Colors.white, fontWeight: FontWeight.w200);

        return Container(
          //  padding: EdgeInsets.only(top: _margin, bottom: _margin),
            constraints: BoxConstraints.expand(height: height),
            child: Container(
                padding: EdgeInsets.fromLTRB(8, 32, 8, 32),
                constraints: BoxConstraints.expand(height: height - (_margin)),
                 decoration: BoxDecoration(gradient: _gradient),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
//                   Text(_miniDisplayOutput, style: TextStyle(color: Colors.white, fontWeight: FontWeight.w200,fontSize: 25), textAlign: TextAlign.right, ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      reverse: true,
                      child: Text(_miniDisplayOutput, style: TextStyle(color: Colors.white, fontWeight: FontWeight.w200,fontSize: 25), textAlign: TextAlign.right, ),
                    ),
                   SizedBox(height: 10,),
//                  Text(_mainDisplayOutput, style: style, textAlign: TextAlign.right, )
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    reverse: true,
                    child: Text(_mainDisplayOutput, style: style, textAlign: TextAlign.right, ),
                  )


                  ],
                )

            )
        );
      }
    }

