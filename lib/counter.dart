import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {
  @override
  _CounterScreenState createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {


  var resultado = 0;

  void _operation( Function (int, int) func) {
    setState(() {
      resultado = func(resultado , 1);
    });
  }
    int add(num1,num2){
      return num1 + num2;
    }
    
    int sub(num1,num2){
      return num1 - num2;
    }
  
  
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.40,
          height: MediaQuery.of(context).size.height * 0.25,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(60),
              border: Border.all(
                color: Colors.black,
                width: MediaQuery.of(context).size.width * 0.01,
              )),
          child: Center(
              child: Text(
            "$resultado",
            style: TextStyle(
              fontSize: 50,
            ),
          )),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.2,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            OperationFloatActionButton(
              icon: Icon(Icons.exposure_minus_1),
              func: () {
                setState(() {
                  _operation(sub);
                });
              },
            ),
            OperationFloatActionButton(
              icon: Icon(Icons.exposure_plus_1),
              func: () {
                _operation(add);
              },
            ),
          ],
        )
      ],
    );
  }
}

class OperationFloatActionButton extends StatelessWidget {
  final Function func;
  final Widget icon;

  OperationFloatActionButton({Key key, this.func, this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        backgroundColor: Colors.black, child: icon, onPressed: func);
  }
}
