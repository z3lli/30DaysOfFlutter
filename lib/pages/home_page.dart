import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pubguc/models/catalog.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:convert';
import '../widgets/drawer.dart';
import '../widgets/item_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 5));
    var cataLogJson = await rootBundle.loadString("assets/files/catalog.json");
    var decoderData = jsonDecode(cataLogJson);
    var productsData = decoderData["products"];
    CatalogModel.Items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    int days = 30;
    String name = "usama";
    //final dummylist = List.generate(50, (index) => CatalogModel.Items[0]);

    return Scaffold(
      appBar: AppBar(
        title: Text("Catalog"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: (CatalogModel.Items != null && CatalogModel.Items.isNotEmpty)
            ? GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 20,
                ),
                itemBuilder: ((context, index) {
                  final item = CatalogModel.Items[index];
                  return Card(
                      clipBehavior: Clip.antiAlias,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: GridTile(
                        header: Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(color: Colors.deepPurple),
                            child: Text(
                              item.name,
                              style: TextStyle(color: Colors.white),
                            )),
                        child: Image.network(item.image),
                        footer: Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(color: Colors.black),
                            child: Text(
                              item.price.toString(),
                              style: TextStyle(color: Colors.white),
                            )),
                      ));
                }),
                itemCount: CatalogModel.Items.length,
              )
            : Center(
                child: CircularProgressIndicator(),
              ),
      ),
      drawer: MyDrawer(),
    );
  }
}
