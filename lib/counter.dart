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
            "$counter",
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
            FloatingActionButton(
                backgroundColor: Colors.black,
                child: Icon(Icons.exposure_minus_1),
                onPressed: () {
                  setState(() {
                    counter -= 1;
                  });
                }),
            FloatingActionButton(
                backgroundColor: Colors.black,
                child: Icon(Icons.exposure_plus_1),
                onPressed: () {
                  setState(() {
                    counter += 1;
                  });
                }),
          ],
        )
      ],
    );
  }
}
