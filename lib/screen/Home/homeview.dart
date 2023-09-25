import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:practies_app/screen/Home/home_slider.dart';
import 'package:practies_app/constant/app_product.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(width: double.infinity, height: 185, child: Home_Slider()),
            SizedBox(
              child: Center(
                  child: Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Text(
                  "Top Brands Shops",
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ),
              )),
            ),
            Expanded(
                child: CarouselSlider.builder(
              options: CarouselOptions(
                  // autoPlay: true,
                  height: 200),
              itemCount: brandshop.length,
              itemBuilder: (context, index, realindex) {
                return ClipRRect(
                    borderRadius: BorderRadius.circular(12.5),
                    child: Container(
                      height: 200,
                      width: 160,
                      child: Image.network(
                        brandshop[index],
                        fit: BoxFit.fill,
                      ),
                    ));
              },
            ))
          ],
        ),
      ),
    );
  }
}
