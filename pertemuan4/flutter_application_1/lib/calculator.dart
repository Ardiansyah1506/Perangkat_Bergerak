import 'package:flutter/material.dart';

enum Symbol { operand, operator }

enum Operator { bagi, kali, kurangi, tambah, ce, eq }

class Calculator extends StatefulWidget {
  const Calculator({super.key});
  @override
  State<StatefulWidget> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  double hasil = 0;
  String lhs = '', rhs = '';
  Operator? operator;
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
      Padding(
          padding: const EdgeInsets.only(top: 7, bottom: 7),
          child: Column(children: [
            Text(lhs, style: Theme.of(context).textTheme.bodySmall),
            Text(rhs, style: Theme.of(context).textTheme.bodySmall),
            Text(hasil.toString(),
                style: Theme.of(context).textTheme.displayLarge)
          ])),
      CalculatorButtons(
        callback: (Symbol symbol, Object value) {
          setState(() {
            switch (symbol) {
              case Symbol.operator:
                switch (value as Operator) {
                  case Operator.eq:
                    double lhsDouble = double.parse(lhs),
                        rhsDouble = double.parse(rhs);
                    // count
                    switch (operator!) {
                      case Operator.bagi:
                        hasil = lhsDouble / rhsDouble;
                        break;
                      case Operator.kali:
                        hasil = lhsDouble * rhsDouble;
                        break;
                      case Operator.kurangi:
                        hasil = lhsDouble - rhsDouble;
                        break;
                      case Operator.tambah:
                        hasil = lhsDouble + rhsDouble;
                        break;
                      default:
                        break;
                    }
                    lhs = hasil.toString();
                    rhs = '';
                    break;
                  case Operator.ce:
                    hasil = 0;
                    lhs = '';
                    rhs = '';
                    operator = null;
                    break;
                  default:
                    operator = value;
                    break;
                }
                break;
              case Symbol.operand:
                if (operator == null) {
                  lhs += value.toString();
                } else {
                  rhs += value.toString();
                }
                break;
            }
          });
        },
      )
    ]);
  }
}

class CalculatorButtons extends StatelessWidget {
  final Function(Symbol symbol, Object value) callback;
  const CalculatorButtons({super.key, required this.callback});
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 4,
      mainAxisSpacing: 7,
      crossAxisSpacing: 7,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children: [
        CalculatorButton(
            string: "7",
            onPressed: () {
              callback(Symbol.operand, '7');
            }),
        CalculatorButton(
            string: "8",
            onPressed: () {
              callback(Symbol.operand, '8');
            }),
        CalculatorButton(
            string: "9",
            onPressed: () {
              callback(Symbol.operand, '9');
            }),
        CalculatorButton(
            string: "/",
            onPressed: () {
              callback(Symbol.operator, Operator.bagi);
            }),
        CalculatorButton(
            string: "4",
            onPressed: () {
              callback(Symbol.operand, '4');
            }),
        CalculatorButton(
            string: "5",
            onPressed: () {
              callback(Symbol.operand, '5');
            }),
        CalculatorButton(
            string: "6",
            onPressed: () {
              callback(Symbol.operand, '6');
            }),
        CalculatorButton(
            string: "x",
            onPressed: () {
              callback(Symbol.operator, Operator.kali);
            }),
        CalculatorButton(
            string: "1",
            onPressed: () {
              callback(Symbol.operand, '1');
            }),
        CalculatorButton(
            string: "2",
            onPressed: () {
              callback(Symbol.operand, '2');
            }),
        CalculatorButton(
            string: "3",
            onPressed: () {
              callback(Symbol.operand, '3');
            }),
        CalculatorButton(
            string: "-",
            onPressed: () {
              callback(Symbol.operator, Operator.kurangi);
            }),
        CalculatorButton(
            string: "CE",
            onPressed: () {
              callback(Symbol.operator, Operator.ce);
            }),
        CalculatorButton(
            string: "0",
            onPressed: () {
              callback(Symbol.operand, '0');
            }),
        CalculatorButton(
            string: "=",
            onPressed: () {
              callback(Symbol.operator, Operator.eq);
            }),
        CalculatorButton(
            string: "+",
            onPressed: () {
              callback(Symbol.operator, Operator.tambah);
            }),
        const SizedBox.shrink(),
        CalculatorButton(
            string: ".",
            onPressed: () {
              callback(Symbol.operand, '.');
            }),
      ],
    );
  }
}

class CalculatorButton extends StatelessWidget {
  final String string;
  final Function() onPressed;
  const CalculatorButton(
      {super.key, required this.string, required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: onPressed, child: Text(string));
  }
}
