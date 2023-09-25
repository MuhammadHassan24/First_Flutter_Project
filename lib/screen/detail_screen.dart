import 'package:flutter/material.dart';

class Detail_Screen extends StatefulWidget {
  const Detail_Screen({super.key});

  @override
  State<Detail_Screen> createState() => _Detail_ScreenState();
}

class _Detail_ScreenState extends State<Detail_Screen> {
  Stream stremCall(counter) async* {
    while (true) {
      await Future.delayed(Duration(seconds: 1));
      yield counter++;
      
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.black12,
        ),
        body: StreamBuilder(
          stream: stremCall(1),
          builder: (context, snapshot) {
            
            return Center(
                child: Text(
              "Strem : ${snapshot.data}",
              style: TextStyle(fontSize: 20),
            ));
          },
        ));
  }
}
