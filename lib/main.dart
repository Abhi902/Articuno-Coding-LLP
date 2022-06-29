import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Color? pc1; // COLORS TO BE PASSED TO THE CONTAINERS  1
  Color? pc2; // COLORS TO BE PASSED TO THE CONTAINERS 2
  int x = 0;
  int y = 1;

  void initState() {
    super.initState();
    pc1 = Colors.primaries[Random().nextInt(Colors.primaries.length)];
    pc2 = Colors.primaries[Random().nextInt(Colors
        .primaries.length)]; // USED RANDOM COLORIZATION IN THE INIT STATE :)
  }

  Widget build(BuildContext context) {
    var arr = [
      reusablewidget(pc1),
      reusablewidget(pc2)
    ]; // ARRAY OF CONTAINERS AS YOU ASKED :)

    void setstate() {
      if (x == 1) {
        x = 0;
        y = 1; // function to swap two containers by changing the index in the array
      } else {
        x = 1;
        y = 0;
      }
    }

    return Scaffold(
      backgroundColor: Colors.blue[900],
      appBar: AppBar(
        title: Text(
            'ARTICUNO CODING'), // TITLE FOR THE APP BAR  , IT MAKE THE APP LOOK LIKE AN APP
      ),
      body: Column(
        children: [
          Row(
            children: <reusablewidget>[
              arr[x],
              arr[y]
            ], // used the array of widget to swap the two container
          ),
          SizedBox(height: 300),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.indigo),
            ),
            onPressed: () {
              setState(() {
                // here is the swap button , could have made it better but it does the work
                setstate();
              });
            },
            child: Text(
              'swap',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}

class reusablewidget extends StatelessWidget {
  // I MADE THE NEW CLASS FOR THE CONTAINER BECAUSE IT WAS THE REPETATIVE PROCESS TO CREATE THEM AGAIN AND AGAIN
  Color? color;
  reusablewidget(this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      // I GAVE THE CONTAINERS A LITTLE BIT OF DECORATION HOPE YOU FIND WELL PRESENTED
      margin: EdgeInsets.all(15),
      decoration: BoxDecoration(
        // this is the stateless container class
        borderRadius: BorderRadius.circular(15),
        color: color,
      ),
      height: 180,
      width: 150,
    );
  }
}
