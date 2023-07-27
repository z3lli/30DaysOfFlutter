// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:pubguc/models/catalog.dart';
import 'package:pubguc/widgets/theme.dart';

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
    //await Future.delayed(Duration(seconds: 5));
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
      backgroundColor: MyTheme.creamColor,
      body: SafeArea(
        child: Container(
          padding: Vx.m32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CatalogHeader(),
              if (CatalogModel.Items != null && CatalogModel.Items.isNotEmpty)
                CatalogList().expand()
              else
                Center(
                  child: CircularProgressIndicator(),
                )
            ],
          ),
        ),
      ),
    );
  }
}

class CatalogHeader extends StatelessWidget {
  const CatalogHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Catalog App".text.xl5.bold.color(MyTheme.darkBluisColor).make(),
        "Trending products".text.xl2.make(),
      ],
    );
  }
}

class CatalogList extends StatelessWidget {
  const CatalogList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogModel.Items.length,
      itemBuilder: (context, index) {
        final catalog = CatalogModel.Items[index];
        return CatalogItem(catalog: catalog);
      },
    );
  }
}

class CatalogItem extends StatelessWidget {
  final catalog;
  const CatalogItem({
    Key? key,
    required this.catalog,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return VxBox(
        child: Row(
      children: [
        CatalogImage(image: catalog.image),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              catalog.name,
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: MyTheme.darkBluisColor),
            ),
            Text(
              catalog.desc,
              style: TextStyle(fontSize: 11, color: MyTheme.darkBluisColor),
            ),
            10.heightBox,
            ButtonBar(
              alignment: MainAxisAlignment.spaceBetween,
              buttonPadding: EdgeInsets.zero,
              children: [
                Text(
                  "\$${catalog.price.toString()}",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: MyTheme.darkBluisColor),
                ),
                ElevatedButton(
                  onPressed: (() {}),
                  child: "Buy".text.make(),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      MyTheme.darkBluisColor,
                    ),
                    shape: MaterialStateProperty.all(
                      StadiumBorder(),
                    ),
                  ),
                )
              ],
            ).pOnly(right: 9)
          ],
        ))
      ],
    )).white.roundedLg.square(150).make().py16();
  }
}

class CatalogImage extends StatelessWidget {
  final String image;

  const CatalogImage({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Image.network(image)
        .box
        .rounded
        .p8
        .color(MyTheme.creamColor)
        .make()
        .p16()
        .w40(context);
  }
}
