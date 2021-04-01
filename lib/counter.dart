import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {
  @override
  _CounterScreenState createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {

  var counter = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(child: Center(child: Text('$counter',style: TextStyle(fontSize:100),)),
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.2,),
        Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            FloatingActionButton(onPressed: (){
              setState(() {
                counter -= 1;
              });
            }),
            FloatingActionButton(onPressed: (){
              setState(() {
                counter += 1;
              });
            }),

          ],)
      ],);
  }
}