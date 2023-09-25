import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:practies_app/constant/app_color.dart';
import 'package:practies_app/constant/app_product.dart';

class FavorideScreen extends StatefulWidget {
  const FavorideScreen({super.key});

  @override
  State<FavorideScreen> createState() => _FavorideScreenState();
}

class _FavorideScreenState extends State<FavorideScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: AppColor.main,
          ),
          body: Padding(
            padding: const EdgeInsets.all(10),
            child: favlist.isEmpty
                ? Center(
                    child: Text("You Have No Favoride Item"),
                  )
                : GridView.builder(
                    itemCount: favlist.length,
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
                                      favlist[index]["title"],
                                      style: TextStyle(fontSize: 20),
                                    ),
                                    Text(
                                      favlist[index]["price"],
                                      style: TextStyle(fontSize: 15),
                                    ),
                                  ],
                                ),
                                Expanded(
                                  child: IconButton(
                                      onPressed: () {
                                         Fluttertoast.showToast(msg: "Product Remove To Favoride",gravity: ToastGravity.BOTTOM);
                                        setState(() {
                                          favlist.removeAt(index);
                                        });
                                      },
                                      icon: Icon(Icons.favorite,color: product[index]["isfav"]
                                            ? Colors.red
                                            : Colors.white,)),
                                )
                              ],
                            )
                          ],
                        ),
                      );
                    }),
          )),
    );
  }
}
