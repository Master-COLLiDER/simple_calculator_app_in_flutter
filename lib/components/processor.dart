import 'package:flutter/material.dart';

class Processor {

evaluate1(input)
{
  print(spaceAdder('56+91/-566x2'));
  return evaluate1('50+50/-5x2');
}


   spaceAdder( input)
  {
    String output = input;
    var exp = {'+','/','*','(',')','x','-'};
    if(output[0]=='-')
      output = output.replaceFirst('-', 'N');
    for(var e in exp)
      {
        output= output.replaceAll(e.toString(),' '+e.toString()+' ');
      }
    output = output.replaceAll(' -  - ', ' - -');
    output = output.replaceAll(' +  - ', ' + -');
    output = output.replaceAll(' x  - ', ' x -');
    output = output.replaceAll(' *  - ', ' * -');
    output = output.replaceAll(' /  - ', ' / -');
    output = output.replaceAll('N', '-');
    return output;
  }



   String replaceOperators(String input)
  {
    String result = input.replaceAll('x', '*');
    return result.replaceAll('÷', '/');
  }




   evaluate(String expression)
  {
    String e = expression;

    e = spaceAdder(replaceOperators(e));
    if(e==''||e==null)
      return 0;

    if(e[e.length-1]==' ')
      e = e.substring(0,e.length-2);
    List<String> tokens = e.split(' ');

    // Stack for numbers: 'values'
    List<num> values = [];
    // Stack for Operators: 'ops'
    List<String> ops = [];

    if(tokens.length<=1)
      return tokens.first;

    for (int i = 0; i < tokens.length; i++)
    {
//      print('tokens['+ i.toString() +'] : '+tokens[i]+' = is a number:');
//      print(isNumber(tokens[i])?'true':'false');
      if (isNumber(tokens[i]))
      {

        values.add(num.parse(tokens[i]));
      }
      //for bracket
//      else if (tokens[i] == '(')
//        ops.add(tokens[i]);
//
//       else if (tokens[i] == ')') {
//        if (ops.isNotEmpty)
//          while (ops.last != '(')
//            {
//              String nS = applyOp(ops.removeLast(), values.removeLast(), values.removeLast()).toString();
//              if(!isNumber(nS))
//                return nS;
//              num n = num.parse(nS);
//              values.add(n);
//            }
//        else
//           return "Error";
//
//         ops.removeLast();
//
//       }
      // Current token is an operator.
      else if (tokens[i] == '+' || tokens[i] == '-' ||
          tokens[i] == '*' || tokens[i] == '/')
      {

        if(ops.isNotEmpty)
        while (ops.isNotEmpty && ops.last!='(' && hasPrecedence(tokens[i], ops.last))
          {
            String nS = applyOp(ops.removeLast(), values.removeLast(), values.removeLast()).toString();
            if(!isNumber(nS))
              return nS;
            num n = num.parse(nS);
            values.add(n);
          }

        ops.add(tokens[i]);
      }
    }
  

    if(ops.isNotEmpty)
      while (ops.isNotEmpty)
      {
        String nS = applyOp(ops.removeLast(), values.removeLast(), values.removeLast()).toString();
        if(!isNumber(nS))
          return nS;
        num n = num.parse(nS);
        values.add(n);
      }

    return values.removeLast();

//   print('Values = '+values.toString());
//    print('Ops = '+ops.toString());
//    return ops.toString();
////

  // return 'Error';

  }


   bool hasPrecedence(String op1,String op2)
  {
//    if (op2 == '(' || op2 == ')')
//      return false;
    if ((op1 == '*' || op1 == '/') && (op2 == '+' || op2 == '-'))
      return false;
    else
      return true;
  }
  bool isNumber(String number)
  {
    if( number==null)
      return false;
    return num.tryParse(number)!=null;
  }
  applyOp(String op, num b, num a)
  {
    switch (op)
    {
      case '+':
        return a + b;
      case '-':
        return a - b;
      case '*':
        return a * b;
      case '/':
        if (b == 0)
         // throw  UnsupportedOperationException("Cannot divide by zero");
          return 'Error';
        return a / b;
    }
    return 0;
  }
}