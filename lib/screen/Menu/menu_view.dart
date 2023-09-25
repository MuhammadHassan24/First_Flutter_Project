import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:practies_app/constant/app_color.dart';
import 'package:practies_app/constant/app_product.dart';
import 'package:practies_app/screen/additems_screen.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  List categories = [
     "Sumsung",
    "Apple",
     "Oneplus",
     "Vivo",
     "Xiaomi",
  ];
  int selectedindex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text("Shops And Product"),
        backgroundColor: AppColor.main,
        actions: [
          Column(
            children: [
              Stack(children: [
                IconButton(
                  onPressed: () async {
                    await Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AddToCart_Screen()));
                    setState(() {});
                  },
                  icon: Icon(
                    Icons.shopping_bag_outlined,
                  ),
                ),
                Positioned(
                  right: 6,
                  top: 7,
                  child: CircleAvatar(
                    radius: 7.5,
                    backgroundColor: Colors.red,
                    child: Center(
                      child: Text(
                        additemslist.length.toString(),
                        style: TextStyle(fontSize: 10),
                      ),
                    ),
                  ),
                ),
              ]),
            ],
          )
        ],
      ),
      body: Scaffold(
          body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: SizedBox(
                width: double.infinity,
                height: 45,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: categories.length,
                    itemBuilder: ((context, index) {
                      return Column(
                        
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedindex = index;
                              });
                            },
                            child: Container(
                              margin: EdgeInsets.all(5),
                              height: 35,
                              width: 100,
                              decoration: BoxDecoration(
                                color: selectedindex == index
                                    ? AppColor.category
                                    : Colors.white54,
                                borderRadius: selectedindex == index
                                    ? BorderRadius.circular(15)
                                    : BorderRadius.circular(10),
                                border: selectedindex == index
                                    ? Border.all(
                                        color: Colors.deepPurpleAccent,
                                        width: 2)
                                    : null,
                              ),
                              child: Center(
                                child: Text(
                                  categories[index].toString(),
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                            ),
                          )
                        ],
                      );
                    }))),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: GridView.builder(
                  itemCount: product.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 0.85,
                      mainAxisSpacing: 10,
                      crossAxisCount: 2),
                  itemBuilder: (context, index) {
                    return Container(
                      padding: EdgeInsets.all(4),
                      margin: EdgeInsets.only(left: 10),
                      height: 200,
                      width: 140,
                      decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(12.5)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              SizedBox(
                                height: 25,
                                child: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        additemslist.add(product[index]);
                                      });
                                    },
                                    icon: Icon(Icons.add)),
                              )
                            ],
                          ),
                          Center(
                            child: Icon(
                              Icons.image,
                              size: 115,
                              color: Colors.grey,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    product[index]["title"].toString(),
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  Text(
                                    product[index]["price"].toString(),
                                    style: TextStyle(fontSize: 15),
                                  ),
                                ],
                              ),
                              Expanded(
                                child: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        if (product[index]["isfav"]) {
                                          product[index]["isfav"] = false;
                                          favlist.remove(product[index]);
                                          Fluttertoast.showToast(
                                              msg: "Product Remove To Favoride",
                                              gravity: ToastGravity.BOTTOM);
                                        } else {
                                          product[index]["isfav"] = true;
                                          Fluttertoast.showToast(
                                              msg: "Product Add To Favoride",
                                              gravity: ToastGravity.BOTTOM);
                                          favlist.add(product[index]);
                                        }
                                      });
                                    },
                                    icon: Icon(
                                      Icons.favorite,
                                      color: product[index]["isfav"]
                                          ? Colors.red
                                          : Colors.white,
                                    )),
                              )
                            ],
                          )
                        ],
                      ),
                    );
                  }),
            ),
          )
        ],
      )),
    ));
  }
}
