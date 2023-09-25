import 'package:flutter/material.dart';
import 'package:practies_app/constant/app_color.dart';
import 'package:practies_app/screen/Home/homeview.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: PreferredSize(
              preferredSize: Size(double.infinity, 200),
              child: AppBar(
                elevation: 0,
                backgroundColor: AppColor.main,
                flexibleSpace: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hey",
                        style: TextStyle(fontSize: 40),
                      ),
                      Expanded(
                          child: Container(
                        height: 50,
                        color: AppColor.main,
                        alignment: Alignment.centerLeft,
                        child: SizedBox(
                          child: TextField(
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.search),
                                labelText: "Search Your Product",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                )),
                          ),
                        ),
                      ))
                    ],
                  ),
                ),
              )),
          body: HomeView()
          ),
    );
  }
}
