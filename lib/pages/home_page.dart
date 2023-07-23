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
    await Future.delayed(Duration(seconds: 2));
    var cataLogJson = await rootBundle.loadString("assets/files/catalog.json");
    var decoderData = jsonDecode(cataLogJson);
    var productData = decoderData["products"];
    List<Item> list = CatalogModel.Items =
        List.from(productData).map<Item>((item) => Item.fromMap(item)).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    int days = 30;
    String name = "usama";
    // final dummylist = List.generate(50, (index) => CatalogModel.Items[0]);

    return Scaffold(
      appBar: AppBar(
        title: Text("Catalog"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: (CatalogModel.Items != null && CatalogModel.Items.isNotEmpty)
            ? ListView.builder(
                itemCount: CatalogModel.Items.length,
                itemBuilder: (context, index) {
                  return ItemWidgets(
                    item: CatalogModel.Items[index],
                  );
                },
              )
            : Center(
                child: CircularProgressIndicator(),
              ),
      ),
      drawer: MyDrawer(),
    );
  }
}
