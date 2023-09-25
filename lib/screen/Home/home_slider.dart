import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:practies_app/constant/app_product.dart';

class Home_Slider extends StatelessWidget {
  const Home_Slider({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CarouselSlider.builder(
        options: CarouselOptions(
          // autoPlay: true,
          height: 200),
        itemCount: imglist.length,
        itemBuilder: (context, index, realindex) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Image.network(imglist[index],),
          );
        },
      ),
    );
  }
}
