import 'package:flutter/material.dart';
import 'package:practies_app/screen/Home/buttomnavigat.dart';

class Scroll_Screen extends StatelessWidget {
  const Scroll_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView(
      children: [FirstScroll(), SecondScroll()],
    );
  }
}

class FirstScroll extends StatelessWidget {
  const FirstScroll({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.grey.shade400,
        child: Center(
            child: Text(
          "Unlock The Possibilities: The World of Mobiles at Your Fingertips",
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
        )),
      ),
    );
  }
}

class SecondScroll extends StatelessWidget {
  const SecondScroll({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
         child: Image.network("https://i.pinimg.com/1200x/e2/60/e6/e260e61000c6845d12c67e0fbdfcde8f.jpg",fit: BoxFit.cover,height: double.infinity,),
        ),
        Positioned(
          bottom: 80,
          left: 60,
          right: 60,
          child: SizedBox(
            height: 60,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20))),
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => ButtomNavigator()));
              },
              child: Text(
                "Get Started",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        )
      ]),
    );
  }
}
