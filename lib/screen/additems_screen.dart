import 'package:flutter/material.dart';
import 'package:practies_app/constant/app_color.dart';
import 'package:practies_app/constant/app_product.dart';

class AddToCart_Screen extends StatefulWidget {
  AddToCart_Screen({
    super.key,
  });

  @override
  State<AddToCart_Screen> createState() => _AddToCart_ScreenState();
}

class _AddToCart_ScreenState extends State<AddToCart_Screen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.main,
        title: Text("Shopping Carts"),
      ),
      body: additemslist.isEmpty
          ? Center(child: Text("No Items In Cart"))
          : ListView.builder(
              itemCount: additemslist.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 100,
                    decoration: BoxDecoration(
                        color: Colors.black12,
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.image,
                          size: 90,
                          color: Colors.grey,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(additemslist[index]["title"],
                                  style: TextStyle(fontSize: 25)),
                              Text(additemslist[index]["price"],
                                  style: TextStyle(fontSize: 20)),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Align(
                              alignment: Alignment.topRight,
                              child: Column(
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        setState(() {
                                          additemslist.removeAt(index);
                                        });
                                      },
                                      icon: Icon(Icons.delete)),
                                  Container(
                                    height: 25,
                                    width: 80,
                                    decoration: BoxDecoration(
                                        color: Colors.grey,
                                        borderRadius: BorderRadius.circular(5)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Icon(Icons.remove),
                                        Text(product[index]["quantity"] =1
                                            .toString()),
                                        InkWell(
                                            onTap: () => setState(() {}),
                                            child: Icon(Icons.add)),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              }),
    ));
  }
}

int count = 0;
