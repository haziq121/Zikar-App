import 'package:flutter/material.dart';
import 'package:vibration/vibration.dart';
// import 'package:zikar_app/main.dart';
import 'main.dart';

class ZikarCountScreen extends StatefulWidget {
  final Zikar zikar;
  const ZikarCountScreen({super.key, required this.zikar});
  @override
  State<StatefulWidget> createState() {
    return _ZikarCountScreen();
  }
}

class _ZikarCountScreen extends State<ZikarCountScreen> {
  int count = 0;
  bool completed = false;
  void _increasecount() {
    setState(() {
      count++;
      if (count >= widget.zikar.target) {
        completed = true;
        Vibration.vibrate(duration: 500);
      }
    });
  }

  void _resetcount() {
    setState(() {
      count = 0;
      completed = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:completed? Colors.amber: Colors.teal,
      appBar: AppBar(
        title: Text(
          "اَلَا بِذِکْرِ اللہِ تَطْمَئِنُّ الْقُلُوۡبُ",
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 31, 98, 100),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(120),
          child: Column(
            children: [
              Text(widget.zikar.arabic, style: TextStyle(fontSize: 50)),
              SizedBox(height: 10),
              Text(" $count/ ${widget.zikar.target}", style: TextStyle(fontSize: 30)),
              SizedBox(height: 50),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: _increasecount,
                    child: Icon(Icons.add, size: 35),
                  ),
                  SizedBox(width: 30),
                  ElevatedButton(
                    onPressed: _resetcount,
                    child: Icon(Icons.refresh),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
