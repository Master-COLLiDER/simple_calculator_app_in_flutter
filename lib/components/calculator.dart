import 'package:calculator_app/components/Keys.dart';
import 'package:calculator_app/components/display.dart';
import 'package:calculator_app/components/processor.dart';
import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {

  Calculator({ Key key }) : super(key: key);

  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  final String patternNumbers ='0123456789';
  final String patternOperators = "+-÷x.";
  final String patternFunctions = "=AC";

   String keypadInput='';
   List<String> keypadInputHistory=List();
   String _mainDisplayOutput ='';
   String _miniDisplayOutput = '';




  @override
  Widget build(BuildContext context) {
  if(keypadInputHistory.isEmpty)
      keypadInputHistory.add('');
//    Size screen = MediaQuery.of(context).size;

    //double buttonSize = screen.width / 4;
  //  double buttonHeight = (screen.height-180)*5;
//    double displayHeight = screen.height - (buttonSize * 5) - (buttonSize);
    double displayHeight =225;

    return Scaffold(
      backgroundColor: Colors.grey[900],
     // backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(

            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              Display(outputMain: _mainDisplayOutput,outputMini: _miniDisplayOutput, height: displayHeight),
           //   KeyPad(outputValue: _output,outputHistory: _history,),
                Column(

                 children: [
                   Row(
                    children: <Widget>[
                      KeypadKeys(
                        value: 'AC',
                        textcolor: Colors.orange[800],
                        color: Colors.grey[300],
                        updateInput: (){
                          keypadInputAllClear();
                        },

                      ),
                      KeypadKeys(
                        value: '←',
                        textcolor: Colors.orange,
                        color: Colors.grey[300],
                        updateInput: (){
                          keypadInputBack();
                        },
                      ),
                      KeypadKeys(
                        value: '%',
                        textcolor: Colors.grey[800],
                        color: Colors.grey[300],
                        updateInput: (){
                          percentageAdder();
                        },
                      ),
                      KeypadKeys(
                        value: '÷',
                        textcolor: Colors.grey[800],
                        color: Colors.grey[300],
                        updateInput: (){
                          keypadInputAdd('÷');
                        },
                      ),

                    ]
                ),
                   Row(
                    children: <Widget>[
                      KeypadKeys(
                        value: '7',
                        textcolor: Colors.grey[800],
                        color: Colors.grey[300],
                        updateInput: (){
                          keypadInputAdd('7');
                        },

                      ),
                      KeypadKeys(
                        value: '8',
                        textcolor: Colors.grey[800],
                        color: Colors.grey[300],

                        updateInput: (){
                          keypadInputAdd('8');
                        },

                      ),
                      KeypadKeys(
                        value: '9',
                        textcolor: Colors.grey[800],
                        color: Colors.grey[300],
                        updateInput: (){
                          keypadInputAdd('9');
                        },

                      ),
                      KeypadKeys(
                        value: 'x',
                        textcolor: Colors.grey[800],
                        color: Colors.grey[300],
                        updateInput: (){
                          keypadInputAdd('x');
                        },
                      ),
                    ]
                ),
                   Row(
                    children: <Widget>[
                      KeypadKeys(
                        value: '4',
                        textcolor: Colors.grey[800],
                        color: Colors.grey[300],
                        updateInput: (){
                          keypadInputAdd('4');
                        },

                      ),
                      KeypadKeys(
                        value: '5',
                        textcolor: Colors.grey[800],
                        color: Colors.grey[300],
                        updateInput: (){
                          keypadInputAdd('5');
                        },

                      ),
                      KeypadKeys(
                        value: '6',
                        textcolor: Colors.grey[800],
                        color: Colors.grey[300],
                        updateInput: (){
                          keypadInputAdd('6');
                        },
                      ),
                      KeypadKeys(
                        value: '-',
                        textcolor: Colors.grey[800],
                        color: Colors.grey[300],
                        updateInput: (){
                          keypadInputAdd('-');
                        },
                      ),
                    ]
                ),
                   Row(
                    children: <Widget>[
                      KeypadKeys(
                        value: '1',
                        textcolor: Colors.grey[800],
                        color: Colors.grey[300],
                        updateInput: (){
                          keypadInputAdd('1');
                        },
                      ),
                      KeypadKeys(
                        value: '2',
                        textcolor: Colors.grey[800],
                        color: Colors.grey[300],
                        updateInput: (){
                          keypadInputAdd('2');
                        },
                      ),
                      KeypadKeys(
                        value: '3',
                        textcolor: Colors.grey[800],
                        color: Colors.grey[300],
                        updateInput: (){
                          keypadInputAdd('3');
                        },
                      ),
                      KeypadKeys(
                        value: '+',
                        textcolor: Colors.grey[800],
                        color: Colors.grey[300],
                        updateInput: (){
                          keypadInputAdd('+');
                        },
                      ),
                    ]
                ),
                   Row(
                    children: <Widget>[

                      KeypadKeys(
                        value: '0',
                        textcolor: Colors.grey[800],
                        color: Colors.grey[300],
                        updateInput: (){
                          keypadInputAdd('0');
                        },
                      ),
                      KeypadKeys(
                        value: '.',
                        textcolor: Colors.grey[800],
                        color: Colors.grey[300],
                        updateInput: (){
                          keypadInputDot();
                        },
                      ),
                      KeypadKeys(
                        value: '=',
                        textcolor: Colors.white,
                        color: Colors.orange[800],
                        updateInput: (){
                          keypadInputEquals();
                        },
                      ),
                    ]
                )
              ]
          )
            ]
        ),
      ),

    );
  }


  void keypadInputEquals()  // the equal function waiting to updated
  {
    String exp = "+/-÷%.x";
    String _result = Processor().evaluate(keypadInput).toString();
    if(_result=="Error")
      updateMainDisplay(_result);
    else{
      if(keypadInput.isNotEmpty&&(!exp.contains(keypadInput[keypadInput.length-1])))
      {
        keypadInputHistory.add(keypadInput);
        keypadInput = _result;
      }
      else
      if(keypadInput.isNotEmpty&&exp.contains(keypadInput[keypadInput.length-1]))
      {
        keypadInputHistory.add(keypadInput.substring(0,keypadInput.length-1));
        keypadInput =_result;

      }
      updateDisplay(keypadInput,keypadInputHistory.last);
    }
  }




  void keypadInputBack() //Backspace for the keypad input and to go back to history
  {
    if(keypadInput=='')
    {
      if(keypadInputHistory.length>1)
        {
          keypadInput=keypadInputHistory.removeLast();
        }
      //update keyboardInputHistory
    }
    else
      keypadInput= keypadInput.substring(0,keypadInput.length-1);
    updateDisplay(keypadInput, keypadInputHistory.last);

  }


  void updateMainDisplay(String displayOutput)  // update the main display input and result viewer
  {
    setState(() {
      _mainDisplayOutput= displayOutput;
    });
  }

  void updateMiniDisplay(String displayOutput) //update the mini display history viewer
  {
    setState(() {
      _miniDisplayOutput = displayOutput;
    });
  }

  void updateDisplay(String mainDisplayOutput, String miniDisplayOutput)//update the whole display
  {
    setState(() {
      _mainDisplayOutput = mainDisplayOutput;
      _miniDisplayOutput = miniDisplayOutput;
    });
  }


  void keypadInputAdd(String input) //Input operator and number in the keyboardinput
  {


    if(patternNumbers.contains(input))//for number
        {
      keypadInput =keypadInput =='0'?input: keypadInput+input;
    }//for number
    else
    if(patternOperators.contains(input))//for operators
        {
    if(keypadInput==''&&input=='-')
      keypadInput='-';
    else
      if(keypadInput.isNotEmpty&&(!patternOperators.contains(keypadInput[keypadInput.length-1])))
      {
        keypadInput = keypadInput+input;
      }
      else
      if(keypadInput.length>1&&('+-÷x.'.contains(keypadInput[keypadInput.length-1])))
        {
          if(!('+-÷x.'.contains(keypadInput[keypadInput.length-2]))&&input!='-')
        {
          keypadInput=keypadInput.substring(0,keypadInput.length-1)+input;
          }
          else
          if(!('+-÷x.'.contains(keypadInput[keypadInput.length-2]))&&input=='-')
          {
            keypadInput=keypadInput+input;
          }


      }


    }//for operators
    updateMainDisplay(keypadInput);
  }//keypadInputAdd


  void keypadInputAllClear() //AC buttion funcion
  {
    keypadInputHistory.clear();
    keypadInputHistory.add('');
    updateDisplay(keypadInput ='',keypadInputHistory.last);
  }


  bool containsDot(String string) //containsDot checker for dot in a number
  {

    for(int i = string.length-1; i>=0;i--)
    {
      if(string[i]=='.')
        return true;
      else
      if(patternOperators.contains(string[i]))
        return false;
    }
    return false;
  }

  void keypadInputDot() // Point adder function to add point in between
  {
    if(keypadInput==''||keypadInput=='0')
    {
      keypadInput = '0.';
    }
    else
    if(keypadInput.isNotEmpty&&!patternOperators.contains(keypadInput[keypadInput.length-1]))
    {
      if(!containsDot(keypadInput))
        keypadInput = keypadInput+'.';
    }
    updateMainDisplay(keypadInput);
  }

  percentageAdder()
  {
    int i = keypadInput.length;

    if(keypadInput!='')
      if(i>0)
      if(!'+-x÷'.contains(keypadInput[i-1])) {
        while (i >0)
          {
            if('+-x÷'.contains(keypadInput[i-1]))
              break;
            i--;
          }


        String kS = keypadInput.substring(0,i);
        String s = keypadInput.substring(i,keypadInput.length);
        keypadInput=kS+(num.parse(s)/100).toString();
      }
    updateMainDisplay(keypadInput);

  }

}